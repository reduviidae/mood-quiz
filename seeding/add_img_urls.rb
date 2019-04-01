require_relative '../config/environment'

def add_img_url(name)
  name_url = name.downcase.gsub(" ", "_")
  author = Author.all.find_by(name: name)
  author.img_url = "./images/#{name_url}.png"
  author.save
end

add_img_url("Herman Melville")
add_img_url("Haruki Murakami")
add_img_url("James Baldwin")
add_img_url("Jane Austen")
add_img_url("Toni Morrisson")
