class Review < ActiveRecord::Base
    belongs_to :user
    belongs_to :charity
    
    def see_reviews
        self.reviews
    end

    def self.see_reviews_of_charity(charity_name)
        self.reviews.map { |review| review.name == charity_name }
    end

    def self.see_all_reviews_of_charity(charity_name)
        Charity.all.map { |charity| charity.name == charity_name }
    end

    def self.create_review(heading: , body: , rating: , user:, charity:)
        review = Review.new(heading: heading, body: body, rating: rating, user_id: user.id, charity_id: charity.id)
    end
end