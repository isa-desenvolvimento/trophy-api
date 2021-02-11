class KilledMonster < ApplicationRecord

    
    def save_info_monster(user_id, monster_id)
        @user = User.find(user_id)
        if InfoMonster.where("id=?", @user.info_monsters_id).count == 0
            @infoMonster = InfoMonster.new(sum: 1, trophies_id: 1, monster_id: monster_id)
            if @infoMonster.save
                @user.info_monsters_id = @infoMonster.id            
                @trophy_monster = Trophy.where("punctuation <= ?", @infoMonster.sum).limit(1)
                @infoMonster.trophies_monsters_id = @trophy_monster.id
                return @infoMonster.save && @user.save
            end
        else
            @infoMonster = InfoMonster.find(@user.info_monsters_id)
            @infoMonster.sum += 1
            @trophy_monster = Trophy.where("punctuation <= ?", @infoMonster.sum).limit(1)
            @infoMonster.trophies_id = @trophy_monster.id
            @infoMonster.monster_id = monster_id;
            return @infoMonster.save
        end
        return false
    end

end
