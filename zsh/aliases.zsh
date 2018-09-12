# Unix
alias ll="ls -al"
alias ln="ln -v"
alias mkdir="mkdir -p"
alias e="$EDITOR"
alias v="$VISUAL"

# GitHub
alias gsc="git commit -S -m"
alias gcu="git-crypt unlock"
alias gcl="git-crypt lock"

# Bundler
alias b="bundle"
alias be="bundle exec"

# Rails
alias migrate="rake db:migrate db:rollback && rake db:migrate db:test:prepare"
alias s="rspec"
alias be="bundle exec"

# Docker
alias dm="docker-machine"
alias dc="docker-compose"
alias de="docker exec"

# Ansible
alias ap="ansible-playbook"

# Hashicorp
alias v="vagrant"
alias tf="terraform"

# Heroku
alias h="heroku"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

# Dash
alias dash='open dash://'

# Networking
alias whatsmyip='curl ipv4.icanhazip.com'

# Include custom aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local

