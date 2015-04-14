class AddItemToBids < ActiveRecord::Migration
  def change
    add_reference :bids, :item, index: true, foreign_key: true
  end
end
