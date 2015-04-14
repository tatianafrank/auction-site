class Bid < ActiveRecord::Base
belongs_to :item
belongs_to :user

 validates :user_id, :presence => true

 validate :bid_amount_must_be_greater_than_last_bid
 
  def bid_amount_must_be_greater_than_last_bid
  	puts "#{self.amount} < #{self.item.bids.last.amount} = #{self.amount < self.item.bids.last.amount}"
    if self.amount < self.item.bids.last(2)[0].amount
      errors.add(:amount, "can't be less than current highest bid")
    end
 end
  
end
