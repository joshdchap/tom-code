class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.float :amount
      t.text :address

      t.references :customer
      t.references :agent

      t.timestamps
    end
  end
end
