class Charity < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
      
    def self.find_by_city(city_name)
        Charity.all.where(city: city_name)
    end

end


  
