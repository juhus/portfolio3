class Portfolio < ActiveRecord::Base
  attr_accessible :content, :permalink, :publish, :title, :website_id, :image, :remote_image_url
  belongs_to :website
  mount_uploader :image, ImageUploader
  validates :website_id, presence:true
end
