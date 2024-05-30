#include "symbole_table.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct Variable
{
    char *name;
    int value;
    struct Variable *next;
} Variable;

Variable *symbol_table = NULL;

void add_variable(const char *name, int value) {
    Variable *new_variable = malloc(sizeof(Variable));
    new_variable->name = strdup(name);
    new_variable->value = value;
    new_variable->next = symbol_table;
    symbol_table = new_variable;
}

int get_variable_value(const char *name)
{
    Variable *current = symbol_table;
    while (current != NULL)
    {
        if (strcmp(current->name, name) == 0)
        {
            return current->value;
        }
        current = current->next;
    }

    fprintf(stderr, "Variable %s not found.\n", name);
    exit(1);
}