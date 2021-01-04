#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

void* child(void* data);

/**
 * 尝试短时间创建大量进程，模拟由于大量进程创建销毁导致的 sys% 上升
*/
int main(void)
{
	int i = 3;

	while (i--) {
		fork();
	}

	i = 1000 * 1000;
	while (i--) {
		system("ls");
	}
}

void* child(void* data) {
	sleep(0.1);
	pthread_exit(NULL);
}
