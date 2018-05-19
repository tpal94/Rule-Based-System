# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# Default user
user = User.create(name: "anup", email: "anup@instachk.today", password: "password")

# GENDER BASED RULE
gender_rule = Rule.create(name: "GENDER BASED", icon_image: "sidebar_icon/gender.png")
# Children for gender rule 
Rule.create(name: "Male", parent_id: gender_rule.id, icon_image: "rules/male.png")
Rule.create(name: "Female", parent_id: gender_rule.id, icon_image: "rules/female.png" )

# GEOGRAPHY RULE
geography_rule = Rule.create(name: "GEOGRAPHY", icon_image: "sidebar_icon/location.png")
# Children of geography rule
Rule.create(name: "Country", parent_id: geography_rule.id, icon_image: "rules/india.jpg")
Rule.create(name: "State", parent_id: geography_rule.id, icon_image: "rules/karnataka.jpg")
Rule.create(name: "City", parent_id: geography_rule.id, icon_image: "city/banglore.jpg")
# Rule.create(name: "Zone", parent_id: geography_rule.id, icon_image: "rules/north_zone.jpg")
Rule.create(name: "Store", parent_id: geography_rule.id, icon_image: "rules/7up.png")


# TIME BASED RULE
time_based_rule = Rule.create(name: "TIME BASED", icon_image: "sidebar_icon/time.png")
# Children of time based rule
Rule.create(name: "Start and End date with time", parent_id: time_based_rule.id, icon_image: "rules/calendar.png")


# PRODUCT STRATEGY RULE
product_strategy_rule = Rule.create(name: "PRODUCT STRATEGY", icon_image: "sidebar_icon/product.png")
# Children of product strategy rule
Rule.create(name: "Category", parent_id: product_strategy_rule.id, icon_image: "")
Rule.create(name: "Brand", parent_id: product_strategy_rule.id, icon_image: "")
Rule.create(name: "Product", parent_id: product_strategy_rule.id, icon_image: "")
Rule.create(name: "Amount Spent on Product", parent_id: product_strategy_rule.id, icon_image: "")
Rule.create(name: "Total shopping Value", parent_id: product_strategy_rule.id, icon_image: "")
Rule.create(name: "Frequency of Purchase", parent_id: product_strategy_rule.id, icon_image: "")
Rule.create(name: "Quantity", parent_id: product_strategy_rule.id, icon_image: "")
Rule.create(name: "Unit", parent_id: product_strategy_rule.id, icon_image: "")
Rule.create(name: "Age Group", parent_id: product_strategy_rule.id, icon_image: "")


# SHOPPING BEHAVIOR BASED RULE
shopping_behavior_based_rule = Rule.create(name: "SHOPPING BEHAVIOR", icon_image: "sidebar_icon/shopping.png")
# Children of shopping behavior based rule
Rule.create(name: "Monthly Amount Spent on Product", parent_id: shopping_behavior_based_rule.id, icon_image: "")
Rule.create(name: "Monthly Quantity of Product", parent_id: shopping_behavior_based_rule.id, icon_image: "")
Rule.create(name: "Monthly Total Shopping Value", parent_id: shopping_behavior_based_rule.id, icon_image: "")


# OCASSION BASED RULE
occasion_based_rule = Rule.create(name: "OCASSION BASED", icon_image: "sidebar_icon/occasion.png")
# Children of occasion based rule
Rule.create(name: "Birthday", parent_id: occasion_based_rule.id, icon_image: "rules/calendar.png")
Rule.create(name: "Anniversary", parent_id: occasion_based_rule.id, icon_image: "rules/calendar.png")
Rule.create(name: "Monthly Specials", parent_id: occasion_based_rule.id, icon_image: "rules/calendar.png")


# LOYAL CUSTOMER PROGRAMME RULE
loyal_customer_programme_rule = Rule.create(name: "LOYAL CUSTOMER PROGRAMME", icon_image: "sidebar_icon/loyal_customer.png")
# Children of loyal customer programme rule
Rule.create(name: "Membership", parent_id: loyal_customer_programme_rule.id, icon_image: "rules/calendar.png")
Rule.create(name: "Rewards", parent_id: loyal_customer_programme_rule.id, icon_image: "rules/calendar.png")

# FP APP TRIGGER RULE
fp_app_trigger_rule = Rule.create(name: "FP APP TRIGGER", icon_image: "sidebar_icon/app_trigger.png")
# Children of fp app trigger rule
Rule.create(name: "Referral", parent_id: fp_app_trigger_rule.id, icon_image: "rules/calendar.png")
Rule.create(name: "App Download", parent_id: fp_app_trigger_rule.id, icon_image: "")
Rule.create(name: "Wallet Payment", parent_id: fp_app_trigger_rule.id, icon_image: "")
Rule.create(name: "Wallet Recharge", parent_id: fp_app_trigger_rule.id, icon_image: "")
Rule.create(name: "In-App Engagement Trigger", parent_id: fp_app_trigger_rule.id, icon_image: "")
Rule.create(name: "App Rating & Review", parent_id: fp_app_trigger_rule.id, icon_image: "")


