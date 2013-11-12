class CreateHascreditcards < ActiveRecord::Migration
  def change
    create_table(:hascreditcards, :id => false) do |t|
      t.references :user
      t.references :credit_card

      t.timestamps
    end
  end
end
