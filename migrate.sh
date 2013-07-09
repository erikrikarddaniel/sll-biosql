#!/bin/sh
bundle exec rake db:migrate && bundle exec annotate --position=before

# Here we first setup an empty test database, then populate it with some non
# Rails data that some tests are dependent on.
bundle exec rake db:test:prepare && bundle exec rake db:populate_test RAILS_ENV=test
