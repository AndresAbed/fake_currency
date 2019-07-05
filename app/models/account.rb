class Account < ApplicationRecord
  belongs_to :user
  has_many :sent_transactions, class_name: 'Transaction', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_transactions, class_name: 'Transaction', foreign_key: 'receiver_id', dependent: :destroy

  validates :number, presence: true

  def transactions
    (sent_transactions + received_transactions).uniq.sort! { |a,b| b.created_at <=> a.created_at }
  end
end
