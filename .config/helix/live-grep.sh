

COPY_FILE_PATH='ctrl-y:execute(echo -n {1}:{2} | pbcopy)'
KEYS="$COPY_FILE_PATH"


if [[ $1 == '--exit-on-execution' ]]; then
  KEYS="$KEYS+abort"
  shift 
fi

IFS=$'\n' readarray -t selected_matches < <(
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf --ansi \
      --border \
      --color "hl+:$CATPPUCCIN_GREEN:reverse,hl:$CATPPUCCIN_MAUVE:reverse" \
      --delimiter ':' \
      --height '100%' \
      --multi \
      --print-query --exit-0 \
      --preview 'bat {1} --highlight-line {2}' \
      --preview-window 'right,+{2}+3/3,~3' \
      --scrollbar '▍' \
      --bind "$KEYS"
)


for line in "${selected_matches[@]:1}"; do
  file=$(echo "$line" | cut -d: -f1)
  line_number=$(echo "$line" | cut -d: -f2)
  echo "$file:$line_number"
done
