class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.datetime :date
      t.float :amount
      t.text :description
      t.references :user
      t.timestamps
    end
  end
end
