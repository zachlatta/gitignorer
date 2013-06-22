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

          create_gitignore(args)
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
        def create_gitignore(template_names)

          templates = Octonore::Template.list
          write_string = String.new

          (templates & template_names).each do |name|
            to_add = Array.new
            to_add.push(Octonore::Template.new(name))

            to_add.each do |t|
              write_string += template_header(t.name) + t.source + "\n\n"
            end
          end

          write_check_overwrite('.gitignore', write_string)
        end

        # Get the template header for the specified template.
        #
        # @param name (String) Template name to generate template for.
        # @return (String) Template header
        def template_header(name)

          space = 3
          
          # Should be something like '#   '
          padding = '#' + ' ' * space
          # Should be something like '############'
          bar     = '#' * padding.length * 2 + '#' * name.length
          # Will end up looking similar to the following:
          #
          #     ############
          #     #   Ruby   #
          #     ############
          header  = "#{ bar }\n" +
                    "#{ padding  + name + padding.reverse }\n" +
                    "#{ bar }\n"
        end

        # Write a file to disk and prompts the user before overwriting an
        # existing file.
        #
        # @param file_name (String) Name of file to write to
        # @param contents (String) Contents of file to write.
        def write_check_overwrite(file_name, contents)

          if File.exists?(file_name)
            puts "#{ file_name } exists! Overwrite (y/n): "
            
            if gets.strip.downcase == 'y'
              write(file_name, contents)
            end
          else
            write(file_name, contents)
          end
        end

        # Writes something to a file.
        #
        # @param file_name (String) Name of file.
        # @param contents (String) Contents of file.
        def write(file_name, contents)

          File.open(file_name, 'w') { |file| file.write(contents) }
        end
      end
    end
  end
end
