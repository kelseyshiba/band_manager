class AddForeignKeyToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_reference :invoices, :gig, index: true
  end
end
