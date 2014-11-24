class Wiki < ActiveRecord::Base
  belongs_to :user #:owner, class_name: "User", :foreign_key => "user_id"
  has_many :collaborators
  has_many :users, through: :collaborators, source: :wiki

  default_scope { order('created_at DESC') }

  def owner
    user
  end
  def private
      if user.premium? || user.admin?
        scope.all
      else
        scope.where(:private => true)
      end
    end
  end   
