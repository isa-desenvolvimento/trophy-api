class CollectedCoin < ApplicationRecord

    # soma de moedas de um usuário
    def self.sum_coins(user_id)
        CollectedCoin.select("value_coin").where("user_id = ?", user_id).sum("value_coin")
    end

end
