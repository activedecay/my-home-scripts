cd /vmfs/volumes/datastore1
echo `pwd`
ls
http://jenkins.int.fusionio.com/ion/coffee/LATEST/BUILD_NUMBER
num=`wget http://jenkins.int.fusionio.com/ion/coffee/LATEST/BUILD_NUMBER; cat BUILD_NUMBER`
rm BUILD_NUMBER
echo
echo Latest build number = $num
echo
wget "http://jenkins.int.fusionio.com/ion/coffee/$num/ION_Accelerator-vsl-ha-debug.x86_64-2.5.1-$num.iso"

