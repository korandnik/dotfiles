STOW_TARGETS = dunst hypr mpv nvim waybar wleave yt-dlp zed zsh 

GREEN := \033[0;32m
RED := \033[0;31m
NC := \033[0m

.PHONY: all stow $(STOW_TARGETS)

all: stow

stow: $(STOW_TARGETS)
	@echo -e "$(GREEN)✓ All targets stowed successfully$(NC)"

$(STOW_TARGETS):
	@echo -e "$(GREEN)Stowing $@...$(NC)"
	@stow -R $@ || echo -e "$(RED)Failed to stow $@$(NC)"

