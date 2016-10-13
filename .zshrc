# Path to your oh-my-zsh installation.
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
fpath=(/usr/local/share/zsh-completions $fpath)
export ZSH=$HOME/.oh-my-zsh
export LOG_FORMAT=colored
eval $(docker-machine env)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster-custom"
DEFAULT_USER="jeffkantarek"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby mix ssh-agent)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias b="bundle exec"
alias br="bundle exec rake"
alias gu="git up"
alias j="jake watch:dev"
alias up="~/.rbenv/versions/2.1.2/bin/git-up"
alias upa="up; atom ./"
alias gcb="git checkout -b"
alias gcm="git commit -m"
alias gs="git show --stat --oneline origin/master..HEAD"
alias current_branch="git rev-parse --abbrev-ref HEAD | tr -d '[[:space:]]'"
alias gcmu="git checkout master; up"

precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

gpo() {
  BRANCH=$(git rev-parse --abbrev-ref HEAD | tr -d '[[:space:]]')
  git push origin $1 $BRANCH
  echo -e "http://github.com/chiengineer/${PWD##*/}/compare/${BRANCH}?expand=1"
}

kgcmu() {
  BRANCH=$(current_branch)
  gcmu
  git branch -D $BRANCH
}

source /Users/trunkclub/.iterm2_shell_integration.zsh

iterm2_print_user_vars() {
    iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

eval $(ssh-add ~/.ssh/github_rsa)

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
