class AddCategoryToCheck < ActiveRecord::Migration
  def change
  	add_column :checks, :description, :text
  	add_column :checks, :category_id, :integer
  end
end
