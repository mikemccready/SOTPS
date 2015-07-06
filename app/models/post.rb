class Post < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image, styles: { thumb: "32x32", small: "64x64", med: "100x100", large: "200x200", banner: "1200x300" }
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
