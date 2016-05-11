class CreateNights < ActiveRecord::Migration
  def change
    create_table :nights do |t|
      t.integer :count
      t.string :status

      t.timestamps null: false
    end
  end
end
