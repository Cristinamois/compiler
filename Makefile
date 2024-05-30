CC = gcc
CFLAGS = -Wall -g -Wno-unused-function
LEX = flex
YACC = bison

all: compiler

compiler: lex.yy.c parser.tab.o 
	$(CC) $(CFLAGS) $^ -o $@ -lfl

lex.yy.c: lexer.l
	$(LEX) $<

parser.tab.c parser.tab.h: parser.y
	$(YACC) -d $<

# main.o: main.c
# 	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f compiler lex.yy.c parser.tab.c parser.tab.h *.o

fclean:
	rm -f compiler lex.yy.c parser.tab.c parser.tab.h *.o results/*