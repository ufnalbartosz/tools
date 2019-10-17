import sys

def process(line):
    pref_len = len('2019-10-13T19:43:16.371Z ')
    return line[pref_len:]


def remove_prefix_from_log(buff):
    prefix = '2019-'
    buff.seek(0)
    lines = buff.readlines()
    for it, line in enumerate(lines):
        if line.startswith(prefix):
            lines[it] = process(line)
    return ''.join(lines)


if __name__ == '__main__':
    logpath = sys.argv[1]
    with open(logpath) as f:
        result = remove_prefix_from_log(f)

    print(result)
