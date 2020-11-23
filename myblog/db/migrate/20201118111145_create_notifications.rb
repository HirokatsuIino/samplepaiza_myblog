class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :body
      t.date :begin_at
      t.date :end_at

      t.timestamps
    end
  end
end
