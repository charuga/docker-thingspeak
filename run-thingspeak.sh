#!/usr/bin/env bash
cd /opt/thingspeak

# startup the mariadb server
START_APACHE=false start-servers
sleep 3 # give mariadb a chance to get going

#export RAILS_ENV=production

# the thingspeak server will listen on port 3000
# with admin user/password =
# thing@speak.com/speakspeak

bundle exec rails server

