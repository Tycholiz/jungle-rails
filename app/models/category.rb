class Category < ActiveRecord::Base
  # these relationships enable us to look through the different tables using the keys linking them. ex. we can say category.products.category (obviously we would never do this)
  has_many :products

end
