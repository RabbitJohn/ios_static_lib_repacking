# ios_static_lib_repacking
# Usage
## Step 1
download the repackage.sh file and open the terminal run:sh repackage.sh
## Step 2
drag the static library into the terminal as the terminal's prompt
## Step 3
copy the architectures of ios system which you want package with,and sperate each architecture with blank string
## Step 4
type the wildcards of the third library which you want to delete in your third library and separate each library with blank string,eg: the wildcards of MJRefresh ,MJExtension, AFNetWorking, is : \*MJ\*.o \*AF\*.o
## Step 5
drag the folder which you want to save the new library which is removed the third libraries.

# Usage
## 第一步
下载 repackage.sh 文件 打开终端运行 sh repackage.sh 回车
## Step 2
根据提示将要去除第三方库的静态包拖到终端 回车
## Step 3
终端会输出fat file中包含的手机架构，根据自己需要选择对应的架构如 arm64 armv7 用空格分开 输入到终端 回车
## Step 4
输入第三方类库.o文件的通配符（用来匹配去除第三方类库）,例如:  MJRefresh ,MJExtension, AFNetWorking 他们的通配符是: \*MJ\*.o \*AF\*.o,每个通配符之间使用空格分开，输入完后回车
## Step 5
第四步完成后中断会提示你输入你要保存新类库文件的位置，这时候你可以往中断里面拖入一个文件夹作为你修改后的静态包存放的位置。保存好后会有一个libforrename_new.a文件在这个文件夹,只要把这个文件的文件名改为你原来的类库的文件名即可
