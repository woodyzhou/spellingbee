# Spelling Bee Train Tool

This is a simple shell tool for spelling bee training purpose. It is designed to pick word from
a predefined list and pronounce with Mac OS voice one by one. Trainer has to manually compare
trainee's spelling with the word printed on the console. 

OS requirement: Mac OS

## Command

```
$ ./spellingbee.sh COLUMN_IDX [SEQ|RANDOM]
```


## Quick Start

```
# Test sequentially
./spellingbee.sh A SEQ

# Test randomly
./spellingbee.sh A
# OR
./spellingbee.sh A RANDOM

```

Output

```
===== Start =====

>> pieces <<
Press [r] repeat, [s] repeat slowly, [d] definition or any key to continue ...s
>> pieces <<
Press [r] repeat, [s] repeat slowly, [d] definition or any key to continue ...

>> pardon <<
Press [r] repeat, [s] repeat slowly, [d] definition or any key to continue ...

>> onshore <<
Press [r] repeat, [s] repeat slowly, [d] definition or any key to continue ...r
>> onshore <<
Press [r] repeat, [s] repeat slowly, [d] definition or any key to continue ...^C
```
