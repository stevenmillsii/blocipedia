class Wiki < ActiveRecord::Base
  belongs_to :user
  scope :visible_to, -> (user) { (user && (user.premium? || user.admin?)) ? all : where(:private => [true]) }
end
