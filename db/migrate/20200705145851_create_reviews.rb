class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :heading
      t.string :body
      t.float :rating
      t.integer :user_id
      t.integer :charity_id
    end
  end
end
