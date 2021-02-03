class User < ApplicationRecord

    def self.sum_coins(user_id)
        CollectedCoin.sum_coins(user_id)
        #User.where("id = ?", user_id)
    end
end
