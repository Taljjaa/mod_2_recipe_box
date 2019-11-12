# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# response = Nokogiri::HTML(open("https://minimalistbaker.com/easy-1-pot-massaman-curry/"))

def scrape_data(url)
    Nokogiri::HTML(open(url))
end

data = scrape_data("https://minimalistbaker.com/easy-1-pot-massaman-curry/")

url = "https://minimalistbaker.com/easy-1-pot-massaman-curry/"
name = data.css("h1.entry-title").children[0].text
image = data.css("img.size-full").first.values[1]
cook_time = data.css("span.wprm-recipe-details").children[4].text
recipe1 = Recipe.create(name: name, cook_time: cook_time, image: image, url: url)
# ingredients = data.css("div.wprm-recipe-ingredients-container")
# instructions = data.css("div.wprm-recipe-instructions-container")

data1 = scrape_data("https://minimalistbaker.com/easy-vegan-sausage-soy-gluten-free/")
url = "https://minimalistbaker.com/easy-vegan-sausage-soy-gluten-free/"
name = data1.css("h1.entry-title").children[0].text
image = data1.css("img.size-full").first.values[1]
cook_time = data1.css("span.wprm-recipe-details").children[4].text
recipe2 = Recipe.create(name: name, cook_time: cook_time, image: image, url: url)

user_me = User.create(username: "Jen")

vegetarian = Tag.create(name: "Vegetarian")
vegan = Tag.create(name: "Vegan")

user_r1 = UsersRecipe.create(user_id: user_me.id, recipe_id: recipe1.id)

recipe_t1 = RecipeTag.create(recipe_id: recipe2.id, tag_id: vegan.id)

