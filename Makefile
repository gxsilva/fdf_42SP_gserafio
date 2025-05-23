CC = cc

LIBFT_DIR = libft

LIBFT = $(LIBFT_DIR)/libftprintf.a

HEADER = -I $(LIBFT_DIR)

NAME = main

SRCS =	main.c \
		utils_main.c\
		error_handlers.c\
		validations.c\
		utils_validations.c\
		map_parser.c\
		utils_map_parser.c\
		init_cam.c\
		init_cam_utils.c\
		init_mlx.c\
		mlx_utils.c\
		init_render.c\
		init_render_utils.c

OBJS =	$(SRCS:%.c=$(OBJ_DIR)/%.o)

OBJ_DIR = build

CFLAGS = -Werror -Wall -Wextra
LDFLAGS = -Lminilibx -lmlx_Linux -lX11 -lXext -lm

all: $(LIBFT) $(NAME)

$(LIBFT):
	@make -C $(LIBFT_DIR)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(LIBFT) $(LDFLAGS)

$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(HEADER) -c $< -o $@

clean:
	@make -C $(LIBFT_DIR) clean
	rm -f $(OBJS)

fclean:
	@make -C $(LIBFT_DIR) fclean
	rm -f $(OBJS) $(NAME)

re:
	@$(MAKE) fclean
	@$(MAKE) all

.PHONY: all clean fclean re
