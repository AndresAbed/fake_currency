class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.integer :number, limit: 5
      t.decimal :balance, default: 0
      t.references :user

      t.timestamps
    end
  end
end
