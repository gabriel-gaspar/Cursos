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