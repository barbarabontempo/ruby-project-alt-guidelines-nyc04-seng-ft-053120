
User.destroy_all 
Charity.destroy_all
Review.destroy_all

john = User.create(name: "John", city: "NYC", user_name: "cooljohn")
sally = User.create(name: "Sally", city: "NYC", user_name: "sallysaves")

c1 = Charity.create(name: "Save The World", city: "NYC", url: "www.savetheworld.com")

r1 = Review.create(heading: "The best!", body: "This charity is AMAZING!", rating: 8.9, user_id: john, charity_id: c1.id)
r2 = Review.create(heading: "Awesome organization!", body: "This charity really saves the world!", rating: 9.5, user_id: sally.id, charity_id: c1.id)

puts "Done SEEEDING! "
