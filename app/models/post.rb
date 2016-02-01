class Post < ActiveRecord::Base
	if Rails.env.production?
	validates :user_id, presence: true 
	validates :image, presence: true
	
	has_attached_file :image, styles: { medium: "640x >", thumb: "100x100>" },
	:storage => :dropbox,
    :dropbox_credentials => Rails.root.join("config/dropbox.yml")
   

  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  	belongs_to :user 
  	has_many :comments, dependent: :destroy
end
