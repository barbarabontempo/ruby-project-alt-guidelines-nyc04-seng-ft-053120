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


    def self.display_reviews_by_charity(charity)
        charity_reviews_arr = Review.all.select { |rev| rev.charity_id == charity.id }
        values_to_print = charity_reviews_arr.map do |rev| 
            [rev.rating, rev.heading, rev.body, rev.user.name]
        end
           self.all_reviews_display_table(values_to_print)
    end

    def self.all_reviews_display_table(array_to_print)
        list_num = 1
        array_to_print.each do |list|
             list.unshift(list_num)
             list_num += 1
        end
        reviews_table = TTY::Table.new ['No.', 'Rating', 'Title', 'Review', 'Written by'], array_to_print
        puts reviews_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1] )
        #binding.pry
    end


    def self.user_reviews_display_table(array_to_print)
        list_num = 1
        array_to_print.each do |list|
             list.unshift(list_num)
             list_num += 1
        end
        reviews_table = TTY::Table.new ['No.', 'Charity Name', 'Rating', 'Title', 'Review'], array_to_print
        puts reviews_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1] )
        #binding.pry
    end

    def self.charities_display_table(array_to_print)
        (array_to_print)
        list_num = 1
        array_to_print.each do |list|
             list.unshift(list_num)
             list_num += 1
        end
        reviews_table = TTY::Table.new ['No.', 'Charity Name', 'Rating', 'City'], array_to_print
        puts reviews_table.render(:unicode, alignments: [:center, :center], padding: [1,1,0,1] )
        #binding.pry
    end

    
    def self.delete_review(review)
        review.destroy
    end




end