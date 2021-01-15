# **Section 6 - Shell scripting**

## **Lesson 106**
In all operating systems, there's a software called Kernel. This software keeps running in the background and forms an interface between the applications and the hardware (RAM, CPU etc..). The applications interact with the kernel through **System Calls**.

## **Lesson 107**
Above the kernel, there is another component, called Shell, which is an interface between the users and the Kernel. Therefore, the Shell is like a CLI that can be used by users to interact with the Kernel.

The GUI is a Shell. Why? because all user interactions with it are translated to Shell commands.

## **Lesson 108**
There are the following types of Shell:

- Gnome
    - It is a GUI
- KDE
    - It is another type of GUI
- sh
    - It is a type of command line interface (CLI) to run Shell commands
    - It was created along with the Linux system.
- bash
    - It is another type of CLI for Shell commands.
    - It stands for "born again shell"
    - It is like the "sh" but with a lot of new features.


## **Lesson 109**
The first line of any shell script must begins with:

```
#!/bin/bash
```

Every shell script, after it has been written, must have executable permissions, otherwise, you won't be able to execute it.

You can execute the script in the command line typing something like:

```
# If it is a bash script:
./nameOfTheScript.bash
# If it is a shell script:
./nameOfTheScript.sh
```

  


