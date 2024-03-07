#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

/*
We need to create a file with the name Sully_X.c where X is an integer, starting at 5.
We will then compile this Sully_X.c file to create an executable named Sully_X, then execute it.
This Sully_X program will create a Sully_Y (where Y is X-1) file, and so on, until Y is 0, where it will stop replicating.
We should then have all these (13) files in the out folder:
Sully_5.c
Sully_5
Sully_4.c
Sully_4
Sully_3.c
Sully_3
Sully_2.c
Sully_2
Sully_1.c
Sully_1
Sully_0.c
Sully_0
Sully (base executable)
*/

int main() {
 int i = 5;
 if (i < 0) return 0;
 char filename[50] = {0};
 sprintf(filename, "Sully_%d.c", i);
 int fd = open(filename, O_CREAT | O_RDWR | O_TRUNC, 0644);
 char *s = "#include <stdio.h>%c#include <stdlib.h>%c#include <unistd.h>%c#include <fcntl.h>%c%c/*%cWe need to create a file with the name Sully_X.c where X is an integer, starting at 5.%cWe will then compile this Sully_X.c file to create an executable named Sully_X, then execute it.%cThis Sully_X program will create a Sully_Y (where Y is X-1) file, and so on, until Y is 0, where it will stop replicating.%cWe should then have all these (13) files in the out folder:%cSully_5.c%cSully_5%cSully_4.c%cSully_4%cSully_3.c%cSully_3%cSully_2.c%cSully_2%cSully_1.c%cSully_1%cSully_0.c%cSully_0%cSully (base executable)%c*/%c%cint main() {%c int i = %d;%c if (i < 0) return 0;%c char filename[50] = {0};%c sprintf(filename, %cSully_%cd.c%c, i);%c int fd = open(filename, O_CREAT | O_RDWR | O_TRUNC, 0644);%c char *s = %c%s%c;%c dprintf(fd, s, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, i-1, 10, 10, 10, 34, 37, 34, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 34, 37, 37, 34, 10, 10, 34, 37, 34, 10, 10, 10);%c close(fd);%c char cmd[50] = {0};%c char exec[50] = {0};%c sprintf(cmd, %cgcc -Wall -Wextra -Werror Sully_%cd.c -o Sully_%cd%c, i, i);%c system(cmd);%c sprintf(exec, %c./Sully_%cd%c, i);%c system(exec);%c}%c";
 dprintf(fd, s, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, i-1, 10, 10, 10, 34, 37, 34, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 34, 37, 37, 34, 10, 10, 34, 37, 34, 10, 10, 10);
 close(fd);
 char cmd[50] = {0};
 char exec[50] = {0};
 sprintf(cmd, "gcc -Wall -Wextra -Werror Sully_%d.c -o Sully_%d", i, i);
 system(cmd);
 sprintf(exec, "./Sully_%d", i);
 system(exec);
}
