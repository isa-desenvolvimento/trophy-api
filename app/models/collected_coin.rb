class CollectedCoin < ApplicationRecord

    #salva os dados na tabela de informações
    def save_info_coins(user_id, value_coin)        
        @user = User.find(user_id)
        if InfoCoin.where("id=?", @user.info_coins_id).count == 0
            @infoCoins = InfoCoin.new(sum: value_coin, trophies_id: 1)
            if @infoCoins.save
                @user.info_coins_id = @infoCoins.id            
                @trophy = Trophy.where("punctuation <= ?", @infoCoins.sum).limit(1)
                @infoCoins.trophies_id = @trophy.id
                return @infoCoins.save && @user.save
            end            
        else
            @infoCoins = InfoCoin.find(@user.info_coins_id)
            @infoCoins.sum += value_coin
            @trophy = Trophy.where("punctuation <= ?", @infoCoins.sum).limit(1)
            @infoCoins.trophies_id = @trophy.id
            return @infoCoins.save
        end
        return false
    end

end
