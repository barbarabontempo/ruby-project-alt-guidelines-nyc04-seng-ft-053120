
User.destroy_all 
Charity.destroy_all
Review.destroy_all

john = User.create(name: "John", city: "NYC", user_name: "cooljohn")
sally = User.create(name: "Sally", city: "NYC", user_name: "sallysaves")

c1 = Charity.create(name: "Robinhood Foundation", city: "NYC", url: "www.robinhood.org")
c2 = Charity.create(name: "CityMeals-on-Wheels", city: "NYC", url: "www.citymeals.org")
c3 = Charity.create(name: "New York Foundation for the Arts", city: "NYC", url: "www.nyfa.org")
c4 = Charity.create(name: "Chrysalis", city: "LA", url: "www.changelives.org")
c5 = Charity.create(name: "Elizabeth House", city: "LA", url: "www.savetelizabethhouse.net")
c6 = Charity.create(name: "First Place For Youth", city: "LA", url: "www.firstplaceforyouth.org")
c7 = Charity.create(name: "Alliance for the Great Lakes", city: "CHI", url: "www.greatlakes.org")
c8 = Charity.create(name: "Legal Aid Chicago", city: "CHI", url: "www.leagalaidchicago.org")
c9 = Charity.create(name: "PAWS Chicago", city: "CHI", url: "www.pawschicago.org")
c10 = Charity.create(name: "The Audre Lord Project", city: "NYC", url: "www.alp.org")

r1 = Review.create(heading: "The best!", body: "This charity is AMAZING!", rating: 8.9, user_id: john, charity_id: c1.id)
r2 = Review.create(heading: "Awesome organization!", body: "This charity really makes the world better!", rating: 9.5, user_id: sally.id, charity_id: c1.id)

puts "Done SEEEDING! "
