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
        Review.create(heading: heading, body: body, rating: rating, user_id: user.id, charity_id: charity.id)
    end

    #this method displays all the reviews for selected charity
    #creating a table for display
    def self.display_reviews_by_charity(charity)
       charity_reviews = Review.where(charity_id: charity.id)
       charity_reviews.each do |review_instance| 
            puts "Rating: #{review_instance.rating}"
            puts review_instance.heading
            puts review_instance.body 
            puts "Written by: #{review_instance.user.name}"
            puts "----------"
       end
    end


end