class Charity < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reveiws
    
end