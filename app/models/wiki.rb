class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :wikis 
  
  default_scope { order('created_at DESC') }
end
