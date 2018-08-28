require_relative('../models/item.rb')
require_relative('../models/manufacturer.rb')
require('pry-byebug')

man1 = Manufacturer.new({
  "id" => 1,
  "name" => "Floppomatic",
  "info" => "Takes the chops to makes the flops!"
})

man2 = Manufacturer.new({
  "id" => 2,
  "name" => "Doot-Tek",
  "info" => "Doot-Tek: Doing our Dooty!"
})

man1.save
man2.save

item1 = Item.new({
  "id" => 1,
  "name" => "Floppotron",
  "man_id" => 1,
  "info" => "Flops with the best!",
  "stock" => 5,
  "cost" => 100,
  "sale" => 300
  })

item2 = Item.new({
  "id" => 2,
  "name" => "G-Flop",
  "man_id" => 1,
  "info" => "Want the chops for gaming? You need the G-Flop!",
  "stock" => 24,
  "cost" => 200,
  "sale" => 500
})

item3 = Item.new({
  "id" => 3,
  "name" => "Flop-XL",
  "man_id" => 1,
  "info" => "The Flop-XL brings flops to the larger amongst us!",
  "stock" => 30,
  "cost" => 120,
  "sale" => 350
})

item4 = Item.new({
  "id" => 4,
  "name" => "Dootmaster",
  "man_id" => 2,
  "info" => "The Dootmaster brings your Doots into the 21st Century!",
  "stock" => 12,
  "cost" => 200,
  "sale" => 500
})

item5 = Item.new({
  "id" => 5,
  "name" => "Dootmaster Pro",
  "man_id" => 2,
  "info" => "The Dootmaster Pro takes all the features of the standard Dootmaster and boosts performance up to 50% higher!",
  "stock" => 4,
  "cost" => 500,
  "sale" => 1000
})
item6 = Item.new({
  "id" => 6,
  "name" => "Dootmaster Pro XL",
  "man_id" => 2,
  "info" => "The Dootmaster Pro XL takes the Dootmaster Pro and adds an extra 4 inches to the screen size!",
  "stock" => 2,
  "cost" => 1000,
  "sale" => 2000
})

item1.save
item2.save
item3.save
item4.save
item5.save
item6.save

binding.pry
