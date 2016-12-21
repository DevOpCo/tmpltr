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

  def apply_directory_template
    templates_directory = "templates/#{options[:template]}"
    directory templates_directory, app_name
  end

end
