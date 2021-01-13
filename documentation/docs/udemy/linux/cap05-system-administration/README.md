# **Section 5 - System administration**

## **Lesson 79**
As soon as you open a file using vi, you start in its command mode. There are the following commands you can type in this mode:

- i
    - insert mode
- r
    - replace mode
- d
    - delete an entire line
- x
    - delete character by character in a line
- u
    - undo the last change made in command mode
- /keyword
    - search the keyword in the file
- :q!
    - quit without saving
- :wq! 
    - quit and save changes
    - you can also do this by pressing shift+z+z

When you are in the insert mode, you can make changes in the text.
If you want to exit the insert mode, just press ESC.

## **Lesson 80**
Vi and Vim are pretty much the same text editor. Some differences between them are the following ones:
- Vim has a GUI and some enhancements
- Vi is supported in all linux distributions and Vim does not.

## **Lesson 81**
Sed command is used in a variety of usecases. Some of them are the following:

- replace a string in a file with a new string
- find and delete a line that contains a string
- remove empty lines
- remove the first or n lines in a file
- replace tabs with spaces
- show defined lines from a file
- substitute words within vi editor

If you happened to want to replace all occurences of the name Seinfeld by the name Peter in a file, you could do this in the Vi editor by accessing the command mode and typying:

```
>> :%s/Seinfeld/Peter/
```

That is how you could use the sed command inside the editor.

## **Lesson 82**
Every time a new user is created, its records are stored in three different files in the Linux system. They are:

- /etc/passwd
- /etc/group
- /etc/shadow

You can see informations about all users accessing the file /etc/passwd. For instance:

```
>> cat /etc/passwd | grep spiderman
```

The command above will output something like:

```
spiderman:x:1002:1002::/home/spiderman:/bin/bash
```

Where:

- spiderman : name of the user
- x : it is the user password. As it is encrypted, the letter "x" is placed to represent it.
- 1002 : it is the user ID
- 1002: it is the user group ID. As the default, every user is created in its own group, with the same name and same ID.
- :: : it is the description of the user. In this case, the field is empty
- /home/spiderman : it is the path to the user directory
- /bin/bash : it is the path to the bash terminal. That means the user has access to it.

You can change all the default parameters with the complete command showned below:

```
useradd -g superheros -s /bin/bash -c "this is the user description" -m -d /home/spiderman spiderman
```

Afer you create a new user, make sure you also create a password for it, using the command below:

```
passwd spiderman
```