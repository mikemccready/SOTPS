class User < ActiveRecord::Base

	has_many :posts
	has_many :comments
	has_many :votes
	has_many :donations

	def self.from_omniauth(auth)
		user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
		user.provider = auth.provider
		user.uid = auth.uid
		user.name = auth.info.name
		user.image_url = auth.info.image
		user.oauth_token = auth.credentials.token
		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    	user.save!
    	user
  	end  

  	def total_user_votes
  		self.posts.map{|a| a.total_votes.to_i}.sum	
  	end

  	def user_funds
		# self.donations.sum(:amount)
		self.posts.map{|a| a.donations.amount.to_i}.sum/100
	end	
    
end
