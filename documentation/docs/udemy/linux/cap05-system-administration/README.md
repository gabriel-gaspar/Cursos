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

## **Lesson 83**
If you are logged as an user, let's say gaspar, and wants to change to another user, like gabriel, run the command below:

```
>> su - gabriel
```

The system will prompt you to insert the password of the user gabriel.

Important note: If you are logged as the root user, you can change the login to any user of the system without even knowing its password.

Speaking about the root user, it is important to keep in mind that he is the system administrator. A long time ago, if a user wanted to perform administrative tasks, he had to log in as root using the command "su -". Later on, the sudo command was created and, since then, users were allowed to execute commands with administrator privileges as long as they had their user ID registered in the /etc/sudoers file. The root credentials were not needed anymore. 

Therefore, the /etc/sudoers file determines who can use the sudo command and what they can do with it.
To edit this file, you have to run the command:

```
>> visudo
```

You can read more about this file [here](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#:~:text=The%20visudo%20command%20opens%20a,with%20the%20vi%20text%20editor.) and [here](https://unix.stackexchange.com/questions/291454/difference-between-sudo-user-and-root-user#:~:text=1%20Answer&text=Executive%20summary%3A%20%22root%22%20is,users%20to%20perform%20administrative%20tasks.&text=Root%20can%20access%20any%20file,call%2C%20and%20modify%20any%20setting.).

## **Lesson 84**
If you want to monitor users in a linux System, there are some useful commands for that.

```
# It shows all users logged into the system 
>> who
``` 

```
# It shows a history of user accesses
>> last
```

## **Lesson 85**
In a Linux system that receives simultaneous accesses from different users, it may happen a situation in which you need to communicate to some of the users or to broadcast a message to all users who are logged in the system. For that, there are the following commands:

```
# shows all users that are logged in the system
>> users
```

```
# Broadcasts a message to all users that are logged in the system
# You write the message and press ctrl+d to broadcast it
>> wall
```

```
# Send a message to a user that is logged in the system
>> write userName

```

## **Lessons 86-87**
If you work with only one Linux server, you can manage users using the commands you have learned so far. 
But, if you have hundreds of Linux servers, how could you manage users of every server? It is impractical to access one by one and configure user accounts.

The solution for this cenario is called Directory Service. In this approach, a server hosts a database of users that is shared by all other servers of the system. So, a user in one of the servers will authenticate to the Directory Service and get access to the system.
In this ecossystem, there are some import terms to learn:

- Active Directory
    - It is the name of the Directory Service in Windows Systems.
- IDM - Identity manager
    -  It is the name of the Directory Service in Red Hat Linux Systems.
- WinBIND 
    - Is a tool that allows a Linux system to communicate with a Windows system and vice-versa.
    - this way, a Linux user can authenticate to a Active Directory, and a Windows user can authenticate to a Directory Service
- LDAP - Light Directory Access Protocol
    - It is the protocol used in the process of authentication
- OpenLDAP
    - It is the name of the Directory Service in Linux Systems.


## **Lesson 89**
Concepts learned in the class:

Application - It is also called a Service and is basicaly a software that runs on the computer (NTP, NFS, Apache, Nginx, rsyslog etc...)

Script - It is a bunch of instructions wrapped up in a file.

Process - Each application running on the system has a process associated to it. I understant it as an instance of the application which consumes system resources.

Daemon - It is a type of process, the difference here is that the user does not have access to it. A Daemon keeps running in the background until the system is shut down.

Thread - depending of its implementation, a process can have multiple execution branches, each branch is called a thread.

Jobs - It is also a type of process but it is started from time to time to execute a task.

## **Lesson 90**

Crontab is a file in which you can schedule tasks to be executed periodicaly. <br/> 
You can read more about crontabs [here](https://guialinux.uniriotec.br/crontab/).

Linux systems provide some pre-defined cronjobs out of the box.

- hourly
    - It is folder located at: /etc/cron.hourly
    - In it you can add scripts to be executed in a hourly basis
    - The exact hour is defined in the file: /etc/cron.d/0hourly
- daily
    - It is a folder located at: /etc/cron.daily
    - In it you can add scripts to be executed in a daily basis
    - The exact day is defined in the file: /etc/anacrontab
- weekly
    - It is a folder located at: /etc/cron.weekly
    - In it you can add scripts to be executed in a weekly basis
    - The exact day of each week is defined in the file: /etc/anacrontab
- monthly
    - It is a folder located at: /etc/cron.monthly
    - In it you can add scripts to be executed in a monthly basis
    - The exact day of each month is defined in the file: /etc/anacrontab



## **Lesson 93**

All the logs produces by the system and applications running on it are stored in the following folders:

- /var/log/boot
- /var/log/chronyd
- /var/log/cron
- /var/log/maillog
- /var/log/secure
- /var/log/messages
- /var/log/httpd




