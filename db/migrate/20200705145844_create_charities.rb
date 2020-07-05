class CreateCharities < ActiveRecord::Migration[5.2]
  def change
    create_table :charities do |t|
      t.string :name
      t.string :city
      t.string :url
    end
  end
end
