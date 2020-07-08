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

    def charities_in_my_city
       user_charity = Charity.find_by_city(self.city)
    end

    def display_all_charities
        prompt = TTY::Prompt.new
        charities = Charity.all.map do |charity|
            {charity.name => charity.id}
        end
        if !charities.empty?
            charity_id = prompt.select("Which charity would you like to view?", charities)
            charity = Charity.find_by(id: charity_id)
            Review.display_reviews_by_charity(charity)
            user_review = Review.find_by(user_id: self.id)
            if user_review.nil?
                prompt.select("Options: ") do |m|
                    m.choice "Would you like to leave a review?", -> {self.write_review_for_charity(charity)}
                    m.choice "Would you like to go back?", -> {self.display_all_charities}
                end
            else
                prompt.select("Options: ") do |m|
                    m.choice "Update review", -> {self.update_review_for_charity(charity)}
                    m.choice "Delete review", -> {self.delete_review_for_charity(charity)}
                    m.choice "Would you like to go back?", -> {self.display_all_charities}
                end
            end
        else
            puts "There are no charities to display!"
        end
    end

    def create_review(heading:, body:, rating:, charity:)
        Review.create_review(heading: heading, body: body, rating: rating, user: self, charity: charity)
    end

    def write_review_for_charity(charity)
        prompt = TTY::Prompt.new
        review_info = prompt.collect do 
            key(:rating).ask("On a scale of 1-10 what would you rate this charity?")
            key(:heading).ask("Please enter your review title: ")
            key(:body).ask("Please enter your review: ")
        end
        review_info[:charity] = charity
        self.create_review(review_info)
    end

    def update_review
    end

    def update_review_for_charity
        prompt = TTY::Prompt.new
        review_info = prompt.collect do 
            key(:rating).ask("On a scale of 1-10 what would you rate this charity?")
            key(:heading).ask("Please enter your review title: ")
            key(:body).ask("Please enter your review: ")
        end
    end
    
    def delete_review
    end

    def delete_review_for_charity
    end

end
