class Interface
    attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        puts "Welcome to Chlarity!"
    end

    def choose_login_or_register
            prompt.select("Are you logging in or registering?") do |menu|
            menu.choice "Log in", -> { User.logging_someone_in }
            menu.choice "Register", -> { User.create_a_new_user }
            #menu.choice "Exit", -> { self.goodbye }
        end
    end



    def main_menu
        puts "Hello, welcome to the app, #{user.user_name}"
        answer = prompt.select("Main Menu") do |menu|
            menu.enum "."
            menu.choice "View all Charities", -> {see_all_charities} #then once in here, be able to filter by cities
            menu.choice "View my Reviews", -> {user.see_my_reviews}
            menu.choice "Write a Review", -> {user.create_review}
            menu.choice "Update a Review", -> {user.update_review}
            menu.choice "Remove a Review", -> {user.delete_review}
            menu.choice "Log out", -> { self.goodbye }
        end
    end




end