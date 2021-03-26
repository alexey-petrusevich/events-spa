#!/bin/bash

export MIX_ENV=prod
# Common port range for this is 4000-10,000
# Valid port range for a user app to listen
# on is something like 1025-32767
export PORT=4793
export SECRET_KEY_BASE=insecure
export DATABASE_URL=insecure

mix deps.get --only prod
mix compile

CFGD=$(readlink -f /home/events-spa/.config/server)

echo $CFGD

if [ ! -d "$CFGD" ]; then
    mkdir -p "$CFGD"
fi

echo "checking base"
if [ ! -e "$CFGD/base" ]; then
    mix phx.gen.secret > "$CFGD/base"
    echo "in base"
    echo "$CFGD/base"
fi

echo "checking db pass"
if [ ! -e "$CFGD/db_pass" ]; then
    pwgen 12 1 > "$CFGD/db_pass"
    echo "in db pass"
    echo "$CFGD/db_pass"
fi

SECRET_KEY_BASE=$(cat "$CFGD/base")
export SECRET_KEY_BASE

DB_PASS=$(cat "$CFGD/db_pass")
export DATABASE_URL=ecto://events_spa:$DB_PASS@localhost/events_app_prod

mix ecto.migrate

npm install --prefix ./assets
npm run deploy --prefix ./assets
mix phx.digest

mix release
