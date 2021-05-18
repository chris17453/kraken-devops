#!/bin/bash
# straight up ripped from -> https://github.com/uphold/docker-litecoin-core/blob/master/0.18/docker-entrypoint.sh
# updated shell to bash
# switched to double brackets

#Added path for app dir
export PATH=$PATH:$LITECOIN_APP_DIR:$LITECOIN_APP_DIR/bin
set -e

if [[ $(echo "$1" | cut -c1) = "-" ]]; then
  echo "$0: assuming arguments for litecoind"
  set -- litecoind "$@"
fi

if [[ $(echo "$1" | cut -c1) = "-" ]] || [[ "$1" = "litecoind" ]]; then
  mkdir -p "$LITECOIN_DATA"
  chmod 770 "$LITECOIN_DATA" || echo "Could not chmod $LITECOIN_DATA (may not have appropriate permissions)"
  chown -R litecoin "$LITECOIN_DATA" || echo "Could not chown $LITECOIN_DATA (may not have appropriate permissions)"

  echo "$0: setting data directory to $LITECOIN_DATA"
  set -- "$@" -datadir="$LITECOIN_DATA"
fi

if [[ "$(id -u)" = "0" ]] && ([[ "$1" = "litecoind" ]] || [[ "$1" = "litecoin-cli" ]] || [[ "$1" = "litecoin-tx" ]]); then
  # added some textual WHERE AM I
  echo "gosu litecoin!"
  set -- gosu litecoin "$@"
fi

exec "$@"