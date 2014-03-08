require 'pathname'

Pry.config.editor = proc { |file, line| "emacsclient #{file} +#{line}" }

if defined?(Rails) && Rails.env
  require 'logger'

  if defined?(ActiveRecord)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.clear_active_connections!
  end

  if defined?(DataMapper)
    DataMapper::Logger.new($stdout, :debug)
  end
end
