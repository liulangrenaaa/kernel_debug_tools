amd_server@143ubuntu: ~/workspace/kernel_debug_tools/01 系统sys使用率高之一/demo_code# gcc demo.c
demo.c: In function ‘main’:
demo.c:20:3: warning: implicit declaration of function ‘system’ [-Wimplicit-function-declaration]
   20 |   system("ls");
      |   ^~~~~~
amd_server@ubuntu: ~/workspace/kernel_debug_tools/01 系统sys使用率高之一/demo_code# ./a.out


amd_server@ubuntu: ~/workspace# top
top - 00:45:05 up 10 days,  2:08,  3 users,  load average: 1.71, 3.69, 4.30
Tasks: 358 total,   1 running, 357 sleeping,   0 stopped,   0 zombie
%Cpu(s):  7.8 us, 24.3 sy,  0.0 ni, 67.7 id,  0.0 wa,  0.0 hi,  0.3 si,  0.0 st
MiB Mem :  15475.7 total,   1411.4 free,   3217.1 used,  10847.2 buff/cache
MiB Swap:   2048.0 total,   1903.5 free,    144.5 used.  11930.5 avail Mem

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
      1 root      20   0  169080  10228   6148 S   0.0   0.1   0:31.08 systemd
      2 root      20   0       0      0      0 S   0.0   0.0   0:00.23 kthreadd
      3 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_gp
      4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_par_gp
      6 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/0:0H-kblockd
      9 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 mm_percpu_wq
     10 root      20   0       0      0      0 S   0.0   0.0   0:09.35 ksoftirqd/0
     11 root      20   0       0      0      0 I   0.0   0.0   3:41.02 rcu_sched
     12 root      rt   0       0      0      0 S   0.0   0.0   0:03.76 migration/0
     13 root     -51   0       0      0      0 S   0.0   0.0   0:00.00 idle_inject/0