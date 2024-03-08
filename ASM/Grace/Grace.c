#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

/*
Monkey comment
*/
#define OPEN open("Grace_kid.c", O_CREAT | O_RDWR | O_TRUNC, 0644)
#define STR "#include <fcntl.h>%c#include <stdio.h>%c#include <unistd.h>%c%c/*%cMonkey comment%c*/%c#define OPEN open(%cGrace_kid.c%c, O_CREAT | O_RDWR | O_TRUNC, 0644)%c#define STR %c%s%c%c#define FT() int main() { int fd = OPEN; char *s = STR; dprintf(fd, s, 10, 10, 10, 10, 10, 10, 10, 34, 34, 10, 34, s, 34, 10, 10, 10, 10); close(fd); }%c%cFT()%c"
#define FT() int main() { int fd = OPEN; char *s = STR; dprintf(fd, s, 10, 10, 10, 10, 10, 10, 10, 34, 34, 10, 34, s, 34, 10, 10, 10, 10); close(fd); }

FT()
