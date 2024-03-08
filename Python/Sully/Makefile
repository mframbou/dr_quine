NAME = ./out/Sully.py

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

all:		$(NAME)

$(NAME):
	@mkdir -p ./out
	@echo "$(AQUA)Copying $(AQUA_BOLD)Sully.py$(RESET)"
	@cp Sully.py $(NAME)

exec: $(NAME)
	@echo "$(GREEN)Executing $(GREEN_BOLD)$(NAME)$(RESET)"
	@cd ./out && python3 Sully.py

fclean:
	@echo "$(RED)Removing $(IRED)./out/Sully_x.py$(RESET)"
# *(N) ignores the error if the directory is empty
	@rm -rf ./out/Sully*(N)

diff:	$(NAME)
	@echo "$(PURPLE)Diffing $(PURPLE_BOLD)$(NAME)$(RESET)"
	@echo diff Sully.py ./out/Sully_5.py
	@diff Sully.py ./out/Sully_5.py && echo "$(GREEN_BOLD)Diff successful$(RESET)" || echo "$(RED_BOLD)Diff failed$(RESET)"
	diff ./out/Sully_5.py ./out/Sully_4.py || true
	diff ./out/Sully_4.py ./out/Sully_3.py || true
	diff ./out/Sully_3.py ./out/Sully_2.py || true
	diff ./out/Sully_2.py ./out/Sully_1.py || true
	diff ./out/Sully_1.py ./out/Sully_0.py || true

re:			fclean all

.PHONY:	all clean fclean re