class Website < ActiveRecord::Base
  attr_accessible :description, :domain, :title, :user_id
  belongs_to :user
  has_many :codes, dependent: :destroy
  has_many :portfolios, dependent: :destroy
  validates :user_id, presence:true
	
  def to_param
	title.parameterize
  end
end
