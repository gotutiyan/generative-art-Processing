import argparse

def get_options():
    parser=argparse.ArgumentParser();
    parser.add_argument('-name',help="this is sketch name")

    return parser.parse_args()

def main():
    args=get_options()

    name=args.name
    print('![{}](./{}.gif)'.format(name,name))
    print()
    print('[{}](https://github.com/gotutiyan/art-by-processing/tree/master/{})'.format(name,name))
    print('![{}](./{}/{}.gif)'.format(name,name,name))


main()
