class CreateDeeds < ActiveRecord::Migration
  def change
    create_table :deeds do |t|
      t.string :body
      t.integer :from_id
      t.string :to_id

      t.timestamps null: false
    end
  end
end
