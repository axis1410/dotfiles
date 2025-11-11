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
ZSH_THEME="eastwood"

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



plugins=(git jsontools vscode docker docker-compose)

MAILCHECK=0

source $ZSH/oh-my-zsh.sh
source ~/.zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src


export PATH="$HOME/dev/shell_scripts:$PATH"


# history setup
setopt SHARE_HISTORY
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

alias drsta="docker restart $(docker ps -q)"


alias lg="lazygit"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."


alias py="python3"
alias python="python3"
alias pip="pip3"

alias quit="exit"
alias mkdir="mkdir -p"

alias zshconfig="code ~/.zshrc"
alias zsh="source ~/.zshrc"

alias ls="ls --color"
alias ll="ls -alt"

# Git Aliases
alias gs="git status"
alias ga="git add"
alias gaa="git add ."
alias gcm="git commit -m"
alias gcout="git checkout"
alias gst="git stash"
alias gsdrop="git stash drop"
alias gspop="git stash pop"
alias gpl="git pull"
alias gpp="git push"

alias bsl="brew services list"
alias bss="brew services start"
alias bsp="brew services stop"
alias bsr="brew services restart"
alias bssa="brew services stop --all"
alias bsra="brew services restart --all"
alias bssta="brew services start --all"
alias bsstd="brew services list | grep started"

alias vsc="code ."
alias cls="clear"
alias c="clear"

alias dj="python manage.py"
alias drs="python manage.py runserver"
alias dmmm="python manage.py makemigrations && python manage.py migrate"

alias tmks="tmux kill-session -t"
alias tmas="tmux attach -t"

export PATH="/opt/homebrew/opt/mariadb@10.6/bin:$PATH"
export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

# Created by `pipx` on 2024-11-12 06:07:36
export PATH="$PATH:/Users/navtech/.local/bin"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Bench Aliases
alias bm="bench set-maintenance-mode"
alias bs="bench start --no-prefix"

# Ghostty Config path
alias ghstcon="cd $HOME/Library/Application\ Support/com.mitchellh.ghostty/"


function bmig() {
  bench --site "$1" migrate --skip-failing
}

function bcon() {
  bench --site "$1" console
}

function buse() {
  bench use "$1"
}

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


# function gtag() {
#     git tag "$1"
#     git push origin "$1"
# }


# function gtagd() {
#     git tag -d "$1"
#     git push origin :refs/tags/"$1"
#     git tag "$1"
#     git push origin "$1"
# }


