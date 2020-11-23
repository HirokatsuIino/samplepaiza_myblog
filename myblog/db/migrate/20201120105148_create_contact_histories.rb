class CreateContactHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :contact_histories do |t|
      t.integer :document_request_id
      t.string :name
      t.string :name_hira
      t.string :email
      t.string :tel
      t.datetime :supported_at
      t.string :comment
      t.boolean :support_required_flg

      t.timestamps
    end
  end
end
