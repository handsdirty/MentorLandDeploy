class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.string :last_name
      t.string :first_name
      t.string :number
      t.string :month
      t.string :year
      t.string :verification_value
      t.string :billing_address
      t.string :card_type

      t.timestamps
    end
  end
end
