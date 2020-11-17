class CreateClientPublishingSettings < ActiveRecord::Migration[6.0]
  def change
    create_table :client_publishing_settings do |t|
      t.integer :client_id
      t.string :comment

      t.timestamps
    end
  end
end
