begin
  require_relative 'env.rb'
rescue LoadError
end

require 'sequel/core'

# Delete DATABASE_URL from the environment, so it isn't accidently
# passed to subprocesses.  DATABASE_URL may contain passwords.
DB = Sequel.connect(ENV.delete('DATABASE_URL'))
