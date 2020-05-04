# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Housebathroom.destroy_all
Housebedroom.destroy_all
Housegarage.destroy_all
Houseother.destroy_all
Housekitchen.destroy_all
Bathroom.destroy_all
Bedroom.destroy_all
Garage.destroy_all
Kitchen.destroy_all
OtherRoom.destroy_all
RoomStyle.destroy_all
House.destroy_all




houses = []
10.times do
    houses << House.create
end

styles = [
    "modern",
    "contemporary",
    "minimalist",
    "industrial",
    "mid-century modern",
    "scandinavian",
    "traditional",
    "transitional"
]


styles.each { |s|  RoomStyle.create({style: s, cost: rand(0.5..5.0)}) }
room_styles = RoomStyle.all

bedrooms = []
20.times do
    index = rand(0...room_styles.length)
    bedrooms << Bedroom.create!({size: rand(25..100), room_style_id: room_styles[index].id})
end

bathrooms = []
20.times do
    bathrooms << Bathroom.create({size: rand(25..100), room_style_id: room_styles[rand(0...room_styles.length)].id})
end

kitchens = []
20.times do
    kitchens << Kitchen.create({size: rand(25..100), room_style_id: room_styles[rand(0...room_styles.length)].id})
end

garages = []
20.times do
    garages << Garage.create({size: rand(25..100), room_style_id: room_styles[rand(0...room_styles.length)].id})
end

other_room_type = [
    "Living Room",
    "Attic",
    "Office",
    "Basement",
    "Game Room",
    "Theatre"
]

otherrooms = []
20.times do
    otherrooms << OtherRoom.create({size: rand(25..100), room_style_id: room_styles[rand(0...room_styles.length)].id, room_type: other_room_type[rand(0...other_room_type.length)]})
end

30.times do
    Housebedroom.create({house_id: houses[rand(0...houses.length)].id, bedroom_id: bedrooms[rand(0...bedrooms.length)].id})
    Housebathroom.create({house_id: houses[rand(0...houses.length)].id, bathroom_id: bathrooms[rand(0...bathrooms.length)].id})
    Housekitchen.create({house_id: houses[rand(0...houses.length)].id, kitchen_id: kitchens[rand(0...kitchens.length)].id})
    Housegarage.create({house_id: houses[rand(0...houses.length)].id, garage_id: garages[rand(0...garages.length)].id})
    Houseother.create({house_id: houses[rand(0...houses.length)].id, other_room_id: otherrooms[rand(0...otherrooms.length)].id})
end