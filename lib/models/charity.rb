class Charity < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews
      

    # def self.see_charities_by_city
    #     Charity.all.select { |charity_instance| charity_instance.city}
    # end

    def self.find_by_city(city_name)
        Charity.find_by(name: city_name)
    end
end


  
