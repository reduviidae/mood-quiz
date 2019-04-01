require_relative '../config/environment'

# destroy all author instances before adding them to DB to avoid repetition
Author.destroy_all

# create new Author instances, assign a name, and save to DB
melville = Author.new
melville.name = "Herman Melville"
melville.save
austen = Author.new
austen.name = "Jane Austen"
austen.save
morrison = Author.new
morrison.name = "Toni Morrisson"
morrison.save
baldwin = Author.new
baldwin.name = "James Baldwin"
baldwin.save
murakami = Author.new
murakami.name = "Haruki Murakami"
murakami.save
