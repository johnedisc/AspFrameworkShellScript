#! /usr/bin/bash

if [ $# != 2 ]; then
  printf "please enter two arguments: \n the first is the ProjectName in Pascal Notation \n the second is the path where you want to store the project directory \n"
  exit 1
fi

cd $2
#Generate Directories
mkdir -p $1.solution/$1/Controllers/ $1.solution/$1/Properties/ $1.solution/$1/Models/ $1.solution/$1/Views/ $1.solution/$1/wwwroot/
cd $1.solution/
mkdir -p $1.Tests/ModelTests

#Generate Gitigonore and Readme
touch .gitignore README.md
printf "bin\nobj\n.vscode" >> .gitignore

cd $1/
#Generate Program.cs
wget https://raw.githubusercontent.com/BrentHickman/ToDoList.Solution/main/ToDoList/Program.cs
sed -i "s/ToDoList/$1/g" Program.cs

#Generate csproj
wget https://raw.githubusercontent.com/BrentHickman/ToDoList.Solution/main/ToDoList/ToDoList.csproj
mv ToDoList.csproj $1.csproj

#Generate HomeController
cd Controllers/
wget https://raw.githubusercontent.com/BrentHickman/ToDoList.Solution/main/ToDoList/Controllers/HomeController.cs
sed -i "s/ToDoList/$1/g" HomeController.cs

#Generate launch.json file
cd ../Properties/
wget https://raw.githubusercontent.com/BrentHickman/ToDoList.Solution/main/ToDoList/Properties/launchSettings.json

#Generate Sample Model
cd ../Models
wget https://raw.githubusercontent.com/BrentHickman/ToDoList.Solution/main/ToDoList/Models/Item.cs
mv Item.cs SampleModel.cs
sed -i "s/ToDoList/$1/g" SampleModel.cs

#Generate Home View
cd ../Views
mkdir Home/
cd Home/
wget https://raw.githubusercontent.com/BrentHickman/ToDoList.Solution/main/ToDoList/Views/Home/Index.cshtml
sed -i "s/My To-Do List!//g" Index.cshtml

#Generate Shared Folder
cd ../
mkdir Shared

#Generate ModelTest Sample
#Back to Project Folder
cd ../
#Back to root and forward to Tests
cd ../$1.Tests
wget https://raw.githubusercontent.com/BrentHickman/ToDoList.Solution/main/ToDoList.Tests/ToDoList.Tests.csproj
mv ToDoList.Tests.csproj $1.Tests.csproj
sed -i "s/ToDoList/$1/g" $1.Tests.csproj

#Generate ModelTest Sample
cd ModelTests/
wget https://raw.githubusercontent.com/BrentHickman/ToDoList.Solution/main/ToDoList.Tests/ModelTests/ItemTests.cs
mv ItemTests.cs SampleModelTests.cs
sed -i "s/ToDoList/$1/g" SampleModelTests.cs






