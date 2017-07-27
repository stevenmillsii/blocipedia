class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :set_to_standard

  enum role: [:standard, :admin, :premium]

  private
  def set_to_standard
    self.role = "standard"
  end
end
