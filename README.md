
# [aspDotNetProjectBuilder](https://github.com/johnedisc/AspFrameworkShellScript)

#### by [brent hickman](https://github.com/BrentHickman) and [johnedisc](https://johnedisc.github.io)

#### a rough shell script to build a quick project repo for ASP.NET MVC sites

## description

* currently the script only for bash script in linux. still troubleshooting the differences of the sed command in Darwin/MacOS.
* the script takes two arguments: ProjectName in UpperCamel and destination directory

```bash
#download repo
git clone https://github.com/johnedisc/AspFrameworkShellScript
cd AspFrameworkShellScript/

#run script
./buildASPTree.sh ProjName /your/favorite/directory
