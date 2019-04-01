# Welcomes new or returning user to game
def welcome

# uses artii gem to display a totally sick title
  a = Artii::Base.new :font => 'epic'
  puts Rainbow(a.asciify('...MOOD QUIZ...')).purple

# grabs the users name
  prompt = TTY::Prompt.new
  username = prompt.ask('What is your name?')

# If the user has never logged on before,
  if User.find_by(name: username) == nil

#  ...asks the user for their city,
    city = prompt.ask('What is your city name?')
# ...creates a new User instance and saves the entered city and username, then saves the instance to DB
    new_user = User.new
    new_user.name = username
    new_user.city = city
    new_user.save
# welcome message for the new users
    puts "Welcome #{username}"
  else
# if the user already exists in the DB, welcomes the user back
    puts "Welcome back #{username}"
  end

# logs the current user in by username
  current_user = User.find_by(name: username)
  current_user.logged_in = true
  current_user.save
end
