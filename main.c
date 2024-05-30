#include <stdio.h>
#include <stdlib.h>
#include "parser.tab.h"

extern FILE* yyin;

int main(int argc, char *argv[]) {
    // printf("argc = %d\n", argc);
    // if (argc != 2) {
    //     // fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
    //     exit(0);
    //     return 3;
        
    // }

    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        fprintf(stderr, "Erreur lors de l'ouverture du fichier %s\n", argv[1]);
        fclose(file);
        perror("fopen");
        return 4;
    }

    // yyparse();
    stdin = file;
    system("./calculator");
    fclose(file);
    // Lancer l'analyse syntaxique

    return 0;
}