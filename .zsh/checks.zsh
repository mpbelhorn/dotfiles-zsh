if [[ $(uname) = 'Linux' ]]; then
    IS_LINUX=1
fi

if [[ $(uname) = 'Darwin' ]]; then
    IS_MAC=1
fi

HAS_MODULES=$+commands[modulecmd]

if [[ $(uname -n) == *.ornl.gov ]]; then
  ORNL_HOST=1
  case $(uname -n) in
    ua-prod*)
      ORNL_HOST_UAPROD=1
      ;;
    titan*)
      ORNL_HOST_TITAN=1
      ;;
    rhea*)
      ORNL_HOST_RHEA=1
      ;;
    *)
      ;;
  esac
fi
