class CreatePublishingTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :publishing_terms do |t|
      t.integer :client_publishing_setting_id
      t.datetime :begin_at
      t.datetime :end_at
      t.boolean :flg

      t.timestamps
    end
  end
end
