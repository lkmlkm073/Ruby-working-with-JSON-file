# a simple runner program
require 'pp'
require_relative 'user'   # user.rb in the current directory

# methods
# save info to users.json file
def save_info (user_email, user_name)
  user = User.new(user_email, user_name)
  user.save
  pp user
  puts "User is successfully added. \nContinue?(Y/N) \n"
  
  prompt = gets.chomp
  get_info(prompt)
end
# get email and name of the user
def get_info (prompt)
  if prompt == "Y" || prompt == "y"
    puts "Enter the email of the user: "
    email = gets.chomp
    puts "Enter the name of the user: "
    name = gets.chomp
    save_info(email, name)
  else
    puts "Terminating.."
  end
end

puts "Do you want to add a user info(Y/N)\n"
prompt = gets.chomp

get_info(prompt)

