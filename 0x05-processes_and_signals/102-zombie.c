#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
int infinite_while(void);
/**
 * infinite_while - Run an infinite while loop.
 *
 * Return: Always 0.
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - creating zombie process
 * Return: 0
 */
int main(void)
{
	int i = 0;
	int pid = -1;

	while (i < 5)
	{
		pid = fork();
		if (pid == 0)
		{
			printf("Zombie process created, PID: %d\n", getpid());
			return (0);
		}
		else
			i++;
	}
	infinite_while();
	return (0);
}