# RESTRICTIONS RULE
restrictions_rule = Rule.create(name: "RESTRICTIONS", icon_image: "sidebar_icon/restrictions.png")
# Children of restriction rule
Rule.create(name: "Club with other offers", parent_id: restrictions_rule.id, icon_image: "rules/calendar.png")
Rule.create(name: "No of times coupon can be Used", parent_id: restrictions_rule.id, icon_image: "")
Rule.create(name: "No of Item Per Person", parent_id: restrictions_rule.id, icon_image: "")
Rule.create(name: "Minimum Purchase", parent_id: restrictions_rule.id, icon_image: "")

# Creating Country
country = Country.create(name: "India", image_icon: "country/india.jpg", currency: "Rupee")



# Associating country with first user
country_user = CountryUser.create(country_id: country.id, user_id: user.id)

# Creating Zone and associatiing it with country india
# north_zone = Zone.create(name: "North Zone", 
# 												 country_id: country.id, 
# 												 image_icon: "zone/north_zone.jpg")

# south_zone = Zone.create(name: "South Zone", 
# 												 country_id: country.id, 
# 												 image_icon: "zone/south_zone.jpg")

# east_zone = Zone.create(name: "East Zone", 
# 												 country_id: country.id, 
# 												 image_icon: "zone/east_zone.jpg")

# west_zone = Zone.create(name: "West Zone", 
# 												 country_id: country.id, 
# 												 image_icon: "zone/west_zone.jpg")

# Associating zone with first user
# west_zone_user = ZoneUser.create(zone_id: west_zone.id, user_id: user.id)
# south_zone_user = ZoneUser.create(zone_id: south_zone.id, user_id: user.id)

# Creating State and associating with country india and zone south
state = State.create(name: "Karnataka", 
										 image_icon: "state/karnataka.jpg", 
										 country_id: country.id)

# Associating state with first user
state_user = StateUser.create(state_id: state.id, user_id: user.id)

# Creating City and associating with state karnataka and zone south
city = City.create(name: "Bangalore",
									 image_icon: "city/banglore.jpg",
									 state_id: state.id)

# Associating city with first user
city_user = CityUser.create(city_id: city.id, user_id: user.id)

state = State.create(name: "Maharashtra", 
										 image_icon: "state/maharashtra.jpg", 
										 country_id: country.id)

City.create(name: "Aurangabad",
									 image_icon: "city/aurangabad.jpg",
									 state_id: state.id)
City.create(name: "Mumbai",
									 image_icon: "city/mumbai.jpg",
									 state_id: state.id)
City.create(name: "Nagpur",
									 image_icon: "city/nagpur.jpg",
									 state_id: state.id)
City.create(name: "Nasik",
									 image_icon: "city/nasik.jpg",
									 state_id: state.id)
City.create(name: "Panvel",
									 image_icon: "city/panvel.jpg",
									 state_id: state.id)
City.create(name: "Pune",
									 image_icon: "city/pune.jpg",
									 state_id: state.id)
City.create(name: "Solapur",
									 image_icon: "city/solapur.jpg",
									 state_id: state.id)
City.create(name: "Thane",
									 image_icon: "city/thane.jpg",
									 state_id: state.id)

country = Country.create(name: "Combodia", image_icon: "country/Cambodia.jpg", currency: "")
CountryUser.create(country_id: country.id, user_id: user.id)

country =Country.create(name: "China", image_icon: "country/chinese-flag-graphic.png", currency: "")
CountryUser.create(country_id: country.id, user_id: user.id)

country =Country.create(name: "Hong Kong", image_icon: "country/hong_kong.jpg", currency: "")
CountryUser.create(country_id: country.id, user_id: user.id)

country =Country.create(name: "Indonesia", image_icon: "country/indonesia.png", currency: "")
CountryUser.create(country_id: country.id, user_id: user.id)

country =Country.create(name: "Japan", image_icon: "country/Japan.png", currency: "")
CountryUser.create(country_id: country.id, user_id: user.id)

country =Country.create(name: "Singapore", image_icon: "country/Singapore.jpg", currency: "")
CountryUser.create(country_id: country.id, user_id: user.id)

country =Country.create(name: "Thailand", image_icon: "country/Thailand.jpg", currency: "")
CountryUser.create(country_id: country.id, user_id: user.id)

country =Country.create(name: "Vietnam", image_icon: "country/vietnam.jpg", currency: "")
CountryUser.create(country_id: country.id, user_id: user.id)

# Creating Store
store = Store.create(name: "Ccd", image_icon: "rules/7up.png", city_id: city.id)

# Creating Category 
category_one = Category.create(name: "Food & Beverages", image_icon: "category/category.jpg")

# Associating category with first user
category_one_user = CategoryUser.create(category_id: category_one.id, user_id: user.id)

