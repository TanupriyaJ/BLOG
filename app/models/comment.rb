class Comment < ApplicationRecord
	 validates :commenter, presence:true,
	 			length: { minimum: 3 }
	 belongs_to :article
end
