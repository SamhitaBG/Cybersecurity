#include <stdio.h>
#include <arpa/inet.h>
#include <unistd.h>

void scan_port(int port) {
    int s = socket(AF_INET, SOCK_STREAM, 0);

    struct sockaddr_in t;
    t.sin_family = AF_INET;
    t.sin_port = htons(port);
    t.sin_addr.s_addr = inet_addr("127.0.0.1");

    if (connect(s, (struct sockaddr*)&t, sizeof(t)) == 0)
        printf("Port %d: OPEN\n", port);
    else
        printf("Port %d: CLOSED\n", port);

    close(s);
}

int main() {
    scan_port(22);
    scan_port(80);
    scan_port(443);
    scan_port(3306);
    return 0;
}
