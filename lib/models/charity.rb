class Charity < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
      

    # def self.see_charities_by_city
    #     Charity.all.select { |charity_instance| charity_instance.city}
    # end

#in the charity class, havea method that finds teh charity by city 
#
end


  
