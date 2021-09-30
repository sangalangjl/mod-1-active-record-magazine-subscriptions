class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        # self.readers.map {|reader| print "#{reader.email};"}

        self.readers.pluck(:email).join(";")
    end

    def self.most_popular
        # all.max_by { |reader| reader.subscriptions.count } # max_by = highest number
    
        all.max_by{|subs| subs.subscriptions.size}
    end
end