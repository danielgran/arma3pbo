# arma3pbo
This repository is a small way on how to pack folders into pbo files. This Python script is implemented with TDD. Also we are frickling around with ctypes, many bytearrays and pretty low-level-file-system-style topics. Was pretty fun to implement it! 

## Requirements
You must know the principles of TDD and be skilled in python programming.

## Project anatomy
This project is written with the TDD principles. So the tests are found in the ``tests`` folder. A great way on how to run them is via any IDE where my favorite choice is PyCharm (Professional). <br>
The production code is found in the src folder where an python module is placed which has the same name as the project.

## Development, the anatomy of a pbo file (bytelevel)
The Head-, Body- and Footblock are seperated by a 0-byte.
### Head (pbo_head.py)
All .pbo files are beginning with an <br>
https://github.com/danielgran/arma3pbo/blob/a57ccc20f36e247f5b981d943c9a2cf4dca13392/src/arma3pbo/pbo/pbo_head.py#L9 <br>
After then, all the so-called ``pboprefix``es are added. This happens by adding the following bytes: <br> https://github.com/danielgran/arma3pbo/blob/a57ccc20f36e247f5b981d943c9a2cf4dca13392/src/arma3pbo/pbo/pbo_head.py#L13-L19
<br>
These Prefixes are optional and are only added if a file ``$<filename>$`` with content lies in the project root of the folder.<br>
Lastly the pbofile must know what files with what metadata is found in the project structure. A great source for that was the wiki from BI (https://community.bistudio.com/wiki/PBO_File_Format). An Entry is added with the following code: <br>
https://github.com/danielgran/arma3pbo/blob/a57ccc20f36e247f5b981d943c9a2cf4dca13392/src/arma3pbo/pbo/pbo_head.py#L21-L44 <br>
**Important to know is that all the numbers are saved in little endian ``uint32``**
### Body (pbo_body.py)
This part is easy. Here all the files from the project are added with their contents. Its possible to compress these files, but its not really necesarry anymore. Arma 3 was written nearly 1,5 decaded ago where network speed and optimizing attempts were valued higher than performance. Nowadays this isn't really a problem anymore and in addition to that the engine must decompress the whole thing which may slightly decrese performance. <br>
The only important thing here is that the bytecode of the files are in the same order as in the header-entrys. I am just looping twice over the file array here.

### Foot (pbo_foot.py)
The last 20 bytes are an SHA1 Hash-Value based on the preceding bytes.
https://github.com/danielgran/arma3pbo/blob/a57ccc20f36e247f5b981d943c9a2cf4dca13392/src/arma3pbo/pbo/pbo_foot.py#L5-L7


## How to use
This packs a folder to a pbo file:
```
python3 src/arma3pbo/main.py build -i <input-folder> -o <output-file>
```
