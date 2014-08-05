require 'active_record'
require 'rspec'

# This drill uses an in-memory SQLite database. So the database never
# will exist as a file. The reason for this approach is to allow you to
# quickly iterate on the DB schema, without the typical 'rake db:drop; rake
# db:create; rake db:migrate' dance.
#
# The following line configures ActiveRecord to use the in memory DB.
ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

require_relative 'migrations'
require_relative 'models'
require_relative 'seeds'

