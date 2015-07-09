class Post < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :category
	has_many :comments
	has_many :votes, as: :voteable
	has_many :donations

	has_attached_file :image, styles: { thumb: "32x32", small: "64x64", med: "100x100", large: "200x200", banner: "1200x300" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	def total_votes
		self.up_votes - self.down_votes
	end
	
	def up_votes
		self.votes.where(vote: true).size
	end	

	def down_votes
		self.votes.where(vote: false).size
	end	

end
