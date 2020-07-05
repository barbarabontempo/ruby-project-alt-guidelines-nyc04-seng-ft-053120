#puropse of this class is to interact with user

class Interface
   attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
        self.welcome
    end

    def welcome
        puts "Welcome to Chlarity!"
    end

    def choose_login_or_register
        prompt.select("Logging in or registering?") do |menu|
            menu.choice "Logging in", -> { User.loggin_user_in }
            menu.choice "Registering", -> { User.create_new_user }
        end
    end

    #need to work on this 
    def main_menu
        puts "welcome to the app, #{user.user_name} "
       
    end

 
end