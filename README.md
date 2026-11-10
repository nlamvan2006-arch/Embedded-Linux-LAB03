# LAB-03: Debugging Kernel & Phan tich Hieu nang Ung dung Nhung

## 1. Moi truong thuc hanh

- He dieu hanh: Ubuntu Linux
- Kernel: 7.0.0-43-generic
- Kien truc host: x86_64
- Kien truc target: ARM
- Cong cu: GDB, QEMU, Valgrind, strace, perf, cyclictest, stress-ng

## 2. Noi dung da thuc hien

### GDB Remote Debugging
Phan tich 3 loi:
- Out-of-bounds
- Use-after-free
- Integer overflow

Log: logs/gdb_*.log

### Valgrind
- 49 errors from 8 contexts
- Khong phat hien memory leak

Log: logs/valgrind_buggy.log

### strace
- 41 system calls
- Tong thoi gian system call: 0.001499 giay

Log: logs/strace_buggy.log va logs/strace_summary.log

### perf
- Thoi gian chay buggy_app_host trung binh: 1.480 ms (10 lan)
- cpu_test: 100 CPU samples
- Total lost samples: 0
- Ham main chiem 100% Self Overhead trong cpu_test

Log: logs/perf_*.log

### cyclictest

| Chi so | Idle | CPU Load |
|---|---:|---:|
| Min latency | 1 us | 2 us |
| Avg latency | 1 us | 3 us |
| Max latency | 356 us | 967 us |

Cau hinh:
- Priority: 50
- Interval: 1000 us
- Duration: 30 giay
- CPU load: stress-ng --cpu 2

## 3. Cau truc thu muc

- apps/: Ma nguon va chuong trinh thu nghiem
- logs/: Ket qua debug va profiling
- output/: Initramfs duoc tao tu bai lab truoc
- rootfs/: Root filesystem
- rt_kernel/: Thu muc du kien cho noi dung kernel RT

## 4. Ghi chu

- perf record khong thu duoc CPU samples tu buggy_app_host
  do chuong trinh chay qua nhanh.
- cpu_test duoc su dung de minh hoa CPU profiling.
- Kernel hien tai su dung CONFIG_PREEMPT_DYNAMIC=y.
- Chua xac nhan da thuc hien kernel PREEMPT_RT.

## 5. Ket luan

Da thuc hanh cac cong cu debug va phan tich hieu nang
ung dung nhung tren Linux.
