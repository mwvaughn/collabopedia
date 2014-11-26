class Wiki < ActiveRecord::Base
  belongs_to :user #:owner, class_name: "User", :foreign_key => "user_id"
  has_many :collaborators
  has_many :users, through: :collaborators, source: :wiki

  default_scope { order('created_at DESC') }
  scope :public_only, -> { where( private: nil ) }
  scope :private_only, -> { where( private: true ) }
  #scope :all_public_my_private, -> {|user| where...}

  def owner
    user
  end



  # def self.private_only
  #   if user.admin?
  #     scope.all
  #   else
  #     scope.where(:private => true)
  #   end
  # end

end   
