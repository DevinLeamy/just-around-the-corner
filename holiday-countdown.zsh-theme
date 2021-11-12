days_till_christmas() {
    year=$(date +%Y)
    christmas=360
    if [[ $(expr $year % 400) -eq 0 && $(expr $year % 100) -ne 0 ]]
    then
        christmas=360
    else
        christmas=359
    fi
    
    current_day=$(date +%j)
    days_till_christmas=$(expr $christmas - $current_day)
    echo "$days_till_christmas"
}

current_time() {
   echo "%{$fg[white]%}%*%{$reset_color%}"
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"


RPROMPT='$(date "+%A %b %d %Y") - %{$fg_bold[green]%}% $(days_till_christmas) %{$fg_bold[green]%}% Days%{$fg_bold[red]%}% ... %{$reset_color%}🎁'
