class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :item

  validates :user_id, presence: true
  validates :item_id, presence: true, uniqueness: true
  validates :total, presence: true
  
  def item
    Item.find(item_id)
  end
  
  def user 
    User.find(user_id)
  end
  
  def self.create_order
      counter = 0
    Item.where(paid: false).each do |item|
      if item.expired? && Bid.find_by(item_id: item.id)
        user_id = item.highest_bidder_id
        price = item.highest_bid
        order = Order.create(user_id: user_id, item_id: item.id, total: price)
        BidMailer.winning_email(order.user, order).deliver_now
        counter += 1
      end
    end
    puts "#{Time.now}: #{counter} orders created."
  end
end
