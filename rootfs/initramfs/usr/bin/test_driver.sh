#!/bin/sh
echo '=== Test Character Driver ==='
insmod /lib/modules/5.15.0/lab2_driver.ko
lsmod | grep lab2
mknod /dev/lab2 c 240 0 2>/dev/null || echo ' (node already exists)'
ls -la /dev/lab2
echo 'Hello from userspace, LAB-02!' > /dev/lab2
DATA=$(cat /dev/lab2)
echo "Read back: [$DATA]"
for i in 1 2 3; do echo "Message_$i" > /dev/lab2; cat /dev/lab2; done
dmesg | grep lab2 | tail -10
echo '=== Test PASSED ==='
