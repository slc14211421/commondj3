#!/bin/bash

function printResult()
{
 if [ $2 -ne 0 ]; then
    echo -e "\033[31m ################ [ $1 install Faild ]\033[0m"
 else
    echo -e "\033[32m ################ [ $1 install Success ] \033[0m"
 fi
}
declare -A dic

cd /opt/commondj3/install/
tar zxvf sqlite-3.5.6.tar.gz
cd sqlite-3.5.6
./configure --disable-tcl && make && make install 
dic["sqlite-3.5.6"]=$?
cd ../;rm sqlite-3.5.6 -rf

cd /opt/commondj3/install/
tar xvf Python-3.6.3.tar.xz
cd Python-3.6.3
./configure --prefix=/opt/python36 ;make ;make install
dic["Python-3.6.3"]=$?
cd ../;rm Python-3.6.3 -rf

cd /opt/commondj3/install/
tar zxvf Django-1.10.8.tar.gz
cd /opt/commondj3/install/Django-1.10.8
/opt/python36/bin/python3.6 setup.py install
dic["Django-1.10.8"]=$?
cd ../;rm Django-1.10.8 -rf

cd /opt/commondj3/install/
tar zxvf simplejson-3.5.2.tar.gz
cd /opt/commondj3/install/simplejson-3.5.2
/opt/python36/bin/python3.6 setup.py install
dic["simplejson-3.5.2"]=$?
cd ../;rm simplejson-3.5.2 -rf

cd  /opt/commondj3/install/
/opt/python36/bin/pip3.6 install idna-2.6-py2.py3-none-any.whl chardet-3.0.3-py2.py3-none-any.whl urllib3-1.22-py2.py3-none-any.whl requests-2.18.4-py2.py3-none-any.whl certifi-2017.7.27.1-py2.py3-none-any.whl
dic["requests-2.18"]=$?

cd /opt/commondj3/install/
tar zxvf Markdown-2.6.9.tar.gz
cd /opt/commondj3/install/Markdown-2.6.9
/opt/python36/bin/python3.6 setup.py install
dic["Markdown-2.6.9"]=$?
cd ../;rm Markdown-2.6.9 -rf

cd  /opt/commondj3/install/
/opt/python36/bin/pip3.6 install pytz-2017.2-py2.py3-none-any.whl
dic["pytz-2017.2"]=$?

for key in $(echo ${!dic[*]})
do
        #echo "$key : ${dic[$key]}"
        printResult $key ${dic[$key]}
done


