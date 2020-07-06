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
            not_found = prompt.select("Username not found..", ["Try Again", "Register"])
            not_found == "Try Again" ? self.logging_someone_in : self.create_a_new_user
        end
    end
 
    def self.create_a_new_user
        prompt = TTY::Prompt.new
        user_info = prompt.collect do
            key(:name).ask("What is your name?:")
            key(:city).ask("What city do you live in?:")
            key(:user_name).ask("Create a username: ")
        end 
            until !User.find_by(user_name: user_info[:user_name])
                puts "Sorry, that display name has been taken"
                user_name = prompt.ask("Create a display name:")
            end
        new_user = User.create(name: user_info[:name], city: user_info[:city], user_name: user_info[:user_name])
    end

end


