class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.integer :client_id
      t.string :name
      t.string :admin_comment
      t.string :area_important
      t.integer :nav_id

      t.timestamps
    end
  end
end
