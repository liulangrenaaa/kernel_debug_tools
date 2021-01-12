amd_server@130ubuntu: ~/workspace# sudo bpftrace -l | grep trace | grep exec
tracepoint:writeback:writeback_exec
tracepoint:fs:open_exec
tracepoint:sched:sched_process_exec
tracepoint:workqueue:workqueue_execute_start
tracepoint:workqueue:workqueue_execute_end
tracepoint:syscalls:sys_enter_execve
tracepoint:syscalls:sys_exit_execve
tracepoint:syscalls:sys_enter_execveat
tracepoint:syscalls:sys_exit_execveat
tracepoint:syscalls:sys_enter_kexec_file_load
tracepoint:syscalls:sys_exit_kexec_file_load
tracepoint:syscalls:sys_enter_kexec_load
tracepoint:syscalls:sys_exit_kexec_load

root@ubuntu-A520I-AC:/sys/kernel/tracing/events/syscalls/sys_enter_execve# cat format
name: sys_enter_execve
ID: 700
format:
        field:unsigned short common_type;       offset:0;       size:2; signed:0;
        field:unsigned char common_flags;       offset:2;       size:1; signed:0;
        field:unsigned char common_preempt_count;       offset:3;       size:1; signed:0;
        field:int common_pid;   offset:4;       size:4; signed:1;

        field:int __syscall_nr; offset:8;       size:4; signed:1;
        field:const char * filename;    offset:16;      size:8; signed:0;
        field:const char *const * argv; offset:24;      size:8; signed:0;
        field:const char *const * envp; offset:32;      size:8; signed:0;

print fmt: "filename: 0x%08lx, argv: 0x%08lx, envp: 0x%08lx", ((unsigned long)(REC->filename)), ((unsigned long)(REC->argv)), ((unsigned long)(REC->envp))

amd_server@130ubuntu: ~/workspace# sudo bpftrace -e 'tracepoint:syscalls:sys_enter_execve { printf("%d %s %s\n", pid, comm, str(args->filename)); }'
Attaching 1 probe...
2331284 a.out /bin/sh
2331285 a.out /bin/sh
2331286 a.out /bin/sh
2331287 sh /usr/bin/ls
2331288 sh /usr/bin/ls
2331289 sh /usr/bin/ls
2331290 a.out /bin/sh
2331291 sh /usr/bin/ls
2331292 sh /usr/bin/ls
2331293 a.out /bin/sh
2331294 a.out /bin/sh
2331295 sh /usr/bin/ls
2331296 sh /usr/bin/ls
2331297 a.out /bin/sh
2331298 a.out /bin/sh
2331299 a.out /bin/sh
2331300 a.out /bin/sh
2331301 sh /usr/bin/ls
2331302 a.out /bin/sh
2331303 sh /usr/bin/ls
2331304 sh /usr/bin/ls
2331306 a.out /bin/sh
2331307 a.out /bin/sh
2331308 sh /usr/bin/ls
2331309 sh /usr/bin/ls
2331310 sh /usr/bin/ls
2331305 sh /usr/bin/ls
2331312 a.out /bin/sh
2331311 sh /usr/bin/ls
2331313 a.out /bin/sh
2331314 a.out /bin/sh
2331315 a.out /bin/sh
2331316 sh /usr/bin/ls
2331317 sh /usr/bin/ls
2331318 sh /usr/bin/ls
2331319 a.out /bin/sh
2331320 sh /usr/bin/ls
2331321 a.out /bin/sh


amd_server@130ubuntu: ~/workspace# ps -aux  | grep a.out
ubuntu    561795  0.7  0.0   2356  1236 pts/0    S+   00:47   0:06 ./a.out
ubuntu    561796  0.7  0.0   2356   536 pts/0    S+   00:47   0:05 ./a.out
ubuntu    561797  0.7  0.0   2356   536 pts/0    S+   00:47   0:05 ./a.out
ubuntu    561798  0.7  0.0   2356   536 pts/0    S+   00:47   0:05 ./a.out
ubuntu    561800  0.7  0.0   2356   504 pts/0    S+   00:47   0:06 ./a.out
ubuntu    561801  0.7  0.0   2356   524 pts/0    S+   00:47   0:06 ./a.out
ubuntu    561802  0.7  0.0   2356   536 pts/0    S+   00:47   0:05 ./a.out
ubuntu    561808  0.7  0.0   2356   536 pts/0    S+   00:47   0:06 ./a.out
ubuntu   2874218  0.0  0.0  12108  2752 pts/8    S+   01:00   0:00 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclud


amd_server@ubuntu: ~/workspace# sudo strace -p 561795
wait4(2920716, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 2920716
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, NULL, 8) = 0
rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=2920716, si_uid=1000, si_status=0, si_utime=0, si_stime=0} ---
rt_sigaction(SIGINT, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA0
rt_sigaction(SIGQUIT, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=S0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
mmap(NULL, 36864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_STACK, -1, 0) = 0x7f9edf208000
rt_sigprocmask(SIG_BLOCK, ~[], [CHLD], 8) = 0
clone(child_stack=0x7f9edf210ff0, flags=CLONE_VM|CLONE_VFORK|SIGCHLD) = 2920732
munmap(0x7f9edf208000, 36864)           = 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
wait4(2920732, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 2920732
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, NULL, 8) = 0
rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=2920732, si_uid=1000, si_status=0, si_utime=0, si_stime=0} ---
rt_sigaction(SIGINT, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA0
rt_sigaction(SIGQUIT, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=S0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
mmap(NULL, 36864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_STACK, -1, 0) = 0x7f9edf208000
rt_sigprocmask(SIG_BLOCK, ~[], [CHLD], 8) = 0
clone(child_stack=0x7f9edf210ff0, flags=CLONE_VM|CLONE_VFORK|SIGCHLD) = 2920746
munmap(0x7f9edf208000, 36864)           = 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
wait4(2920746, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 2920746
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, NULL, 8) = 0
rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, NULL, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=2920746, si_uid=1000, si_status=0, si_utime=0, si_stime=0} ---
rt_sigaction(SIGINT, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA0
rt_sigaction(SIGQUIT, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=S0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
mmap(NULL, 36864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_STACK, -1, 0) = 0x7f9edf208000
rt_sigprocmask(SIG_BLOCK, ~[], [CHLD], 8) = 0
clone(child_stack=0x7f9edf210ff0, flags=CLONE_VM|CLONE_VFORK|SIGCHLD) = 2920767
munmap(0x7f9edf208000, 36864)           = 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
wait4(2920767, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 2920767
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f9edf051210}, NULL, 8) = 0
^C