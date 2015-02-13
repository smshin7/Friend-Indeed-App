class RemoveApikeyTable < ActiveRecord::Migration
  def change
    drop_table :apikeys
  end
end
