class CreateClientUnitPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :client_unit_prices do |t|
      t.integer :client_id
      t.integer :unit_price_id
      t.date :begin_at

      t.timestamps
    end
  end
end
