#include <stdio.h>
/*
Si on met des backslash dans le printf, ca ne marche pas, parce que pour le print il va faloir l'escape, et donc il va fallor l'escape etc.
*/

void print_quine() {
    char *s = "#include <stdio.h>%c/*%cSi on met des backslash dans le printf, ca ne marche pas, parce que pour le print il va faloir l'escape, et donc il va fallor l'escape etc.%c*/%c%cvoid print_quine() {%c    char *s = %c%s%c;%c    printf(s, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);%c}%c%cint main() {%c    /*%c    Ouga bouga%c    */%c    print_quine();%c}%c";
    printf(s, 10, 10, 10, 10, 10, 10, 34, s, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);
}

int main() {
    /*
    Ouga bouga
    */
    print_quine();
}
