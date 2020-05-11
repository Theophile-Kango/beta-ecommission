class AddIsAvailableToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :is_available, :boolean, default: true
  end
end
