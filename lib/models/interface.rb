class Interface
    attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        puts "Welcome to...".colorize(:color => :white, :background => :green)
        sleep(0.5)
        Interface.chlarity_logo
        sleep(0.5)
        puts " "
        puts "        Where we help you be an informed donor... because not everyone deserves your coins!        ".colorize(:color => :white, :background => :green) 
        
    end

    def choose_login_or_register
            puts " "
            prompt.select("Are you logging in or registering?") do |menu|
            menu.choice "Log in", -> { User.logging_someone_in }
            menu.choice "Register", -> { User.create_a_new_user }
            menu.choice "Log out", -> { self.goodbye }
        end
    end

    def main_menu
        Interface.heart_animation
        puts "          Chlarity is happy to see you #{user.user_name}!         "
        puts " "
        puts "              Lets find you the perfect charity!              "                                                  
        answer = prompt.select("Main Menu") do |menu|
            menu.enum "."
            menu.choice "Search for Charities", -> {self.view_charities_menu} #then once in here, be able to filter by cities
            menu.choice "View my Reviews", -> {user.see_my_reviews}
            menu.choice "Write a Review", -> {user.create_review}
            menu.choice "Update a Review", -> {user.update_review}
            menu.choice "Remove a Review", -> {user.delete_review}
            menu.choice "Log out", -> { self.goodbye }
        end
    end

    def view_charities_menu
        prompt = TTY::Prompt.new
        prompt.select("Options:") do |m|
            m.enum "."
            m.choice "View all charities", -> {self.display_all_charities} 
            m.choice "View charities in your city only", -> {self.display_charities_in_my_city}
            m.choice "Go back to main menu", -> {self.main_menu}
        end
    end

    def display_all_charities
        user.display_all_charities
    end

    def display_charities_in_my_city
        user.display_charities_in_my_city
    end


    def goodbye
        Interface.heart_animation
        sleep(0.3)
        system("clear")
        puts "Goodbye"
        puts " "
        puts "Thank you for choosing us."

    end

    def self.chlarity_logo
        puts "
         ██████╗██╗  ██╗██╗      █████╗ ██████╗ ██╗████████╗██╗   ██╗
        ██╔════╝██║  ██║██║     ██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝
        ██║     ███████║██║     ███████║██████╔╝██║   ██║    ╚████╔╝ 
        ██║     ██╔══██║██║     ██╔══██║██╔══██╗██║   ██║     ╚██╔╝  
        ╚██████╗██║  ██║███████╗██║  ██║██║  ██║██║   ██║      ██║   
         ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝
            ".yellow
    end

    def self.heart_animation
        frame0 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     :No  
                  `Mo                hm  
                   sN-              /M+  
                    +No`          `yN/   
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame1 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     
                  `Mo                hm  
                   sN-              /M+  
                    +No`          `yN/   
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame2 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     :No  
                  `Mo               
                   sN-              /M+  
                    +No`          `yN/   
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame3 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     :No  
                  `Mo                hm  
                   sN-               
                    +No`          `yN/   
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame4 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     :No  
                  `Mo                hm  
                   sN-              /M+  
                    +No`            
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame5 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     :No  
                  `Mo                hm  
                   sN-              /M+  
                    +No`          `yN/   
                     .yNo`          
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame6 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     :No  
                  `Mo                hm  
                   sN-              /M+  
                    +No`          `yN/   
                     .yNo`      .sNs`    
                       .sNs-       
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame7 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     :No  
                  `Mo                hm  
                   sN-              /M+  
                    +No`          `yN/   
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.             ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame8 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     :No  
                  `Mo                hm  
                   sN-              /M+  
                    +No`          `yN/   
                     .yNo`      .sNs`    
                              :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame9 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     :No  
                  `Mo                hm  
                   sN-              /M+  
                    +No`          `yN/   
                                .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame10 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     :No  
                  `Mo                hm  
                   sN-              /M+  
                                  `yN/   
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame11 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     :No  
                  `Mo                hm  
                                    /M+  
                    +No`          `yN/   
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame12 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.    `oNN+     :No  
                                     hm  
                   sN-              /M+  
                    +No`          `yN/   
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame12 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                          `oNN+     :No  
                  `Mo                hm  
                   sN-              /M+  
                    +No`          `yN/   
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame13 = "
                              -:-`     
                             -ymyosdd/   
                   hm.    `oNN+     :No  
                  `Mo                hm  
                   sN-              /M+  
                    +No`          `yN/   
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame14 = "
                    `-:.      -:-`     
                    +mdsoyms.-ymyosdd/   
                   hm.              :No  
                  `Mo                hm  
                   sN-              /M+  
                    +No`          `yN/   
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        frame15 = "
                    `-:.           
                    +mdsoyms.   
                   hm.    `oNN+     :No  
                  `Mo                hm  
                   sN-              /M+  
                    +No`          `yN/   
                     .yNo`      .sNs`    
                       .sNs-  :ymo`      
                .:++/:.  `+ddmh/    ``   
            `dmdyo///ohms-  .`    -hmdd` 
            -M/      :``+hmhsoo++dd/:mh` 
            -M/     `smh/.`-:+osMy`yN/   
            `hdddddhs:`-ohhyyyss+/Ny`    
                   `:smhooooooooyN/      
                       .::::::::-` 
        ".yellow 

        animation_array = [frame0, frame1, frame2, 
        frame3, frame4, frame5, frame6, frame7, frame8,
        frame9, frame10, frame11, frame12, frame13, frame14, frame15]

        2.times do 
            i = 1
            while i < 5
                animation_array.each do |frame|
                    puts frame
                    sleep(0.05)
                    system("clear")
                    i+=1
                end
                system("clear")
            end
        end
      end


end











