# -*-shell-script-*-

rb_impl() {
  ruby_parts=("${(s/-/)${${RUBY_ROOT+$(basename $RUBY_ROOT)}}}")
  if [ -n "$ruby_parts[1]" ]; then
    echo "$ruby_parts[1]"
  else
    echo ""
  fi
}

rb_vers() {
  ruby_parts=("${(s/-/)${${RUBY_ROOT+$(basename $RUBY_ROOT)}}}")
  if [ -n "$ruby_parts[2]" ]; then
    echo "%{$fg[white]%}:%{$reset_color%}%{$fg[red]%}$ruby_parts[2]%{$reset_color%}"
  else
    echo ""
  fi
}

if brew-true chruby; then
  RPS1="%{$fg[yellow]%}\$(rb_impl)%{$reset_color%}\$(rb_vers)%{$reset_color%} $EPS1"
else
  RPS1="%{$reset_color%} $EPS1"
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

display_base_dir() {
  if [ -n "$DIRENV_DIR" ]; then
    basename $(pwd)
  else
    print -P "%~"
  fi
}

get_hostname() {
  echo "%{$fg[blue]%}[$(echo $HOST | sed 's/\(.*\)\..*/\1/')]%{$reset_color%}"
}

PROMPT='$(git_custom_status)$(get_hostname)%{$fg[cyan]%}[$(display_base_dir)% ]%{$reset_color%}%B$%b '


