class User < ActiveRecord::Base
    has_many :reviews
    has_many :charities, through: :reviews

    def self.logging_someone_in
        prompt = TTY::Prompt.new
        user_name = prompt.ask("Insert your username:")
        find_user = User.find_by(user_name: user_name)
        if find_user
            return find_user 
        else 
            not_found = prompt.select("Username not found.", ["Try Again", "Register"])
            not_found == "Try Again" ? self.logging_someone_in : self.create_a_new_user
        end
    end
 
    def self.create_a_new_user
        prompt = TTY::Prompt.new
        user_info = prompt.collect do
            key(:name).ask("What is your name?:")
            key(:city).ask("What city do you live in?: ")
            key(:user_name).ask("Create a username: ")
        end 
            until !User.find_by(user_name: user_info[:user_name])
                puts "Sorry, that display name has been taken"
                user_name = prompt.ask("Create a display name:")
            end
        new_user = User.create(name: user_info[:name], city: user_info[:city], user_name: user_info[:user_name])
    end


    def view_charities
        prompt = TTY::Prompt.new
        prompt.select("Options:") do |m|
        m.enum "."
        m.choice "View all charities", -> {self.all_charities_and_reviews}
        m.choice "View charities in your city only", -> {self.see_charities_in_my_city}
        end
    end

    #this allows user to view a list of charity names and then select a charity that they want to see the reviews for
    def all_charities_and_reviews
        prompt = TTY::Prompt.new
        i = 1
        Charity.all.each do |charity_instance|
            puts "#{i}. #{charity_instance.name}"  
            i += 1
        end
        charity_selection = prompt.ask("What charity would you like to view? Enter the number: ").to_i
        the_charity = Charity.all[charity_selection - 1]
        self.see_charity_reviews(the_charity)
    end
    
    #this allows the user to see all the charity names and urls for charities in their city
    #also need to allow the user to return back to main menu, not sure how to do this yet
    def see_charities_in_my_city
        prompt = TTY::Prompt.new
        i = 1
        charities_in_my_city = Charity.all.where(city: self.city)
        charities_in_my_city.each do |charity_instance| 
            puts "#{i}. #{charity_instance.name} - #{charity_instance.url}"
            i += 1
        end
        charity_selection = prompt.ask("Which charity would you like to view? Enter the number: ").to_i
        the_charity = Charity.all[charity_selection - 1]
        self.see_charity_reviews(the_charity)
        #binding.pry
    end

    #this method displays all the reviews for selected charity
    def see_charity_reviews(charity)
        #binding.pry
        charity_reviews = Review.where(charity_id: charity.id)
    #tomorrow maybe add a line here that says; "Here are the reviews for: charity name"
       charity_reviews.each { |review_instance| 
       puts "Rating: #{review_instance.rating}"
       puts review_instance.heading
       puts review_instance.body 
       puts "Written by: #{review_instance.user.name}" 
       puts "----------"}
    end






end
