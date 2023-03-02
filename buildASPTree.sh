#! /usr/bin/bash


mkdir -p $1.solution/$1/Controllers/ $1.solution/$1/Models/ $1.solution/$1/Views/
cd $1.solution/
touch .gitignore
cd $1/
wget https://raw.githubusercontent.com/johnedisc/asp.net-template/main/FriendLetter/Program.cs
sed -i "s/FriendLetter/$1/g" Program.cs
wget https://raw.githubusercontent.com/johnedisc/asp.net-template/main/FriendLetter/FriendLetter.csproj
mv FriendLetter.csproj $1.csproj
cd Controller/
wget https://raw.githubusercontent.com/johnedisc/asp.net-template/main/FriendLetter/Controllers/HomeController.cs
mv  $1.csproj
printf "bin\nobj\n" >> ../.gitignore

