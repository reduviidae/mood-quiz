# gets sentiment analysis for user by day test taken instead of cumulative
def user_score_by_date

# grabs the currently logged in user
  user = User.all.find_by(logged_in: true)

# takes the timestamp from the user's likes and converts them to a readable format & stores unique dates in an array
  dates = user.likeds.map do |like|
    like.created_at.strftime("%B %d, %Y")
  end.uniq

# iterates through dates to create a menu of all available dates to view
  prompt = TTY::Prompt.new
  select = prompt.select('Which date?') do |menu|
    dates.each do |date|
      menu.choice date
    end
  end

# finds the logged in user's likeds by the date selected
  likes_that_day = user.likeds.select do |like|
    like.created_at.strftime("%B %d, %Y") == select
  end

# finds the average score and magnitude for that day for that user
  score_sum = 0
  magnitude_sum = 0
  likes_that_day.each do |like|
    score_sum += like.quote.score
    magnitude_sum += like.quote.magnitude
  end
  score = score_sum / likes_that_day.count
  magnitude = magnitude_sum / likes_that_day.count

# simple sentiment analysis performed and results displayed based on score and magnitude
  case
    when score > 0.5 && magnitude > 0.5
      puts "Based on this sample of quotes, it would seem that #{user.name} was very positive that day!"
    when score > 0.1 && magnitude > 0.2
      puts "Based on this sample of quotes, it would seem that #{user.name} was somewhat positive that day."
    when score < 0 && magnitude > 0.5
      puts "Based on this sample of quotes, it would seem that #{user.name} was very negative that day."
    when score < 0 && magnitude > 0.2
      puts "Based on this sample of quotes, it would seem that #{user.name} was somewhat negative that day."
    when (0..0.19).include?(magnitude)
      puts "Based on this samle of quotes, it would seem that #{user.name} was pretty neutral that day."
    when (0...0.1).include?(score) && magnitude > 0.2
      puts "Based on this samle of quotes, it would seem that #{user.name} was a mixed bag that day!"
  end
  puts "Score: #{score}"
  puts "Magnitude: #{magnitude}"

# return to the start menu
  menu
end
