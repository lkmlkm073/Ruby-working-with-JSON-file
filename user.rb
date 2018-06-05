require 'json'
# class User
class User
  attr_accessor :email, :name, :permissions
  # initialization
  def initialize(*args)
    @email = args[0]
    @name = args[1]
    @permissions = User.permissions_from_template
  end
  # class method
  def self.permissions_from_template
    # load file name 'user_permissions_template.json'
    file = File.read 'user_permissions_template.json'
    JSON.load(file, nil, symbolize_names: true)
  end
  # method that will create 'users.json' file and save the current user's info
  # if 'users.json' already created, store the info on the next line
  def save
    self_json = {email: @email, name: @name, permissions: @permissions}.to_json
    open('users.json', 'a') do |file|
      file.puts self_json
    end
  end
end
