class User < ActiveRecord::Base
    has_many :reviews
    has_many :charities, through: :reviews

    def self.logging_someone_in
        prompt = TTY::Prompt.new
        user_name = prompt.ask("Insert your username:")
        spinner = TTY::Spinner.new("[:spinner] Loading...".colorize(:color => :yellow, :background => :light_white), format: :arrow_pulse)
        spinner.auto_spin 
        sleep(1)
        spinner.stop('Done!'.colorize(:color => :yellow, :background => :light_white))
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

def display_all_charities
    prompt = TTY::Prompt.new
    values_to_print = Charity.all.map do |charity|
        [charity.name, charity.reviews.average(:rating).to_f, charity.city]
    end
    Review.charities_display_table(values_to_print)
    charity_idx = prompt.ask("Please choose a charity to view [1-#{values_to_print.length}]:", convert: :int)
    charity = values_to_print[charity_idx - 1][1]
    found_charity = Charity.find_by(name: charity)
    #binding.pry
    Review.display_reviews_by_charity(found_charity)
    answer = prompt.select("Options: ") do |menu|
        menu.choice "Create review", -> {self.write_review_for_charity(found_charity)} #then once in here, be able to filter by cities
        menu.choice "View another charity", -> {self.display_all_charities}
        menu.choice "Back to main menu", -> {return}
    end
end

def display_charities_in_my_city
    prompt = TTY::Prompt.new
    my_charities = Charity.find_by_city(self.city)
    values_to_print = my_charities.map do |charity|
        [charity.name, charity.reviews.average(:rating).to_f, charity.city]
    end
    Review.charities_display_table(values_to_print)
    charity_idx = prompt.ask("Please choose a charity to view [1-#{values_to_print.length}]:", convert: :int)
    charity = values_to_print[charity_idx - 1][1]
    found_charity = Charity.find_by(name: charity)
    #binding.pry
    #Review.display_reviews_by_charity(found_charity)
    Review.display_reviews_by_charity(found_charity)
    answer = prompt.select("Options: ") do |menu|
        menu.choice "Create review", -> {self.write_review_for_charity(found_charity)} #then once in here, be able to filter by cities
        menu.choice "View another charity", -> {self.display_all_charities}
        menu.choice "Back to main menu", -> {return}
    end
end
    
    #add "you dont have any reviews"
    def see_my_reviews
        self.reload
        prompt = TTY::Prompt.new
        user_reviews = self.reviews
        revs_to_print = user_reviews.map do |rev| 
            [rev.charity.name, rev.rating, rev.heading, rev.body]
        end
        if revs_to_print.empty? 
            puts "You have not written any reviews!"
        else 
            Review.user_reviews_display_table(revs_to_print)
            rev_idx = prompt.ask("Please choose a review to edit [1-#{revs_to_print.length}]:", convert: :int)
            review = user_reviews[rev_idx - 1]
                prompt.select("Options: ") do |m|
                    m.choice "Update review", -> {self.update_review_content(review)}
                    m.choice "Delete review", -> {Review.delete_review(review)}
                    m.choice "Choose another review", -> {self.see_my_reviews} 
                    m.choice "Back to main menu", -> {return}
                end
        end
     
    end

    def create_review(heading:, body:, rating:, charity:)
        Review.create_review(heading: heading, body: body, rating: rating, user: self, charity: charity)
    end

    def write_review_for_charity(charity)
        prompt = TTY::Prompt.new
        review_info = prompt.collect do 
            key(:rating).ask("On a scale of 1-10 what would you rate this charity? ")
            key(:heading).ask("Please enter your review title: ")
            key(:body).ask("Please enter your review: ")
        end
        review_info[:charity] = charity
        self.create_review(review_info)
        puts "Your review has been submitted!"
        prompt.select("Options: ") do |m|
            m.choice "View another charity", -> {self.display_all_charities}
            m.choice "Back to main menu", -> {return}
        end
    end

    def update_review_content(review)
        prompt = TTY::Prompt.new
        review_info = prompt.collect do 
            key(:rating).ask("On a scale of 1-10 what would you rate this charity?")
            key(:heading).ask("Please enter your review title: ")
            key(:body).ask("Please enter your review: ")
        end
        review.update(review_info)
    end   

end
