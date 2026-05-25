# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="eastwood"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

zstyle ':completion:*' matcher-list "m:{a-zA-Z}={A-Za-z}"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# plugins=(git jsontools vscode docker docker-compose)

MAILCHECK=0

source $ZSH/oh-my-zsh.sh
source ~/.zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

export PATH="$HOME/dev/shell_scripts:$PATH"

# history setup
setopt SHARE_HISTORY
setopt IGNORE_EOF
HISTFILE=$HOME/.zhistory

HISTSIZE=5000
SAVEHIST=1000
setopt extended_history       # Record timestamp of command
setopt hist_expire_dups_first # Delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # Ignore duplicated commands
setopt hist_ignore_space      # Ignore commands that start with space
setopt hist_verify            # Show command with history expansion before running it
setopt inc_append_history     # Add commands to HISTFILE in order of execution

setopt HIST_EXPIRE_DUPS_FIRST

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval "$(starship init zsh)"
# eval "$(fzf --zsh)"


alias lg="lazygit"

alias py="python3"
alias python="python3"
alias pip="pip3"

alias quit="exit"
alias mkdir="mkdir -p"

alias zsh="source ~/.zshrc"

alias ls="ls --color"
alias ll="ls -alt"

alias cls="clear"
alias c="clear"

alias tmks="tmux kill-session -t"
alias tmas="tmux attach -t"

export PATH="/opt/homebrew/opt/mariadb@10.6/bin:$PATH"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# Created by `pipx` on 2024-11-12 06:07:36
export PATH="$PATH:/Users/navtech/.local/bin"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

function bsetup() {
	# Store original arguments
	local site_name="$1"
	local backup_file="$2"

	# Extract backup directory path
	local backup_dir=$(dirname "$backup_file")

	# Check if config.json exists
	local config_file="${backup_dir}/config.json"
	if [ ! -f "$config_file" ]; then
		echo "Warning: Config file not found at $config_file"
		echo "Proceeding without encryption key..."
	else
		# Extract the encryption key from config.json
		local encryption_key=$(grep -o '"encryption_key": "[^"]*"' "$config_file" | cut -d'"' -f4)

		if [ -z "$encryption_key" ]; then
			echo "Warning: encryption_key not found in config.json"
			echo "Proceeding without encryption key..."
		else
			echo "Found encryption key in config.json"
		fi
	fi

	if [ -d "./sites/$site_name" ]; then
		echo "Site $site_name exists. Dropping it now..."
		bench drop-site "$site_name" --force --no-backup --db-root-password root
	else
		echo "Site $site_name does not exist. Proceeding to setup."
	fi

	# Run the setup commands
	bench new-site "$site_name" --db-name "db_$site_name" --db-root-password root --db-root-username root --admin-password admin
	bench --site "$site_name" restore "$backup_file" --db-root-password root
	bench --site "$site_name" migrate --skip-failing
	bench --site "$site_name" set-config allow_tests true

	if [ ! -z "$encryption_key" ]; then
		echo "Setting encryption key in site_config.json..."
		local site_config_path="./sites/${site_name}/site_config.json"

		if [ -f "$site_config_path" ]; then
			if grep -q "encryption_key" "$site_config_path"; then
				sed -i '' "s/\"encryption_key\": \"[^\"]*\"/\"encryption_key\": \"$encryption_key\"/" "$site_config_path"
			else
				sed -i '' "s/}$/,\n\t\"encryption_key\": \"$encryption_key\"\n}/" "$site_config_path"
			fi
			echo "Encryption key has been set successfully."
		else
			echo "Error: site_config.json not found at $site_config_path"
		fi
	fi

	echo "Setup completed for site: $site_name"

	bench --site "$site_name" set-maintenance-mode off
}

# Extract various compressed file types with a mandatory destination directory
function extract() {
	if [ $# -lt 2 ]; then
		echo "Usage: extract <archive_file> <destination_directory>"
		echo "Example: extract archive.tar.gz ~/extracted_files"
		return 1
	fi

	if [ ! -f "$1" ]; then
		echo "Error: '$1' is not a valid file"
		return 1
	fi

	local archive_file="$1"
	local extract_dir="$2"

	# Create the directory if it doesn't exist
	mkdir -p "$extract_dir" || return 1

	echo "Extracting '$archive_file' to '$extract_dir'..."

	case "$archive_file" in
	*.tar.bz2) tar -jxvf "$archive_file" -C "$extract_dir" ;;
	*.tar.gz) tar -zxvf "$archive_file" -C "$extract_dir" ;;
	*.tar) tar -xvf "$archive_file" -C "$extract_dir" ;;
	*.tbz2) tar -jxvf "$archive_file" -C "$extract_dir" ;;
	*.tgz) tar -zxvf "$archive_file" -C "$extract_dir" ;;
	*.bz2) bunzip2 -c "$archive_file" >"$extract_dir/$(basename "$archive_file" .bz2)" ;;
	*.gz) gunzip -c "$archive_file" >"$extract_dir/$(basename "$archive_file" .gz)" ;;
	*.zip) unzip "$archive_file" -d "$extract_dir" ;;
	*.Z) uncompress "$archive_file" -c >"$extract_dir/$(basename "$archive_file" .Z)" ;;
	*.7z) 7z x "$archive_file" -o"$extract_dir" ;;
	*.rar) unrar x "$archive_file" "$extract_dir" ;;
	*.xz) tar -Jxvf "$archive_file" -C "$extract_dir" ;;
	*.zst) zstd -d "$archive_file" -o "$extract_dir/$(basename "$archive_file" .zst)" ;;
	*) echo "Error: '$archive_file' has an unsupported format" && return 1 ;;
	esac

	if [ $? -eq 0 ]; then
		echo "✅ Extraction complete"
	else
		echo "❌ Extraction failed"
		return 1
	fi
}


