#!/bin/sh
#
# script for filtering the third library

#提示并从terminal中读取path变量
echo "please input the drag the file below" && read path
echo the library path is $path
#查看 fat file 里面的架构
lipo -info $path
cd ~/Desktop
mkdir repackage_tem && cd repackage_tem
#读取重新打包中要包含的架构
echo "please input the archs which you want to repackage" && read -a archs
archsCount=${#archs[@]}
#读取要删除第三方框架的匹配
echo "please input the wildcards you want to delete,separate the wildcards with blank" && read -a wildcards
wildcardsCount=${#wildcards[@]}
for((i=0;i<archsCount;i=i+1))
do
echo "packing ${archs[$i]}..."
#生成一个对应架构的文件夹
mkdir ${archs[$i]}
#生成对应的arch的.a文件
cd ${archs[$i]}
lipo -thin ${archs[$i]} $path -output lib_${archs[$i]}.a
#将library 拆解成.o文件
ar -x lib_${archs[$i]}.a
for((j=0;j<wildcardsCount;j=j+1))
do
echo "removing the ${wildcards[$j]} for ${archs[$i]}"
#移除对应的依赖
rm -rf ${wildcards[$j]}
done
libtool -static *.o -o ../lib_${archs[$i]}_new.a
cd ..
done
echo "drag the target folder you want save the new library" && read savePath
echo "repackaging..."
lipo -create lib_*_new.a -output $savePath/lib_customForRename_new.a
cd ..
rm -rf ~/Desktop/repackage_tem
echo "compeleted!!!"

