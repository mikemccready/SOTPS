class RenameVotableInVotesToVoteable < ActiveRecord::Migration
  def change
  	rename_column :votes, :votable_type, :voteable_type
  end
end
