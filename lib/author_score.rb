# reveals the sentiment of an author given the name as an argument
def author_score

# Menu iterates through authors in DB and allows user to select one
  prompt = TTY::Prompt.new
  name = prompt.select('Select an author to find their mood.') do |menu|
      Author.all.select do |author|
        menu.choice author.name
    end
  end

# get average score and magnitude by author
  score_sum = Author.all.find_by(name: name).quotes.sum(:score)
  magnitude_sum = Author.all.find_by(name: name).quotes.sum(:magnitude)
  quote_count = Author.all.find_by(name: name).quotes.length
  score = score_sum / quote_count
  magnitude = magnitude_sum / quote_count

# count the number of positive, negative, and neutral quotes by author
  positive_count = Author.all.find_by(name: name).quotes.where("sentiment = 'positive'").count
  negative_count = Author.all.find_by(name: name).quotes.where("sentiment = 'negative'").count
  neutral_count = negative_count = Author.all.find_by(name: name).quotes.where("sentiment = 'neutral'").count

# Make an ASCII drawing of the author based on the B&W png provided
  Rothko::Drawing.new(Author.all.find_by(name: name).img_url, 55)

# Evaluate the author's score and return a simple analysis
  case 
    when (score > 0.5) && (magnitude > 0.3)
    puts "Based on this sample of quotes, it would seem that #{name} is very positive!"
    when (score > 0.1) && (magnitude > 0.2)
      puts "Based on this sample of quotes, it would seem that #{name} is somewhat positive."
    when (score < 0) && (magnitude > 0.5)
      puts "Based on this sample of quotes, it would seem that #{name} is very negative."
    when (score < 0) && (magnitude > 0.2)
      puts "Based on this sample of quotes, it would seem that #{name} is somewhat negative."
    when (0..0.19).include?(magnitude)
      puts "Based on this samle of quotes, it would seem that #{name} is pretty neutral"
    when (score < 0.09) && (magnitude > 0.2)
      puts "Based on this samle of quotes, it would seem that #{name} is a mixed bag!"
  end

  # Display the average score & magnitude, along with counts of pos, neg, and neutral quotes.
  puts "Score: #{score}"
  puts "Magnitude: #{magnitude}"
  puts "#{name} has #{positive_count} positive quotes,  #{negative_count} negative quotes, and #{neutral_count} neutral quotes."

# returns to the menu
  menu

end
