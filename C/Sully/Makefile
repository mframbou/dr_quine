SRCS = Sully.c

OBJS = $(SRCS:.c=.o)

NAME = ./out/Sully

CC = gcc

CFLAGS =  -Wall -Wextra -Werror -g -fsanitize=address

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

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo -n "$(SAME_LINE)$(AQUA)Compiling $(AQUA_BOLD)$<$(RESET)"

# need .h files so will recompile when header changes
$(NAME):	$(OBJS)
	@echo
	@mkdir -p ./out
	@echo "$(PURPLE)Linking ($(PURPLE)*.o) into $(PURPLE_BOLD)$(NAME)$(RESET)"
	@$(CC) $(CFLAGS) $(OBJS) -o $(NAME)
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
	@echo diff Sully.c ./out/Sully_5.c
	@diff Sully.c ./out/Sully_5.c && echo "$(GREEN_BOLD)Diff successful$(RESET)" || echo "$(RED_BOLD)Diff failed$(RESET)"
	diff ./out/Sully_5.c ./out/Sully_4.c || true
	diff ./out/Sully_4.c ./out/Sully_3.c || true
	diff ./out/Sully_3.c ./out/Sully_2.c || true
	diff ./out/Sully_2.c ./out/Sully_1.c || true
	diff ./out/Sully_1.c ./out/Sully_0.c || true

re:			fclean all

.PHONY:	all clean fclean re