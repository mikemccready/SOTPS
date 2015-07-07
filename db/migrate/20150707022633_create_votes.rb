class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.boolean :votes
    	t.integer :user_id
    	t.integer :voteable_id
    	t.string :votable_type
    	t.timestamps
    end
  end
end
