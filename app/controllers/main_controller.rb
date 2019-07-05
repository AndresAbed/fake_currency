class MainController < ApplicationController
  def index
    @transaction = Transaction.new
    @accounts = Account.where.not(user_id: current_user.id)
  end
end
