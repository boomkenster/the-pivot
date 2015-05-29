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

  def store_owner_email
    #once an order is created
    #find the item's store id DONE
    #find the store_id's user DONE
    #get the email address of this user
    #
    user = User.find_by(store_id: item.store.id)
    user.email
  end
  
  def self.create_order
      counter = 0
    Item.where(paid: false).each do |item|
      if item.expired? && Bid.find_by(item_id: item.id)
        user_id = item.highest_bidder_id
        price = item.highest_bid
        order = Order.create(user_id: user_id, item_id: item.id, total: price)
        BidMailer.winning_email(order.user, order).deliver_now
        require 'pry';binding.pry
        BidMailer.store_owner_email(order).deliver_now

        counter += 1
        item.update(paid: true)
      end
    end
    puts "#{Time.now}: #{counter} orders created."
  end
end
