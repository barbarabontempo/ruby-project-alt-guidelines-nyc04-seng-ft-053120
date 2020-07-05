class User < ActiveRecord::Base
    has_many :reviews
    has_many :charities, through: :reviews

    def self.create_new_user
        prompt = TTY::Prompt.new
            user_info = prompt.collect do
                key(:name).ask("What is your name?:")
                key(:city).ask("What city do you live in?:")
                key(:user_name).ask("Create a username: ")
            end #this will keep looping until it finds a match
            until !User.find_by(user_name: user_info[:user_name])
                puts "Sorry, that display name has been taken"
                user_name = prompt.ask("Create a display name:")
            end
            User.create(name: user_info[:name], city: user_info[:city], user_name: user_info[:user_name])
        end

        def self.loggin_user_in
            prompt = TTY::Prompt.new
            user_name = prompt.ask("Insert your username:")
            find_user = User.find_by(user_name: user_name)
            if find_user
                return find_user 
            else 
                puts "Sorry, that name does not exist."
                return exit 
            end
        end
    end


#         if User.find_by(name: username)
#             puts "Sorry, this name is taken!"
#         end
#         User.create(name: username)
#     end

#     def self.logging_user_in
#         prompt = TTY::Prompt.new
#         username = prompt.ask("What is your username?")
#         found_user = User.find_by(name: username)
#         p found_user
#         if found_user
#             return found_user
#         else
#             puts "Sorry, that name does not exist!"
#         end
#     end

# end



