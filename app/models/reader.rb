class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        Subscription.create(magazine: magazine, price: price, reader: self)
    end

    def total_subscription_price
        subscriptions.sum(:price)

        # subscriptions.pluck(:price).reduce(:+)
    end

    def cancel_subscription(magazine)
        # subscriptions.find_by(magazine: magazine).destroy

        self.magazines.delete(magazine)
    end
end