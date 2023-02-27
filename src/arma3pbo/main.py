import argparse


def main(name):
    parser = argparse.ArgumentParser(
        prog='arma3pbo',
        description='What the program does',
        epilog='Text at the bottom of help')

    parser.add_argument('option')  # positional argument
    parser.add_argument('-c', '--count')  # option that takes a value
    args = parser.parse_args()

    a = 3;

if __name__ == '__main__':
    main('PyCharm')
