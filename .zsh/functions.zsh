function ldapsearch_ccs_usr () {
 ldapsearch -h ldap.ccs.ornl.gov -b dc=ccs,dc=ornl,dc=gov -ZZ -x uid=$1
}

function ldapsearch_ccs_grp () {
  ldapsearch -h ldap.ccs.ornl.gov -b ou=groups,dc=ccs,dc=ornl,dc=gov -ZZ -x cn=$1
}

function ssh_client_ip () {
  echo $SSH_CLIENT | awk '{print $1}'
}

function stripeutil () {
  lfs df -h /lustre/atlas1 | grep -e "$(lfs getstripe $1 | sed -e 's/^\s*\([0-9]*\).*/\1/' -e '/^\s*$/d' | xargs | sed -e 's/^/OST:\\(\\</' -e 's/ /\\>\\\|\\</g' -e 's/$/\\>\\)/')"
}

function ibj () {
  local nodes=1
  local walltime='00:30:00'
  if [ "$1" != "" ]; then
    nodes=$1
    if [ "$2" != "" ]; then
      walltime=$2
    fi
  fi
  qsub -I -lnodes=$nodes -Astf007 -lwalltime=$walltime
}

function smithy () {
  if [ -z "${SMITHY_PREFIX}" ]; then
    module unload python
    source /sw/tools/smithy/environment.sh
    smithy $@
  else
    smithy $@
  fi
}

function renewcomp() {
  local f
  f=(~/.zsh/completion/*(.))

  unfunction $f:t 2> /dev/null
  autoload -U $f:t

}
