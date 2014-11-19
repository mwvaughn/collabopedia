class Wiki < ActiveRecord::Base
  belongs_to :owner, class_name: "User", :foreign_key => "user_id"
  has_many :collaborators
  has_many :users, through: :collaborators
  
  default_scope { order('created_at DESC') }
end
