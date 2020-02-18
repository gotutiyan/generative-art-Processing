import argparse

def get_options():
    parser=argparse.ArgumentParser()
    parser.add_argument('-name',help="this is sketch name")
    parser.add_argument('-mode',action="store_true")

    return parser.parse_args()

def main():
    args=get_options()

    name=args.name
    if args.mode:
        print("processing\n")
        print('![{}](./{}.gif)'.format(name,name))
    else:
        print('\n* [{}](https://github.com/gotutiyan/generative-art-Processing/tree/master/{})'.format(name,name))
        print()
        print('  ![{}](./{}/{}.gif)'.format(name,name,name))


main()
