# **Section 3 - System Access and File System**

## **Lesson 33**
To access a Linux machine remotely from a Windows machine, a software called Putty is needed.

If both machines are Linux, the access can be made via SSH connection and no third-party package is required.

## **Lesson 35**
To connect to a remote machine, its IP address must be known. It is possible to figure it out by accessing its terminal and listing its network interfaces. The commands to do that are listed below: 

```shell
>> ifconfig
>> ip addr 
>> ip a 
```

The **ifconfig** command is being deprecated in the latest Linux versions. So, you would rather prefer the other two options.

## **Lesson 36**
If the remote Linux machine does not have an IP address but does have a network interface, then you will need to activate it manually.

To do that, access the terminal as root and run the following command:

```shell
>> ifup enp0s3
```

This command will activate the network interface, which in turn will receive an IP address.

In the case above, the network interface was identified by **enp0s3**.

## **Lessons 38-39**
The Linux file system is like a directories tree organized hierarchically. At the top, there is a directory called Root. It is also referred to as Slash.

Within that folder, there is a series of subfolders responsible for storing files and data for different purposes.

- **/boot**
    - when the system starts, this is the first directory accessed.
    - files with information about the boot of the system are stored here.
- **/root**
    - this is the root user directory
- **/dev**
    - it stores files containing information about all physical media of the machine, like HD, audio, USB, keyboard, etc.
- **/etc**
    - it stores configuration files for all native Linux applications, like FTP, NFS, e-mail, DNS, etc.
    - if you intend to edit any of them, make a snapshot of it in advance!
- **/bin ou /usr/b**in
    - it stores files containing the definition of the commands a user can invoke through the terminal (ls, pwd, cd, etc...)
- **/sbin ou /usr/sbin**
    - stores files containing configuration data of the Linux file system.
- **/opt**
    - It stores all files related to the third-party applications the user installs.
- **/proc**
    - each process active in the machine has a file in this folder.
    - when the user shuts down the system, all files are deleted.
- **/lib ou /usr/lib**
    - it contains C libraries used by applications installed on the system.
    - if the user installs an application that requires some C scripts, those scrips are stored in this folder.
- **/tmp**
    - folder meant to store temporary files.
- **/home**
    - every user of the system has a folder in this directory.
    - these folders represent the working directory of each user of the system.
- **/var**
    - every log issued by either the system or the applications running on it is stored here.
- **/run**
    - it stores information about processes running on the system, like PID files.
    - when the user shuts down the system, all files here are deleted.
- **/mnt**
    - file-systems mounted in the Linux are placed here.
- **/media**
    - directory in which the data related to every external media is located, like CD-ROM and others.
  
## **Lesson 42**
In a Linux system, everything is a file. There are seven types of files.

-   regular file 
-   directory 
-   link 
-   special file or device file 
-   socket
-   named pipe
-   block device

In a directory, you can run the following command to list all files inside of it, each one with its corresponding type.

```
>> ls -l
```

If the file is a directory, the type field will start by the character **d**. <br/>
Example: dr-xr-xr-x 

If the file is a link, the type field will start by the character **l**. <br/>
Example: lrwxrwxrwt

If the file is a regular one, the type field will start by the character **-**. <br/>
Example: -rw-r--r--

## **Lesson 46**
There are two commands available to search for files in a Linux system:  **locate** and **find**.

The big difference between them is that the first one (locate) maintains a database (a cache) with the path to all files in the system. Thus, when the command is executed, the file is searched in the data base, which returns a quick response (it is faster than the **find** command).
The second one (**find**) is just a simple command that loops across all files in the system.

Another important note about the **locate** command: from time to time, the system runs the command **updatedb** to update the cache.

The package **mlocate** is required to start using the **locate** instruction. You can install it with the command:

```
>> yum install mlocate
```

## **Lesson 48**
In certain situations, you will have to operate on a large amount of files (creation, deletion, copy, etc.). If the file names follow a certain pattern, you can make use of a feature called **WildCards** to operate in each one that matches the pattern.

There are basically 3 Wildcards:

- *
    - represents the whole (totality)
- ?
    - represents a value which value does not matter
- []
    - represents a set o selected values

<br/>

**Example1:**<br/>

Let's create 9 files whose names follow the pattern: file1-xyz, file2-xyz, file3-xyz...

To do that, we can use the wildcard that represents a set of selected values.

```
>> touch file[1..9]-xyz
```

<br/>

**Example2:**<br/>

Let's list every file that starts with "abc" and ends with whatever set of characters.

In this case, we can use the wildcard that represents the totality.

```
>> ls -l abc*
```

<br/>

**Example3:**<br/>

Let's list every file that ends with "xyz".

```
>> ls -l *xyz
```

<br/>

**Example4:**<br/>

Let's list every file that starts with any character, and followed by "bcd".

In this case, we have to combine two wildcards.

```
>> ls -l ?bcd*
```

<br/>

**Example5:**<br/>

Let's list every file that contains the string "xy".

It does not matter which characters come first and which characters come after the string. Furthermore, it does not even matter the amount of them. That is another case for the totality wildcard.

```
>> ls -l *xy*
```

<br/>

**Example6:**<br/>

Let's list all files that contains or the character "x", or the character "y".

```
>> ls -l *[xy]*
```

## **Lesson 49**

Links are a resource very similar to shortcuts in Windows systems.

They can come in two forms: **Hard** e **Soft**.

Every file in a Linux system receives an identifier. This number, known as **inode**, refers to the address in memory where the file is stored.

A **hard link** is a "file" that actualy is a pointer to an **inode**. <br/>
So, if you create a hard link to a file (or folder), you are creating a pointer that is pointing to the address in memory where the original file is located.
An important note: if the name of the original file changes, nothing will happen to the hard-link. It will continue pointing to the same file, once the **inode** remains the same.

A **soft link** is slightly different. It is a pointer to the path of a file. So, if the name of this file changes, the link breaks, because the path to the refered file will change.

If you want to check what are the inodes of the files in a given directory, just run the following command:

```
>> ls -ltri
```
**Examples**:<br/>
Suppose that we have a file in the following path: /home/gaspar/contract <br/>
Let's create a **hard-link** and a **soft-link** to it.

```
>> ln /home/gaspar/contract
>> ln -s /home/gaspar/contract
```
