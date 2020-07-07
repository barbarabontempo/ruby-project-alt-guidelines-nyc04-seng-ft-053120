class Interface
    attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
        puts "Welcome to..."
        sleep(0.5)
        puts "

         ██████╗██╗  ██╗██╗      █████╗ ██████╗ ██╗████████╗██╗   ██╗
        ██╔════╝██║  ██║██║     ██╔══██╗██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝
        ██║     ███████║██║     ███████║██████╔╝██║   ██║    ╚████╔╝ 
        ██║     ██╔══██║██║     ██╔══██║██╔══██╗██║   ██║     ╚██╔╝  
        ╚██████╗██║  ██║███████╗██║  ██║██║  ██║██║   ██║      ██║   
         ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝
                                                                    
        Where we focus on transparency for the world's charities. 
        "
    end

    def choose_login_or_register
            prompt.select("Are you logging in or registering?") do |menu|
            menu.choice "Log in", -> { User.logging_someone_in }
            menu.choice "Register", -> { User.create_a_new_user }
            #menu.choice "Exit", -> { self.goodbye }
        end
    end



    def main_menu
        puts "          Chlarity is happy to see you #{user.user_name}!         "
        puts "                                                  
                                     `/syhhhs/`      .+shhhyo:`       
                                   :hMMmyssymMMy-  /dMMdssshNMNs.     
                                  sMMs.      -yMMydMNo`      -hMN:    
                                 +MM/          .hMNs`          sMM.   
                                 hMm             ``            .MM+   
                                 yMN`                          :MM/   
                                 .mMd`                        -NMh    
                                  .dMN:                      oMMy     
                                   `oMMy.                  :dMN/      
                                     .hMMs.              -hMMs`       
                                       -hMMy-          /dMMs.         
                                         -yMMd/`    .omMNo`           
                                           `omMNy:/hMMd/              
                           `.:oshhhyso/.      :yNMMmo.        `-.     
                       :dNNMMMmhyssyhmMMms-     `:-         +dMMMm/   
                       MMh/:.`        `:yNMmo-           `+mMm+.dMN   
                       MMs           .   `/hMMNdhysoo+/:sNMm+`-dMN/   
                       MMs          sMNy/`  `-/osyhdmmNMMm: `oMMy`    
                       MMs           -smMNy/....---:://NMh -mMm:      
                       dMNmmdddhhyo/`   :smMMMMMMMMMMMNms.oMMy`       
                        :+++ooossymMMms:   `--..```     .dMN:         
                                   ./yNMNysoososoosossoyNMh`          
                                       -ohdhddhddhdhddhhs:            
                                                           "
        puts "                                 Lets find you the perfect charity!                                 "                                                  
        answer = prompt.select("Main Menu") do |menu|
            menu.enum "."
            menu.choice "Search for Charities", -> {user.view_charities} #then once in here, be able to filter by cities
            menu.choice "View my Reviews", -> {user.see_my_reviews}
            menu.choice "Write a Review", -> {user.create_review}
            menu.choice "Update a Review", -> {user.update_review}
            menu.choice "Remove a Review", -> {user.delete_review}
            menu.choice "Log out", -> { self.goodbye } #need goodbye method
        end
    end

end











