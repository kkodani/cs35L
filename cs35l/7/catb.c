#include <stdio.h>

int main(void)
{
	char c=getchar();
	
	while (c!=-1)
	{
		putchar(c);
		c=getchar();
	}

	return 0;
}

