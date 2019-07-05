class TransactionsController < ApplicationController
  def create
    transaction = current_user.account.sent_transactions.new(transaction_params)

    if transaction.save
      receiver_account = User.find(transaction.receiver_id).account
      TransactionService.new(current_user.account, receiver_account, transaction.amount).perform
      redirect_to :authenticated_root, flash: { success: "Successfully transaction" }
    else
      errors = transaction.errors.full_messages.to_sentence
      redirect_to :authenticated_root, flash: { error: errors }
    end
  end

  private
  def transaction_params
    params.require(:transaction).permit(:amount, :receiver_id)
  end
end
