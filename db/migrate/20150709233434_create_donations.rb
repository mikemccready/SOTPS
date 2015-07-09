class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.string :amount
      t.integer :post_id
      t.integer :poster_id

      t.timestamps null: false
    end
  end
end
