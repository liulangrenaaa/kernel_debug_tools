#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#define KB_MEMPRY_1	(1024)
#define MB_MEMPRY_1	(1024 * KB_MEMPRY_1)
// #define MEMORY_MB	(1024 * 12.0)  // server 16G
// #define MEMORY_MB	(1024 * 0.8)   // tencent 2G
#define MEMORY_MB	(1024 * 3)   // inspirion 4G

#define MEMORY_USE	(MB_MEMPRY_1 * MEMORY_MB)

/**
 * 尝试短时间创建大量进程，模拟由于大量进程创建销毁导致的 sys% 上升
*/
int main(void)
{
	int i = 0, j = 0;
	char *p[(int)MEMORY_MB];
	char *p_1mb = NULL;

	for (i = 0; i < MEMORY_MB; i++) {
		p[i] = (char *)malloc(MB_MEMPRY_1);
		if (!p[i]) {
			printf("p[%d] == NULL\n", i);
			return -1;
		}
	}

	printf("have malloc sucess!\n");

	while (1) {
		for (i = 0; i < MEMORY_MB; i++) {
			p_1mb = p[i];
			for (j = 0; j < (MB_MEMPRY_1 / KB_MEMPRY_1); j++) {
				*(p_1mb + KB_MEMPRY_1 * j) = j;
			}
			usleep(1000 *10);
			printf("have fill sucess. i = %d!\n", i);
		}
	}

}