# Get your external IP
function myip() {
	curl -s https://api.ipify.org
}

alias vim=nvim
alias vi=nvim

eval "$(zoxide init zsh)"
alias tmns="tmux new -s"

# eza integration (modern ls replacement)
if command -v eza >/dev/null 2>&1; then
	# Basic eza aliases
	alias ls="eza --icons"
	alias ll="eza --icons --long --header --git"
	alias la="eza --icons --long --header --git --all"
	alias lt="eza --icons --tree --level=2"
	alias lta="eza --icons --tree --level=2 --all"

	# Sort aliases
	alias lls="eza --icons --long --header --git --sort=size"
	alias llm="eza --icons --long --header --git --sort=modified"

	# More detailed view
	alias llg="eza --icons --long --header --git --grid"
	alias llx="eza --icons --long --header --git --extended"
fi

export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# fastfetch

. "$HOME/.cargo/env"
export PATH="/opt/homebrew/opt/mariadb@10.6/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# bindkey -v
# export KEYTIMEOUT=1
#
# # Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char
#
# # Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[1 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[5 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     echo -ne "\e[5 q"
# }
# zle -N zle-line-init
# echo -ne '\e[5 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

alias git-clean-gone="git branch -vv | grep 'gone]' | awk '{print \$1}' | xargs git branch -D"

export PATH=$PATH:$(go env GOPATH)/bin

fh() {
	eval "$(history | fzf | sed 's/^ *[0-9]* *//')"
}
alias nvchad='NVIM_APPNAME=nvchad nvim'


function ghswitch() {
	gh auth switch --user "$1"
	case "$1" in
	axis1410)
		git config --global user.email "adityasingh14102001@gmail.com"
		;;
	aditya-singh-n1410)
		git config --global user.email "aditya.s@navtech.io"
		;;
	esac
	echo "Switched to $1"
}

_ghswitch() {
	local users
	users=(
		'axis1410:adityasingh14102001@gmail.com'
		'aditya-singh-n1410:aditya.s@navtech.io'
	)
	_describe 'github account' users
}

compdef _ghswitch ghswitch

function cdmenu() {
	local dir
	dir="$(find "$HOME" "$HOME/dev" "$HOME/projects" "$HOME/Desktop" "$HOME/Documents" "$HOME/Downloads" -maxdepth 5 -type d \
		-not -path '*/node_modules/*' \
		-not -path '*/.local/lib/*' \
		-not -path '*/site-packages/*' \
		-not -path '*/__pycache__/*' \
		-not -path '*/.venv/*' \
		-not -path '*/venv/*' \
		-not -path '*/.git/' \
		-not -path '*/.git' \
		-not -path '*/.git/*' \
		2>/dev/null | fzf --prompt='cd> ' --preview='ls -A {} | head -20' --height=40%)" && cd "$dir"
}

# Fuzzy find files and open in nvim
function nvimf() {
	local file
	file="$(find . -type f \
		-not -path '*/__pycache__/*' \
		-not -path '*/node_modules/*' \
		-not -path '*/site-packages/*' \
		-not -path '*/.git/*' \
		-not -path '*/.venv/*' \
		-not -path '*/venv/*' \
		-not -path '*/.local/*' \
		-not -path '*/.ruff_cache/*' \
		-not -path '*/.pytest_cache/*' \
		2>/dev/null | fzf --prompt='nvim> ' --preview='bat --color=always --style=numbers --line-range=:500 {}' --height=40%)" && nvim "$file"
}

alias vimf="nvimf"

# Insert a file or directory from the current working tree into the prompt.
function __fzf_path_insert() {
	local selected preview_cmd

	if ! command -v fzf >/dev/null 2>&1; then
		zle -M "fzf not found"
		return 1
	fi

	if command -v bat >/dev/null 2>&1; then
		preview_cmd='if [ -d {} ]; then ls -A {}; else bat --color=always --style=numbers --line-range=:500 {}; fi'
	else
		preview_cmd='if [ -d {} ]; then ls -A {}; else sed -n "1,200p" {}; fi'
	fi

	if command -v fd >/dev/null 2>&1; then
		selected="$(fd --hidden --follow --exclude .git --exclude node_modules --exclude __pycache__ --exclude site-packages --exclude .venv --exclude venv --exclude .local . . |
			fzf --prompt='path> ' --height=40% --preview="$preview_cmd")"
	else
		selected="$(find . \( \
			-path '*/.git/*' -o \
			-path '*/node_modules/*' -o \
			-path '*/__pycache__/*' -o \
			-path '*/site-packages/*' -o \
			-path '*/.venv/*' -o \
			-path '*/venv/*' -o \
			-path '*/.local/*' \
			\) -prune -o \( -type f -o -type d \) -print 2>/dev/null |
			sed 's#^\./##' |
			fzf --prompt='path> ' --height=40% --preview="$preview_cmd")"
	fi

	[[ -n "$selected" ]] || return 0

	LBUFFER+="${(q-)selected}"
	zle reset-prompt
}

zle -N __fzf_path_insert
bindkey '^T' __fzf_path_insert

# Added by Antigravity
export PATH="/Users/navtech/.antigravity/antigravity/bin:$PATH"
export CLAUDE_CODE_SUBAGENT_MODEL="claude-haiku-4-5"

function sp() {
	sesh picker

}
