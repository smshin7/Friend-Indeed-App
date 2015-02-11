class CreateApikeys < ActiveRecord::Migration
  def change
    create_table :apikeys do |t|
      t.string :token

      t.timestamps null: false
    end
  end
end
