# 1
passwd

#2
cd ~
touch marge lois lisa lex kramer jerry homer george clark bart

#3
mkdir seinfeld superman simpsons

#4
touch jupiter
echo "Jupiter is a planet" > jupiter
cd /tmp
ln -s ~/jupiter
ln ~/jupiter
ls -ltri # verificar o inode do hard link
cd ~
ls -ltri # verificar o inode do arquivo original