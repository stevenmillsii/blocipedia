class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :wikis
  has_many :collaborators, dependent: :destroy
  has_many :collaborator_wikis, through: :collaborators, :source => :wiki
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :set_to_standard, :if => :new_record?

  enum role: [:standard, :admin, :premium]

  def collaborator_for(wiki)
    collaborators.where(wiki_id: wiki.id).first
  end

  private
  def set_to_standard
    self.role ||= "standard"
  end
end
