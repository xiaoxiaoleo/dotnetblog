#encoding=utf-8
import os
import os.path
rootdir = "."                                   # 指明被遍历的文件夹
#result = open('dir_result.txt','w')


for parent,dirnames,filenames in os.walk(rootdir):    #三个参数：分别返回1.父目录 2.所有文件夹名字（不含路径） 3.所有文件名字
    for filename in filenames:                        #输出文件信息
        st=str( os.path.join(parent,filename)) #输出文件路径信息
        r = "/".join(st[1:].split("\\"))
        print r
        #result.write(r+'\n')

for item in os.walk(rootdir):
    r = "/".join(item[0][1:].split("\\"))
    print r+'/'
    #result.write(r+'/'+'\n')

    
#result.close()
