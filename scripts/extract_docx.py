import sys, zipfile, re
from xml.etree import ElementTree as ET

NS = {'w': 'http://schemas.openxmlformats.org/wordprocessingml/2006/main'}

def q(t): return '{http://schemas.openxmlformats.org/wordprocessingml/2006/main}' + t

def para_text(p):
    parts = []
    for node in p.iter():
        tag = node.tag
        if tag == q('t'):
            parts.append(node.text or '')
        elif tag == q('tab'):
            parts.append('\t')
        elif tag == q('br'):
            parts.append('\n')
    return ''.join(parts)

def is_bullet(p):
    for node in p.iter(q('numPr')):
        return True
    return False

def main():
    path = sys.argv[1]
    out = sys.argv[2]
    z = zipfile.ZipFile(path)
    xml = z.read('word/document.xml')
    root = ET.fromstring(xml)
    body = root.find(q('body'))
    lines = []
    for p in body.iter(q('p')):
        txt = para_text(p)
        if txt.strip() == '' and not is_bullet(p):
            continue
        if is_bullet(p):
            lines.append('  • ' + txt)
        else:
            lines.append(txt)
    with open(out, 'w', encoding='utf-8') as f:
        f.write('\n'.join(lines))

if __name__ == '__main__':
    main()
