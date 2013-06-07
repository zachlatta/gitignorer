#$:.unshift File.dirname(__FILE__) # For use/testing when no gem is installed

# Require all of the Ruby files in the given directory.
#
# @param path (String) The relative path from here to the directory.
def require_dir(path)
  glob = File.join(File.dirname(__FILE__), path, '*.rb')
  Dir[glob].each do |f|
    require f
  end
end

# For Gitignore templates
require 'octonore'

require_dir 'gitignorer/commands'

module Gitignorer
  VERSION = '0.0.1'
end
