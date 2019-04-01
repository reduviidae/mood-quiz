# determines user mood
def user_total_score

# grabs the currently logged in user
  user = User.all.find_by(logged_in: true)

# calculates cumulative average score and magnitude based on all liked quotes
  score_sum = user.quotes.sum(:score)
  magnitude_sum = user.quotes.sum(:score)
  quote_count = user.quotes.length
  score = score_sum / quote_count
  magnitude = magnitude_sum / quote_count

# counts the number of quotes marked as positive, negative, and neutral
  positive_count = user.quotes.where("sentiment = 'positive'").count
  negative_count = user.quotes.where("sentiment = 'negative'").count
  neutral_count = user.quotes.where("sentiment = 'neutral'").count

# performs simple analysis and returns results based on cumulative score and magnitude
  case
    when score > 0.5 && magnitude > 0.5
      puts "Based on this sample of quotes, it would seem that #{user.name} is very positive!"
    when score > 0.1 && magnitude > 0.2
      puts "Based on this sample of quotes, it would seem that #{user.name} is somewhat positive."
    when score < 0 && magnitude > 0.5
      puts "Based on this sample of quotes, it would seem that #{user.name} is very negative."
    when score < 0 && magnitude > 0.2
      puts "Based on this sample of quotes, it would seem that #{user.name} is somewhat negative."
    when (0..0.19).include?(magnitude)
      puts "Based on this samle of quotes, it would seem that #{user.name} is pretty neutral"
    when (0...0.1).include?(score) && magnitude > 0.2
      puts "Based on this samle of quotes, it would seem that #{user.name} is a mixed bag!"
  end
  puts "Score: #{score}"
  puts "Magnitude: #{magnitude}"
  puts "#{user.name} has liked #{positive_count} positive quotes, #{negative_count} negative quotes, and #{neutral_count} neutral quotes."

# return to start menu
  menu
end
