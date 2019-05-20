#!/bin/bash
set -e

ask_user() {
  local prompt="$1" i r; shift

  echo >&2; echo "$prompt" >&2; echo >&2;
  if [ "$#" = 0 ]; then
    echo "Nothing to choose from... exiting" >&2
    return 1
  fi

  i=0; for o in "$@"; do echo -e "$i\t$o" >&2; i=$((i+1)); done; echo >&2

  while true; do
    read -p "Enter a number in range 0-$(($# - 1)): " -r r
    i=0; for o in "$@"; do
      if [ "$r" = "$i" ]; then echo "$o"; return; fi; i=$((i+1))
    done
  done
}

set_backup_perms() {
  mkdir -p /backup/
  chown -R "$BACKUP_UID:$BACKUP_UID" /backup
  chmod 755 /backup
  find /backup -type d -exec chmod 700 {} +
  find /backup -type f -exec chmod 600 {} +
}

# createsecret [-f|-r] SECRET param
#   * -f: create secret from a file; param is the filename
#   * -r: random string; param is the length
#   * no option; param should be the value
createsecret() {
  local fn='/project/.secret.env'
  local value replace

  case "$1" in
    -f)
      shift
      value="$(base64 -w0 "$2")"
      ;;
    -r)
      shift
      value="$(</dev/urandom tr -dc '[:graph:]' | head -c "$2" | base64 -w0)"
      ;;
    *)
      value="$(echo -n "$2" | base64 -w0)"
    esac

    # check if the secret exists
    while IFS= read -r p; do
      if [ "$(echo "$p" | sed -rn 's/^([^#=\s]*)=(.*)$/\1/p')" = "$1" ]; then
        if [ -n "$3" ]; then
          replace=1
        else
          echo "Secret already exists: $1" >&2; return 1
        fi
      fi
    done < "$fn"

    if [ -n "$replace" ]; then
      sed -ri "/^($1=).*$/d" "$fn"
    fi

    echo "$1=$value" >> "$fn"
}

decodeline() {
  echo "$1" | sed -rn 's/^([^#=]*)=(.*)$/\2/p' | base64 -d
}

# readsecret SECRET [filename owner:group mode]
readsecret() {
  local fn='/.secret.env'
  local value

  while IFS= read -r p; do
    if [ "$(echo "$p" | sed -rn 's/^([^#=]*)=(.*)$/\1/p')" = "$1" ]; then
      if [ -n "$2" ]; then
        decodeline "$p" > "$2"
        if [ -n "$3" ]; then
          chown "$3" "$2"
          if [ -n "$4" ]; then
            chmod "$4" "$2"
          fi
        fi
      else
        decodeline "$p"
      fi
      return 0
    fi
  done < "$fn"
  echo "Secret not found: $1" >&2; return 1
}
