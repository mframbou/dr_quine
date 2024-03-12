SRCS = Sully.s

OBJS = $(SRCS:.s=.o)

NAME = ./out/Sully

CC = nasm
LINKER = ld

CFLAGS =  -f elf64
# https://stackoverflow.com/questions/3577922/how-to-link-a-gas-assembly-program-that-uses-the-c-standard-library-with-ld-with
# these are the flags gcc uses to compile with libc, we need to call our main `main`, and now we can call printf etc. 
LFLAGS = -dynamic-linker /lib64/ld-linux-x86-64.so.2 /usr/lib/x86_64-linux-gnu/crt1.o /usr/lib/x86_64-linux-gnu/crti.o /usr/lib/x86_64-linux-gnu/crtn.o

SHELL = zsh

AQUA = \033[0;96m
AQUA_BOLD = \033[1;96m

PURPLE = \033[0;95m
PURPLE_BOLD = \033[1;95m

GREEN = \033[0;92m
GREEN_BOLD = \033[1;92m
GREEN_UNDRLINE = \033[4;32m

RED = \033[0;91m
IRED = \033[0;31m
RED_BOLD = \033[1;91m

SAME_LINE = \033[0G\033[2K

RESET = \033[0m

%.o: %.s
	@$(CC) $(CFLAGS) $< -o $@
	@echo -n "$(SAME_LINE)$(AQUA)Compiling $(AQUA_BOLD)$<$(RESET)"

# need .h files so will recompile when header changes
$(NAME):	$(OBJS)
	@echo
	@mkdir -p ./out
	@echo "$(PURPLE)Linking ($(PURPLE)*.o) into $(PURPLE_BOLD)$(NAME)$(RESET)"
	@$(LINKER) $(LFLAGS) -lc $(OBJS) -o $(NAME) 
	@echo "$(GREEN_BOLD)Done compiling $(GREEN_UNDERLINE)$(NAME)$(RESET)"

all:		$(NAME)

clean:
	@rm -f $(OBJS)
	@echo "$(RED)Removing $(IRED)*.o$(RESET)"

fclean:		clean
	@rm -f $(NAME)
	@echo "$(RED)Removing $(IRED)$(NAME)$(RESET)"
# *(N) ignores the error if the directory is empty
	@rm -rf ./out/*(N)

diff:	$(NAME)
	@echo "$(PURPLE)Diffing $(PURPLE_BOLD)$(NAME)$(RESET)"
	@echo diff Sully.s ./out/Sully_5.s
	@diff Sully.s ./out/Sully_5.s && echo "$(GREEN_BOLD)Diff successful$(RESET)" || echo "$(RED_BOLD)Diff failed$(RESET)"
	diff ./out/Sully_5.s ./out/Sully_4.s || true
	diff ./out/Sully_4.s ./out/Sully_3.s || true
	diff ./out/Sully_3.s ./out/Sully_2.s || true
	diff ./out/Sully_2.s ./out/Sully_1.s || true
	diff ./out/Sully_1.s ./out/Sully_0.s || true

re:			fclean all

.PHONY:	all clean fclean re