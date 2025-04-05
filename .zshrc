### visualize p10k theme via oh-my-zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH=~/.oh-my-zsh
POWERLEVEL9K_MODE='nerdfont-complete'
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

### source environment variables
if [ -f "$HOME/.config/.global.env" ]; then
    set -a
    source "$HOME/.config/.global.env"
    set +a
fi

### ----- Bat (better cat) -----
alias cat=bat
export BAT_THEME=tokyonight_storm

### ---- Eza (better ls) -----
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

### thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

### ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

### --- SET UP CONDA ---
alias python=python3
alias pip=pip3

### aliases for nvim
alias code=nvim
alias vi=nvim

### GIT AUTO-COMMIT
alias gg='git add -A && git commit -m "reed auto-commit $(date +"%Y-%m-%d %H:%M:%S")" && git push origin main'

### load zsh prompts
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


