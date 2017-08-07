class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :set_to_standard, :if => :new_record?

  enum role: [:standard, :admin, :premium]

  private
  def set_to_standard
    self.role ||= "standard"
  end
end
