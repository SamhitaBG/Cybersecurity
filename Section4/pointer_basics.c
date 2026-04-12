#include <stdio.h>
int main(){
	int port=80;
	int *p=&port;
	printf("Port value using variable: %d\n", port);
	printf("Port value using pointer: %d\n", *p);
	*p=443;
	printf("New value: %d\n",port);
	return 0;
}
