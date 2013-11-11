class AddCreditCardIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :credit_card_id, :integer
  end
end
