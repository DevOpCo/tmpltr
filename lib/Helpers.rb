require "uri"

class Validate
  def self.valid_name?(name)
    valid_chars = ('a'..'z').to_a.join << "'-"
    return false if (name !~ /[^[:space:]]/) || (name[0]==' ' || name[-1]==' ')
    nbr_spaces = name.count(' ')
    return false if nbr_spaces > 2
    name.downcase.count(valid_chars) + nbr_spaces == name.size
  end

  def self.valid_email?(email)
    (email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
  end

  def self.valid_url?(url)
    !!URI.parse(url)
  rescue URI::InvalidURIError
    false
  end

  def self.valid_file_location?(input)
    File.directory?(input)
  end

end
