#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
mix_lines
~~~~~~~~~

Iterate line by line on multiple files to mix they lines.
"""

import  sys
# disable stdout buffering
#sys.stdout = os.fdopen(sys.stdout.fileno(), 'w', 0)


def exit_err(msg):
    sys.stderr.write(msg)
    sys.exit(1)


def main():
    files = []
    if len(sys.argv) == 1:
        exit_err('Usage: %s file_path1 file_path2 file_path3\n' % sys.argv[0])
    print sys.argv[1:]
    try:
        for f_path in sys.argv[1:]:
            files.append(open(f_path, 'r'))

        while files:
            for i, f in enumerate(files):
                raw_line = f.readline()
                if raw_line:
                    print raw_line.rstrip()
                else:
                    f.close()
                    del files[i]
    except IOError, e:
        exit_err('I/O error: %s\n' % e)
    finally:
        for f in files:
            f.close()

if __name__ == '__main__':
    main()
