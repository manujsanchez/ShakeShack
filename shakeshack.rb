class MilkShake
  def initialize
    @base_price = 3
    @ingredients = []    
  end

  def add_ingredient(ingredient)
    @ingredients.push(ingredient)
  end

  def price_of_milkshake
  #Let's establish what our counter should be before we start adding ingredients into the mix
    total_price_of_milkshake = @base_price
  #Add each ingredients price to our total
    @ingredients.each do |ingredient|
      total_price_of_milkshake += ingredient.price
    end
  #return  our total price to whoever called for it
    total_price_of_milkshake
  end
end

class Ingredient
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
end

class ShakeShop
  def initialize
    @milkshakes = []
  end

  def add_milkshakes(milkshake_flavor)
    @milkshakes.push(milkshake_flavor)
  end

  def checkout
    total_price = 0
    @milkshakes.each do |milkshake_flavor|
      total_price += milkshake_flavor.price_of_milkshake
    end
    total_price
  end
end

chocolate = Ingredient.new("Chocolate", 2)
cream = Ingredient.new("Cream", 1)
strawberry = Ingredient.new("Strawberry", 2)
peaches = Ingredient.new("Peaches", 3)
milk = Ingredient.new("Milk", 1)
peanuts = Ingredient.new("Peanuts", 0.5)

chocolate_milkshake = MilkShake.new
chocolate_milkshake.add_ingredient(chocolate)
chocolate_milkshake.add_ingredient(cream)

strawberry_milkshake = MilkShake.new
strawberry_milkshake.add_ingredient(strawberry)
strawberry_milkshake.add_ingredient(milk)

peaches_milkshake = MilkShake.new
peaches_milkshake.add_ingredient(peaches)
peaches_milkshake.add_ingredient(milk)
peaches_milkshake.add_ingredient(peanuts)

pedido_de_manuel = ShakeShop.new
pedido_de_manuel.add_milkshakes chocolate_milkshake
pedido_de_manuel.add_milkshakes strawberry_milkshake
pedido_de_manuel.add_milkshakes peaches_milkshake

puts pedido_de_manuel.checkout