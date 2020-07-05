
User.destroy_all 
Charity.destroy_all
Review.destroy_all

u1 = User.create(name: "John", city: "NYC")
u2 = User.create(name: "Sally", city: "NYC")

c1 = Charity.create(name: "Save The World", city: "NYC", url: "www.savetheworld.com")

r1 = Review.create(heading: "The best!", body: "This charity is AMAZING!", rating: 8.9, user_id: u1.id, charity_id: c1.id)
r2 = Review.create(heading: "Awesome organization!", body: "This charity really saves the world!", rating: 9.5, user_id: u2.id, charity_id: c1.id)

binding.pry