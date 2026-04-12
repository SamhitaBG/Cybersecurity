#include <stdio.h>
#include <string.h>
int main(){
	char buffer[16];
	char input[100];
	printf("Enter input:");
	scanf("%s",input);
	strcpy(buffer,input);
	printf(buffer);
	return 0;
}
/*If input > 16 characters, then it may overflow the buffer, crashing it.
#This damages memory, allowing hackers to use this weakness.
#Use strncpy() fgets() for safer copying.*/
