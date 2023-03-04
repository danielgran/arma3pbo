import argparse

import arma3pbo
from arma3pbo.pbo.pbo import PBO


def main(name):
    parser = argparse.ArgumentParser(
        prog='arma3pbo',
        description='This applications provides some essential tools to work with Arma 3 PBO files.',
        epilog='Author: Daniel Gran (https://www.github.com/danielgran)')

    subparsers = parser.add_subparsers(dest="subparser")
    foo_parser = subparsers.add_parser('build')
    foo_parser.add_argument('-p', '--path', help='Path to build')
    foo_parser.add_argument('-o', '--output', help='Output file')

    args = parser.parse_args()



    if args.subparser == 'build' and args.path and args.output:
        print('Building PBO file...')
        PBO.build(args.path, args.output)



    a = 3;

if __name__ == '__main__':
    main('PyCharm')
