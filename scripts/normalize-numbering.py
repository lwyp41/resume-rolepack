#!/usr/bin/env python3
"""Normalise the numbering definitions produced by the `docx` library into the
structure required by docx_format_spec.md section 9:
  - a single abstractNum (id 0) and a single num (numId 1)
  - document.xml bullet references pointing at numId 1

The library always emits its own built-in bullet definitions alongside the
custom one, which pushes the custom definition to abstractNumId=2 / numId=2.

Usage:
    python <SKILL_DIR>/scripts/normalize-numbering.py <input.docx> <output.docx>

Why Python and not Node: this script lives in the skill install directory, and
ESM bare imports (`import JSZip from "jszip"`) resolve from the *script's own*
directory upward — not from the caller's cwd. An installed skill has no
node_modules, so the .mjs version fails with ERR_MODULE_NOT_FOUND whenever the
skill is installed outside a checkout that happens to have deps vendored.
Python's zipfile is stdlib, so this version runs anywhere with Python 3.
"""

import json
import re
import shutil
import sys
import tempfile
import zipfile
from pathlib import Path

ABSTRACT_1 = re.compile(r'<w:abstractNum w:abstractNumId="1"[\s\S]*?</w:abstractNum>')
NUM_1 = re.compile(r'<w:num w:numId="1">[\s\S]*?</w:num>')
NUMID_2 = re.compile(r'<w:numId w:val="2"\s*/>')


def normalize(src: Path, dst: Path) -> int:
    with zipfile.ZipFile(src) as zin:
        names = zin.namelist()
        if "word/numbering.xml" not in names or "word/document.xml" not in names:
            raise SystemExit(f"Not a resume DOCX (missing word/numbering.xml): {src}")

        numbering = zin.read("word/numbering.xml").decode("utf-8")
        document = zin.read("word/document.xml").decode("utf-8")

        numbering = ABSTRACT_1.sub("", numbering)
        numbering = numbering.replace(
            '<w:abstractNum w:abstractNumId="2"', '<w:abstractNum w:abstractNumId="0"'
        )
        numbering = NUM_1.sub("", numbering)
        numbering = numbering.replace(
            '<w:num w:numId="2"><w:abstractNumId w:val="2"/>',
            '<w:num w:numId="1"><w:abstractNumId w:val="0"/>',
        )
        document, hits = NUMID_2.subn('<w:numId w:val="1"/>', document)

        tmp_fd, tmp_name = tempfile.mkstemp(suffix=".docx")
        import os

        os.close(tmp_fd)
        tmp = Path(tmp_name)
        try:
            with zipfile.ZipFile(tmp, "w", zipfile.ZIP_DEFLATED) as zout:
                for item in zin.infolist():
                    if item.filename == "word/numbering.xml":
                        zout.writestr(item, numbering)
                    elif item.filename == "word/document.xml":
                        zout.writestr(item, document)
                    else:
                        zout.writestr(item, zin.read(item.filename))
            dst.parent.mkdir(parents=True, exist_ok=True)
            shutil.move(str(tmp), str(dst))
        finally:
            if tmp.exists():
                tmp.unlink()
    return hits


def main() -> None:
    if len(sys.argv) != 3:
        print(
            "Usage: python <SKILL_DIR>/scripts/normalize-numbering.py "
            "<input.docx> <output.docx>",
            file=sys.stderr,
        )
        raise SystemExit(1)

    src, dst = Path(sys.argv[1]), Path(sys.argv[2])
    if not src.exists():
        raise SystemExit(f"Input not found: {src}")

    hits = normalize(src, dst)
    print(json.dumps({"input": str(src), "output": str(dst),
                      "bytes": dst.stat().st_size, "numId_rewrites": hits}))


if __name__ == "__main__":
    main()
