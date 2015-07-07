class RenameVotesInVotesToVote < ActiveRecord::Migration
  def change
  	rename_column :votes, :votes, :vote
  end
end
