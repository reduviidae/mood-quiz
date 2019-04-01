# logs out user after session
def logout
# find the logged in user
  current_user = User.find_by(logged_in: true)
# log the user out and save to database
  current_user.logged_in = false
  current_user.save
# does not return to the start menu
end
