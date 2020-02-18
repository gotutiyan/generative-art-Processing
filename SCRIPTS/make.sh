touch ./$1/README.md
python3 scripts/p.py -name $1 -mode > ./$1/README.md
python3 scripts/p.py -name $1 >> README.md