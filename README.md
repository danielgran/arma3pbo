# arma3pbo
This repository is a small way on how to pack folders into pbo files. This Python script is implemented with TDD. Also we are frickling around with ctypes, many bytearrays and pretty low-level-file-system-style topics. Was pretty fun to implement it! 

## This project only depends on standard python 3.9+

## How to use
This packs a folder to a pbo file:
```
python3 src/arma3pbo/main.py build -i <input-folder> -o <output-file>
```
