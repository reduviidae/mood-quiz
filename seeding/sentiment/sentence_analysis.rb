# This file is no longer in use, as I am currently using the google API instead of the sentimental gem.
# However, as I have been having issues with Google thinking that I am using their API to mine cryptocurrency,
# and as I am not sure why they have that impression, I am keeping this in case I need to revert to using
# the sentimental gem in the future.


require_relative '../../config/environment'
require 'sentimental'

analyzer = Sentimental.new
analyzer.load_defaults

def analyze_assign_sentiment
  analyzer = Sentimental.new
  analyzer.load_defaults
  Quote.all.each do |quote|
# Note that if I do need to revert to using the sentimental gem, I will no longer have a use for the
# magnitude column, as that is not a value the sentimental gem can provide
    quote.sentiment = analyzer.sentiment quote.content
    quote.score = analyzer.score quote.content
    quote.save
  end
  # binding.pry
end

analyze_assign_sentiment




# sentiment = analyzer.sentiment 'Be the reason someone smiles today'
# score = analyzer.score 'Be the reason someone smiles today'
# puts sentiment, score
