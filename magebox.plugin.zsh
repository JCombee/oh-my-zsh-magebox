# Return if magebox is not installed
(( ! $+commands[magebox] )) && return

# Core
alias mb='magebox'
alias mbs='magebox start'
alias mbst='magebox stop'
alias mbrs='magebox restart'
alias mbss='magebox status'
alias mbsh='magebox shell'
alias mbo='magebox open'
alias mbl='magebox list'
alias mbck='magebox check'
alias mbn='magebox new'
alias mbsu='magebox self-update'

# Database
alias mbd='magebox db'
alias mbdi='magebox db import'
alias mbde='magebox db export'
alias mbds='magebox db shell'
alias mbdr='magebox db reset'
alias mbdsn='magebox db snapshot'
alias mbdt='magebox db top'

# Logs
alias mblog='magebox logs'
alias mblogf='magebox logs -f'
alias mblogp='magebox logs php'
alias mblogn='magebox logs nginx'
alias mblogm='magebox logs mysql'

# Testing
alias mbt='magebox test'
alias mbtu='magebox test unit'
alias mbti='magebox test integration'
alias mbtcs='magebox test phpcs'
alias mbtst='magebox test phpstan'
alias mbta='magebox test all'

# PHP
alias mbphp='magebox php'
alias mbei='magebox ext install'
alias mbel='magebox ext list'

# Xdebug
alias mbxon='magebox xdebug on'
alias mbxoff='magebox xdebug off'
alias mbxs='magebox xdebug status'

# Varnish
alias mbv='magebox varnish'
alias mbve='magebox varnish enable'
alias mbvd='magebox varnish disable'
alias mbvf='magebox varnish flush'
alias mbvs='magebox varnish status'

# Redis
alias mbrf='magebox redis flush'
alias mbri='magebox redis info'
alias mbrsh='magebox redis shell'

# SSL / Domain
alias mbssl='magebox ssl generate'
alias mbda='magebox domain add'
alias mbdl='magebox domain list'

# Config
alias mbcf='magebox config show'
alias mbcfs='magebox config set'

# Sync
alias mbsync='magebox sync'
alias mbfetch='magebox fetch'

# Flush all caches (Redis + Varnish + Magento)
function mbflush() {
  echo "Flushing Redis..."
  magebox redis flush
  if magebox varnish status 2>/dev/null | grep -q "enabled"; then
    echo "Flushing Varnish..."
    magebox varnish flush
  fi
  echo "Flushing Magento cache..."
  magebox run bin/magento cache:flush
}

# Completions (cached from magebox completion zsh)
if [[ ! -f "$ZSH_CACHE_DIR/completions/_magebox" ]]; then
  typeset -g -A _comps
  autoload -Uz _magebox
  _comps[magebox]=_magebox
fi

{
  command magebox completion zsh 2>/dev/null | tee "$ZSH_CACHE_DIR/completions/_magebox" > /dev/null
} &|
