class CreateLineItems < ActiveRecord::Migration
  def change
    create_table(:line_items, :id => false) do |t|
      t.references :user
      t.references :course

      t.timestamps
    end
  end
end
