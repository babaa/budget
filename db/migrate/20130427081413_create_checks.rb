class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.date :time
      t.float :sum
      t.string :category

      t.timestamps
    end
  end
end
