module Gitignorer
  module Commands
    class List
      class << self
        def process(options = {})
          puts Octonore::Template.list
        end
      end
    end
  end
end
