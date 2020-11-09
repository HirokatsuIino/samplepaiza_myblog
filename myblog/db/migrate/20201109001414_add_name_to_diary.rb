class AddNameToDiary < ActiveRecord::Migration[6.0]
  def change
    add_column :diaries, :weather, :string
  end
end
