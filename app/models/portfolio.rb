class Portfolio < ActiveRecord::Base
  attr_accessible :content, :permalink, :publish, :title, :website_id, :image, :remote_image_url, :thumb, :remote_thumb_url
  belongs_to :website
  mount_uploader :image, ImageUploader
  mount_uploader :thumb, ImageUploader
  validates :website_id, presence:true
  acts_as_list
  def self.publish
  	where(:publish => true)
  end
end