# Creating Brands
brand = Brand.create(name: "7UP", category_id: category_one.id, image_icon: "brand/7_UP.png")

# Creating Product
product = Product.create(name: "Cheese Balls", image_icon: "category/food.jpg", brand_id: brand.id)

# Creating Organization
organization = Organization.create(name: "My Organizations")



category_one = Category.create(name: "Baby", image_icon: "category/baby.jpeg")
category_one_user = CategoryUser.create(category_id: category_one.id, user_id: user.id)

category_one = Category.create(name: "Beauty", image_icon: "category/beauty.jpg")
category_one_user = CategoryUser.create(category_id: category_one.id, user_id: user.id)

category_one = Category.create(name: "Book", image_icon: "category/books.png")
category_one_user = CategoryUser.create(category_id: category_one.id, user_id: user.id)

category_one = Category.create(name: "Electronics", image_icon: "category/Electronics.jpg")
category_one_user = CategoryUser.create(category_id: category_one.id, user_id: user.id)

category_one = Category.create(name: "Fashion", image_icon: "category/fashion.jpeg")
category_one_user = CategoryUser.create(category_id: category_one.id, user_id: user.id)

category_one = Category.create(name: "Food", image_icon: "category/food.jpeg")
category_one_user = CategoryUser.create(category_id: category_one.id, user_id: user.id)



category_one = Category.create(name: "Music", image_icon: "category/music.jpg")
category_one_user = CategoryUser.create(category_id: category_one.id, user_id: user.id)

category_one = Category.create(name: "Movie", image_icon: "category/moviees.jpg")
category_one_user = CategoryUser.create(category_id: category_one.id, user_id: user.id)


category_one = Category.create(name: "Laptop", image_icon: "category/laptops.jpg")
category_one_user = CategoryUser.create(category_id: category_one.id, user_id: user.id)

Brand.create(name: "Acer", category_id: category_one.id, image_icon: "Brands/acer.jpg")

Brand.create(name: "Asus", category_id: category_one.id, image_icon: "Brands/asus.jpg")
Brand.create(name: "HP", category_id: category_one.id, image_icon: "Brands/hp.jpg")
Brand.create(name: "Samsung", category_id: category_one.id, image_icon: "Brands/Samsung.jpg")
Brand.create(name: "Sony", category_id: category_one.id, image_icon: "Brands/sony.jpg")
Brand.create(name: "Toshiba", category_id: category_one.id, image_icon: "Brands/toshiba.jpg")

brand = Brand.create(name: "Apple", category_id: category_one.id, image_icon: "Brands/apple.jpg")
Product.create(name: "Macbook 13 Inch", image_icon: "Product_Laptops/apple/macbook-13inch.jpg", brand_id: brand.id)
Product.create(name: "Macbook 2016", image_icon: "Product_Laptops/apple/macbook-2016.jpg", brand_id: brand.id)
Product.create(name: "Macbook Air 11", image_icon: "Product_Laptops/apple/macbook-air-11.png", brand_id: brand.id)
Product.create(name: "Macbook Air 15", image_icon: "Product_Laptops/apple/macbook-air-15inch.jpg", brand_id: brand.id)
Product.create(name: "Macbook Air 2015", image_icon: "Product_Laptops/apple/macbook-air-2015.jpg", brand_id: brand.id)
Product.create(name: "Macbook Air 13", image_icon: "Product_Laptops/apple/macbook-air_13.png", brand_id: brand.id)
Product.create(name: "Macbook Pro 13", image_icon: "Product_Laptops/apple/macbook-pro-13.jpg", brand_id: brand.id)
Product.create(name: "Macbook Pro 17", image_icon: "Product_Laptops/apple/macbook-pro-17.jpg", brand_id: brand.id)

brand = Brand.create(name: "Dell", category_id: category_one.id, image_icon: "Brands/dell.png")
Product.create(name: "Dell Core i3", image_icon: "Product_Laptops/dell/dell-core-i3.jpg", brand_id: brand.id)
Product.create(name: "Dell Inspiron 15'6", image_icon: "Product_Laptops/dell/dell-inspiron-15.6.jpg", brand_id: brand.id)
Product.create(name: "Dell Inspiron 3000", image_icon: "Product_Laptops/dell/dell-inspiron-3000.jpg", brand_id: brand.id)
Product.create(name: "Dell Inspiron 5378", image_icon: "Product_Laptops/dell/dell-inspiron-5378.jpg", brand_id: brand.id)
Product.create(name: "Dell Inspiron", image_icon: "Product_Laptops/dell/dell-inspiron.jpg", brand_id: brand.id)
Product.create(name: "Dell Notebook inspiron", image_icon: "Product_Laptops/dell/dell-notebook-inspiron.jpg", brand_id: brand.id)
Product.create(name: "Dell Vostro", image_icon: "Product_Laptops/dell/dell-vostro.png", brand_id: brand.id)
Product.create(name: "Dell XPS", image_icon: "Product_Laptops/dell/dell_xps.jpg", brand_id: brand.id)





