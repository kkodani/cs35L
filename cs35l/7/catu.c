#include <unistd.h>
#include <stdlib.h>

int main()
{
	char *buf = malloc(1);

	while(read(0, buf, 1) > 0)
	{
		write(1, buf, 1);
	}

	return 0;
}
