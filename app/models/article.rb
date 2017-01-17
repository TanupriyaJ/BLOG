class Article < ApplicationRecord
	validates :title, presence: true,
					  length: { minimum: 5 }
	validates :text, presence: true	  
	has_many :comments, dependent: :destroy
	has_attached_file :image, dependent: :destroy,
  		:path => ":rails_root/public/assets/tmp/:id/:style/:basename.:extension",
  		:url => "/assets/tmp/:id/:style/:basename.:extension"
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/png"]
end
