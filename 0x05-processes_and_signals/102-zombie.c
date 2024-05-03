#include <stdio.h>
#include <unistd.h>
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
	return (0);
}