function gtag() {
    if [ $# -lt 2 ]; then
        echo "Usage: gtag <version> <message>"
        echo "Example: gtag v1.1.0-stable 'Added new features and fixed bugs'"
        return 1
    fi
    
    VERSION=$1
    shift  # Remove first parameter
    MESSAGE="$*"  # Combine remaining parameters as message
    
    # Create annotated tag with version and message
    git tag -a "$VERSION" -m "Release $VERSION

Changelog:
$MESSAGE"
    
    # Push the tag to your repository
    git push origin "$VERSION"
    
    echo "✓ Created and pushed tag $VERSION to axis1410/plagiarism-remover"
}

function gtagd() {
    if [ $# -lt 1 ]; then
        echo "Usage: gtagd <version>"
        echo "Example: gtagd v1.1.0-stable"
        return 1
    fi
    
    VERSION=$1
    
    # Delete local tag
    git tag -d "$VERSION"
    # Delete remote tag
    git push origin :refs/tags/"$VERSION"
    
    echo "✓ Deleted tag $VERSION from local and remote repository"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# typeset -g POWERLEVEL10K_INSTANT_PROMPT=quiet




# shellcheck shell=bash

# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd -- "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    # shellcheck disable=SC2312
    \command zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
# shellcheck disable=SC2154
if [[ ${precmd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] && [[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]]; then
    chpwd_functions+=(__zoxide_hook)
fi

# =============================================================================
#
# When using zoxide with --no-cmd, alias these internal functions as desired.
#

# Jump to a directory using only keywords.
function __zoxide_z() {
    # shellcheck disable=SC2199
    if [[ "$#" -eq 0 ]]; then
        __zoxide_cd ~
    elif [[ "$#" -eq 1 ]] && { [[ -d "$1" ]] || [[ "$1" = '-' ]] || [[ "$1" =~ ^[-+][0-9]$ ]]; }; then
        __zoxide_cd "$1"
    elif [[ "$#" -eq 2 ]] && [[ "$1" = "--" ]]; then
        __zoxide_cd "$2"
    else
        \builtin local result
        # shellcheck disable=SC2312
        result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" && __zoxide_cd "${result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local result
    result="$(\command zoxide query --interactive -- "$@")" && __zoxide_cd "${result}"
}

# =============================================================================
#
# Commands for zoxide. Disable these using --no-cmd.
#

function z() {
    __zoxide_z "$@"
}

function zi() {
    __zoxide_zi "$@"
}

# Completions.
if [[ -o zle ]]; then
    __zoxide_result=''

    function __zoxide_z_complete() {
        # Only show completions when the cursor is at the end of the line.
        # shellcheck disable=SC2154
        [[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0

        if [[ "${#words[@]}" -eq 2 ]]; then
            # Show completions for local directories.
            _cd -/

        elif [[ "${words[-1]}" == '' ]]; then
            # Show completions for Space-Tab.
            # shellcheck disable=SC2086
            __zoxide_result="$(\command zoxide query --exclude "$(__zoxide_pwd || \builtin true)" --interactive -- ${words[2,-1]})" || __zoxide_result=''

            # Set a result to ensure completion doesn't re-run
            compadd -Q ""

            # Bind '\e[0n' to helper function.
            \builtin bindkey '\e[0n' '__zoxide_z_complete_helper'
            # Sends query device status code, which results in a '\e[0n' being sent to console input.
            \builtin printf '\e[5n'

            # Report that the completion was successful, so that we don't fall back
            # to another completion function.
            return 0
        fi
    }

    function __zoxide_z_complete_helper() {
        if [[ -n "${__zoxide_result}" ]]; then
            # shellcheck disable=SC2034,SC2296
            BUFFER="z ${(q-)__zoxide_result}"
            __zoxide_result=''
            \builtin zle reset-prompt
            \builtin zle accept-line
        else
            \builtin zle reset-prompt
        fi
    }
    \builtin zle -N __zoxide_z_complete_helper

    [[ "${+functions[compdef]}" -ne 0 ]] && \compdef __zoxide_z_complete z
fi

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
    *.tar.bz2)  tar -jxvf "$archive_file" -C "$extract_dir" ;;
    *.tar.gz)   tar -zxvf "$archive_file" -C "$extract_dir" ;;
    *.tar)      tar -xvf "$archive_file" -C "$extract_dir"  ;;
    *.tbz2)     tar -jxvf "$archive_file" -C "$extract_dir" ;;
    *.tgz)      tar -zxvf "$archive_file" -C "$extract_dir" ;;
    *.bz2)      bunzip2 -c "$archive_file" > "$extract_dir/$(basename "$archive_file" .bz2)" ;;
    *.gz)       gunzip -c "$archive_file" > "$extract_dir/$(basename "$archive_file" .gz)" ;;
    *.zip)      unzip "$archive_file" -d "$extract_dir"     ;;
    *.Z)        uncompress "$archive_file" -c > "$extract_dir/$(basename "$archive_file" .Z)" ;;
    *.7z)       7z x "$archive_file" -o"$extract_dir"       ;;
    *.rar)      unrar x "$archive_file" "$extract_dir"      ;;
    *.xz)       tar -Jxvf "$archive_file" -C "$extract_dir" ;;
    *.zst)      zstd -d "$archive_file" -o "$extract_dir/$(basename "$archive_file" .zst)" ;;
    *)          echo "Error: '$archive_file' has an unsupported format" && return 1 ;;
  esac
  
  if [ $? -eq 0 ]; then
    echo "✅ Extraction complete"
  else
    echo "❌ Extraction failed"
    return 1
  fi
}

# Create a directory and cd into it
function mkcd() {
  mkdir -p -- "$1" && cd -P -- "$1" || return
}

# Find files containing a string
function findtext() {
  grep -r "$1" .
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
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


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

