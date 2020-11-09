class AddNameToArticleFeeling < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :feeling, :string
  end
end
