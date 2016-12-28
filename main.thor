require_relative "lib/Helpers"

class Tmpltr < Thor::Group
  include Thor::Actions

  argument :app_name
  class_option :template, :default => 'cli', :alias => '-t'

  def self.source_root
    File.dirname(__FILE__)
  end

  def print_starting_message
    say "\nCreating a new ruby project called #{app_name}\n", :yellow
  end

  def options_ask
    if options[:template] == 'gem'
      @author_name      = ask("Set gemspec value for author: ", :green)      while !Validate.valid_name?(@author_name)
      @author_email     = ask("Set gemspec value for email: ", :green)       while !Validate.valid_email?(@author_email)
      @spec_summary     = ask("One line summary for gemspec: ", :green)
      @spec_description = ask("One line description for gemspec: ", :green)
      @spec_homepage    = ask("Set gemspec value for homepage: ", :green)    while !Validate.valid_url?(@spec_homepage)
      puts "Value for author: #{@author_name}"
      puts "Value for email: #{@author_email}"
      puts "Value for summary: #{@spec_summary}"
      puts "Value for description: #{@spec_description}"
      puts "Value for homepage: #{@spec_homepage}"
      proceed = ask("Are these values correct? [Y, Yes, yes, y]")
      abort("Exiting, please run again") unless ["Y","Yes","yes","y"].include? proceed
    end
  end

  def apply_directory_template
    templates_directory = "templates/#{options[:template]}"
    directory templates_directory, app_name
  end

end
