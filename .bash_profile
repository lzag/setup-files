export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git --no-ignore-vcs'
alias gic="git checkout \$(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset - %Cgreen%ad%Creset - %s %C(bold blue)<%an>%Creset' --abbrev-commit --date=short"
alias opt="php artisan optimize"
#alias  xsetwacom --set "Wacom Intuos BT S Pen stylus" MapToOutput DP1-1
# xsetwacom --set "Wacom Intuos BT S Pen stylus" Rotate cw
