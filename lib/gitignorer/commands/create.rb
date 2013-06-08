module Gitignorer
  module Commands
    class Create
      class << self
        def process(args, options = {})
          if args.empty?
            raise ArgumentError.new('You must include template names.')
          end

          unless args_valid? args
            raise ArgumentError.new('Invalid template names.')
          end

          write_gitignore(args)
        end


        private

        # Checks if the supplied argument names are valid by checking if they
        # are within the list of gitignore templates.
        #
        # @param args (Array) Array of arguments passed
        # @return (Boolean) whether the arguments are valid
        def args_valid?(args)
          templates = Octonore::Template.list

          unless (args - templates).empty?
            return false
          end

          return true
        end

        # Generates and writes a gitignore to file.
        #
        # @param template_names (Array) Names of templates to use.
        def write_gitignore(template_names)
          templates = Octonore::Template.list
          write_string = String.new

          (templates & template_names).each do |name|
            to_add = Array.new
            to_add.push(Octonore::Template.new(name))

            to_add.each do |t|
              write_string += template_header(t.name) + t.source + "\n\n"
            end
          end

          File.open('.gitignore', 'w') { |file| file.write(write_string) }
        end

        # Gets the template header for the specified template.
        #
        # @param name (String) Template name to generate template for.
        # @return (String) Template header
        def template_header(name)
          space = 3
          
          # Should be something like '############'
          bar     = '#' * 4 + '#' * space + '#' * name.length
          # Should be something like '#   '
          padding = '#' + ' ' * space
          # Will end up looking similar to the following:
          #
          #     ############
          #     #   Ruby   #
          #     ############
          header  = "#{ bar }\n" +
                    "#{ padding  + name + padding.reverse }\n" +
                    "#{ bar }\n"
        end
      end
    end
  end
end
