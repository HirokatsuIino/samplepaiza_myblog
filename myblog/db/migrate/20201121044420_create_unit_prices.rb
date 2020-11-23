class CreateUnitPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :unit_prices do |t|
      t.integer :relation_type_id
      t.integer :value
      t.string :billing_code
      t.string :refund_code
      t.string :billing_invoice_name
      t.string :refund_invoice_name
      t.boolean :campagin_flg

      t.timestamps
    end
  end
end
