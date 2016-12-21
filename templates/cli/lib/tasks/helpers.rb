module Helpers
  def self.included(base)
    base.class_eval do
      no_tasks do
        # Example helpers
        def valid_file_location?(input)
          File.directory?(input)
        end

        def validate_user_input(question, answer, proceed)
          say(question, :yellow)
          exit unless proceed.include? ask(answer, :bold)
        end

      end
    end
  end
end
