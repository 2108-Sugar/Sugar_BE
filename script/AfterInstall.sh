#!/bin/bash
cd /var/www/html
bundle install
bundle update
#RAILS_ENV=production bundle install --path vendor/bundle
rake db:migrate
#RAILS_ENV=production bundle exec rake db:migrate
#RAILS_ENV=production bundle exec rake assets:clobber
#RAILS_ENV=production bundle exec rake assets:precompile
