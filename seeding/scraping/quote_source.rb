require_relative '../../config/environment'

# destroy all the quotes in the database before repopulated to avoid duplicates
Quote.destroy_all

# scrape goodreads by author quote page and save nokogiri document
melville = Nokogiri::HTML(open("https://www.goodreads.com/author/quotes/1624.Herman_Melville"))
austen = Nokogiri::HTML(open("https://www.goodreads.com/author/quotes/1265.Jane_Austen"))
morrison = Nokogiri::HTML(open("https://www.goodreads.com/author/quotes/3534.Toni_Morrison"))
baldwin = Nokogiri::HTML(open("https://www.goodreads.com/author/quotes/10427.James_Baldwin"))
murakami = Nokogiri::HTML(open("https://www.goodreads.com/author/quotes/3354.Haruki_Murakami"))

binding.pry

# takes nokogiri doc as an argument and pushes the content of the quotes to the array quotes
def getQuotes(doc)
  quotes = []
  doc.css(".quoteText").select do |quote|
    if quote.text.length < 560
      quotes << quote.text.strip.split("\n")[0]
    end
  end
  quotes
end

# run method by author and save to variable
melville_quotes = getQuotes(melville)
austen_quotes = getQuotes(austen)
morrison_quotes = getQuotes(morrison)
baldwin_quotes = getQuotes(baldwin)
murakami_quotes = getQuotes(murakami)

# method takes in author ID and an array of quotes
def create_quote(author_id, content_array)

# iterates over quote array to create new instances of the Quote class
  content_array.each do |content|
    quote = Quote.new
# saves the quote content and author id to the new instance, then saves to the DB
    quote.content = content
    quote.author_id = author_id
    quote.save
  end
end

# run create_quote by author and author ID
#  !!!! the author ID is not grabbed programmatically, and this should be changed
create_quote(27, melville_quotes)
create_quote(28, austen_quotes)
create_quote(29, morrison_quotes)
create_quote(30, baldwin_quotes)
create_quote(31, murakami_quotes)
