class RemoveCreditCardIdFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :credit_card_id
  end

  def down
    add_column :users, :credit_card_id, :integer
  end
end
