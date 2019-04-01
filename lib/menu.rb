# options menu
def menu

# displays a start menu to the user and saves the value of the response to select
  prompt = TTY::Prompt.new
  select = prompt.select('What would you like to do?') do |menu|
    menu.choice "Take the quiz",  value: 1
    menu.choice "See author moods", value: 2
    menu.choice "See my overall mood", value: 3
    menu.choice "See my mood by date", value: 4
    menu.choice "Add quote", value: 5
    menu.choice "Logout", value: 6
  end

# runs a different method depending on the user selection
  case select[:value]
    when 1
        quiz
    when 2
      author_score
    when 3
      user_total_score
    when 4
      user_score_by_date
    when 5
      add_quote
    when 6
      logout
  end

end
