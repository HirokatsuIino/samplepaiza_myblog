class CreatePublishingFees < ActiveRecord::Migration[6.0]
  def change
    create_table :publishing_fees do |t|
      t.integer :client_id
      t.string :value

      t.timestamps
    end
  end
end
