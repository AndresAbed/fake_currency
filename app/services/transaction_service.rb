class TransactionService
  pattr_initialize :sender_account, :receiver_account, :amount

  def perform
    make_transaction
  end

  private

  def make_transaction
    ApplicationRecord.transaction do
      sender_account.update(balance: sender_account.balance - amount)
      receiver_account.update(balance: receiver_account.balance + amount)
    end
  end
end
