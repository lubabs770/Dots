autoload -U colors && colors
setopt prompt_subst

git_prompt_info() {
	local ref
	ref=$(command git symbolic-ref HEAD 2>/dev/null) \
		|| ref=$(command git rev-parse --short HEAD 2>/dev/null) \
		|| return 0
	local dirty
	if [[ -n $(command git status --porcelain 2>/dev/null) ]]; then
		dirty=$ZSH_THEME_GIT_PROMPT_DIRTY
	else
		dirty=$ZSH_THEME_GIT_PROMPT_CLEAN
	fi
	echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${ref#refs/heads/}${dirty}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
}

PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
