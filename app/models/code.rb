class Code < ActiveRecord::Base
  attr_accessible :content, :description, :name, :code_type, :website_id
  belongs_to :website
  validates :website_id, presence:true

  #def to_param
  #	name.parameterize
  #end
end
