# Mood Quiz

Mood quiz is an app that has you select between two quotes until you reach the end, at which point your sentiment score can be accessed from the menu. This app relies on quotes scraped from GoodReads.com, and on Google's Sentiment Analysis API.

### Menu Options

1. Take the quiz -- take the quiz to see which mood of quotes you prefer
2. See author moods -- based on the quotes in this app, see what kind of mood each author has
3. See my overall mood -- see the combined results of each time you've taken the quiz
4. See my mood by date -- see the results for any one day on which you've taken the quiz
5. Add quote -- add a quote for any of the authors existing in the database
6. Logout

### Issues

Adding new authors is currently unavailable. Seeding process must be done manually. If someone were to clone this repo and try to play the game, they would have to run:

- `ruby seeding/seed_authors`
- `ruby seeding/add_img_urls`
- `ruby seeding/scraping/quote_source`
- `ruby seeding/sentiment/google_sentiment`

...in order before being able to run `ruby bin/run`.

Currently accepting the city of the user but this is not being used. Update will include ability to check the weather by day the quiz was taken to see if that affects the mood of the user.
