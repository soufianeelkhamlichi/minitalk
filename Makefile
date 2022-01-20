# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-kham <sel-kham@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/14 12:02:39 by sel-kham          #+#    #+#              #
#    Updated: 2022/01/20 16:38:13 by sel-kham         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FLAGS := -Wall -Wextra -Werror

SERVER := server
CLIENT := client
NAME := $(SERVER) $(CLIENT)

LIBFT_DIR := libft
LIBFT := $(LIBFT_DIR)/libft.a

PRINTF_DIR := ft_printf
PRINTF := $(PRINTF_DIR)/libftprintf.a


.PHONY: all clean fclean re bonus

all: $(NAME)

$(SERVER): server.c $(LIBFT) $(PRINTF)
	@echo "Making server file..."
	@$(CC) $(FLAGS) server.c $(LIBFT) $(PRINTF) -o $(SERVER)

$(CLIENT): client.c $(LIBFT) $(PRINTF)
	@echo "Making client file..."
	@$(CC) $(FLAGS) client.c $(LIBFT) $(PRINTF) -o $(CLIENT)

$(LIBFT): $(shell find $(LIBFT_DIR) -name "*.c" -type f)
	@echo "Making libft files..."
	@$(MAKE) -C $(LIBFT_DIR)/

$(PRINTF): $(shell find $(PRINTF_DIR) -name "*.c" -type f)
	@echo "Making ft_printf files..."
	@$(MAKE) -C $(PRINTF_DIR)/

clean:
	@echo "Removing Minittalk object files..."
	@rm -rf *.o
	@echo "Removing libft object files..."
	@$(MAKE) -C $(LIBFT_DIR)/ clean
	@echo "Removing ft_printf object files..."
	@$(MAKE) -C $(PRINTF_DIR)/ clean

fclean: clean
	@echo "Removing Minittalk executable files..."
	@rm -rf $(NAME)
	@echo "Removing libft static library file..."
	@$(MAKE) -C $(LIBFT_DIR)/ fclean
	@echo "Removing ft_printf static library file..."
	@$(MAKE) -C $(PRINTF_DIR)/ fclean

re: fclean all