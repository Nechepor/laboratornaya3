CC = gcc
WAY = /home/nechepor/bin/lab1_0
#компиляция проекта
all: tictac

tictac: wait lab1.o
	$(CC) -g -O0 -o tictac lab1.o

lab1.o: lab1.c 
	$(CC) -g -O0 -c lab1.c 

#тестовый запуск проекта 

run:	tictac
	@./tictac

#установка скомпилированного проекта 

install:
	@cp tictac $(WAY)

#Удаление из директории (way)

uninstall: 
	tictac
	@rm -f $(WAY)/tictac

#Создание дистрибутива проекта

dist:
	@rm -f tictac.tar
	@tar -cf tictac.tar Makefile *.c help

#Создание документации

info:
	@cat *.c | sed /#/d > readme
	@cat readme 

#Очистка проекта без удаления некоторых файлов

clean:
	@rm -f *.o *~
#Полная очистка

distclean:
	@rm -f *.o *~ tictac

#Использование файла сборки

.PHONY: help wait
help:
	@cat help

#Запуск внешних скриптов и утилит

ls:
	@ls -l *.c 

#Запуск скрипта 

wait:
	@./wait.sh