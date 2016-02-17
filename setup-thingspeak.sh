#!/usr/bin/env bash

su docker -c "pacaur -S --noprogressbar --noedit --noconfirm thingspeak-git"
cd /opt/thingspeak
cp config/database.yml.example config/database.yml

#export RAILS_ENV=production

bundle install

START_APACHE=false start-servers
sleep 3 # sleep for a few seconds here to give mariadb a chance to get going

# fix the default usernames and passwords for mariadb
sed -i 's,username: thing,username: root,g' config/database.yml
sed -i 's,password: "speak",password: "",g' config/database.yml

# do the thingspeak setup things
bundle exec rake db:create
bundle exec rake db:schema:load

echo "AdminUser.create!(email: 'thing@speak.com', password: 'speakspeak', password_confirmation: 'speakspeak')" | bundle exec rails c

mysqladmin shutdown

