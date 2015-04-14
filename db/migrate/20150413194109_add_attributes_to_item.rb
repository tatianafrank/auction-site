class AddAttributesToItem < ActiveRecord::Migration
  def change
  	add_column(:items, :name, :string)
  	add_column(:items, :description, :text)
  	add_column(:items, :starting_price, :integer)
  	add_column(:items, :latest_price, :integer)
  	add_column(:items, :expiration, :datetime)
  	add_column(:items, :bid, :integer)
  	
  end
end
