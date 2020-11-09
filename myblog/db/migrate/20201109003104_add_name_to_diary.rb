class AddNameToDiary < ActiveRecord::Migration[6.0]
  def change
    add_column :diaries, :name, :string
  end
end
