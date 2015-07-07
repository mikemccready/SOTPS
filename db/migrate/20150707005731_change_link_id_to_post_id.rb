class ChangeLinkIdToPostId < ActiveRecord::Migration
  def change
  	rename_column :comments, :link_id, :post_id
  end
end
