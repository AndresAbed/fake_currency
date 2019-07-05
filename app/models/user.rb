class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_one :account, dependent: :destroy

  validates :name, presence: true

  after_create :create_account

  def create_account
    self.create_account!(number: rand(1e15).to_i)
  end
end
