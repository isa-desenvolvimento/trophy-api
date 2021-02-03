class KilledMonster < ApplicationRecord

    # soma de mortes de cada monstro por um usuário
    def self.sum_monsters(user_id)
        KilledMonster.select("monster_id").group("monster_id").where("user_id = ?", user_id).count
    end
    
end
