class User < ActiveRecord::Base
    belongs_to :review
    has_many :reviews
    has_many :charities, through: :reviews
   
end