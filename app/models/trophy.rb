class Trophy < ApplicationRecord

    def self.rank(user_id)
        coins = CollectedCoin.sum_coins(user_id)
        kill = KilledMonster.sum_monsters(user_id)
        deaths = Death.sum_deaths(user_id)

        {
            'sum_coins':coins,
            'sum_kill_by_monster':kill,
            'sum_deaths':deaths,
            'rank_coins': rank_coins(coins),
            'rank_deaths': rank_deaths(deaths),
            'rank_kill_monster_1': rank_monster(kill[1]),
            'rank_kill_monster_2': rank_monster(kill[2])  #ATENÇÃO NESSE TRECHO, POIS O ID ESTÁ FIXO, CONSIDERANDO QUE SÓ HAVERÁ DOIS MONSTROS CADASTRADOS
        }
    end


    def self.rank_monster(deaths)

        #Níveis: 1, 100, 1.000, 10.000, 100.000
        if deaths >= 1 and deaths <= 100
            'Bronze'
        elsif deaths >= 101 and deaths <= 1000
            'Silver'
        elsif deaths >= 1001 and deaths <= 10000
            'Gold'
        elsif deaths >= 10001 and deaths <= 100000
            'Platinum'
        else deaths > 100000
            'Daimond'
        end
    end



    def self.rank_deaths(deaths)

        #Níveis: 1 morte, 10, 25, 50 e 100 mortes
        if deaths >= 1 and deaths <= 10
            'Daimond'
        elsif deaths >= 11 and deaths <= 25
            'Platinum'
        elsif deaths >= 26 and deaths <= 50
            'Gold'
        elsif deaths >= 51 and deaths <= 100
            'Silver'
        else deaths > 101
            'Bronze'
        end
    end


    def self.rank_coins(coins)

        #Níveis: 1 moeda, 100, 1.000, 10.000 e 100.000 moedas
        if coins >= 1 and coins <= 100
            'Bronze'
        elsif coins >= 101 and coins <= 1000
            'Silver'
        elsif coins >= 1001 and coins <= 10000
            'Gold'
        elsif coins >= 10001 and coins <= 100000
            'Platinum'
        else coins > 100000
            'Daimond'
        end
    end
end
