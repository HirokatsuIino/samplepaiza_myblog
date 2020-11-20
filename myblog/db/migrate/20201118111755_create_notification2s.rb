class CreateNotification2s < ActiveRecord::Migration[6.0]
  def change
    create_table :notification2s do |t|
      t.string :title
      t.string :body
      t.date :begin_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
