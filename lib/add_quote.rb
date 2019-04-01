def add_quote
# create a new instance of the quote class
  new_quote = Quote.new

# iterates through authors in DB and allows user to choose one
  prompt = TTY::Prompt.new
  name = prompt.select('Select an author to add a quote.') do |menu|
      Author.all.select do |author|
        menu.choice author.name
    end
  end

# assigns selected author ID to newly created quote instance
  new_quote.author_id = Author.all.find_by(name: name).id

# prompts the user to enter the content of the quote and then saves it to the newly created instance
  new_quote.content = prompt.ask("What is the quote?")

# Instantiates a client
  language = Google::Cloud::Language.new
# Detects the sentiment of the text
  response = language.analyze_sentiment content: new_quote.content, type: :PLAIN_TEXT
# Get document sentiment from response
  sentiment = response.document_sentiment
# Saves sentiment score and magnitude to newly created quote instance
  new_quote.score = sentiment.score
  new_quote.magnitude = sentiment.magnitude

# Evaluates score and magnitude to assign a simple analysis as a string
  if new_quote.score > 0.1 && new_quote.magnitude > 0.2
    new_quote.sentiment = "positive"
  elsif new_quote.score < 0 && new_quote.magnitude > 0.2
    new_quote.sentiment = "negative"
  elsif (0..0.19).include?(new_quote.magnitude)
    new_quote.sentiment = "neutral"
  end

# Saves the updated quote instance with columns filled in to DB
  new_quote.save

#  Return to start menu
  menu

end
