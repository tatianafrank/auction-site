class RemoveBidFromItem < ActiveRecord::Migration
  def change
  	remove_column :items, :bid, :integer
  end
end
