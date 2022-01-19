# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sel-kham <sel-kham@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/01/14 12:02:39 by sel-kham          #+#    #+#              #
#    Updated: 2022/01/17 02:43:32 by sel-kham         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FLAGS := -Wall -Wextra -Werror
NAME := exutable
SERVER := server
CLIENT := client
LIBFT := ./libft/libft.a
PRINTF := ./ft_print/libftprintf.a
SRC := ft_server.c ft_client.c

.PHONY: all clean fclean re bonus

all: $(SERVER) $(CLIENT)

$(SERVER): ft_server.c $(LIBFT) $(PRINTF)
	$(CC) $(FLAGS) ft_server.c $(LIBFT) $(PRINTF) -o $(SERVER)

$(LIBFT):
	cd ./libft
	make
	make clean
	cd ..

$(PRINTF):
	cd ./ft_printf
	make
	make clean
	cd ..