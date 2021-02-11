class Death < ApplicationRecord

    def save_info_death(user_id, time_reg)        
        @user = User.find(user_id)
        if InfoDeath.where("id=?", @user.info_deaths_id).count == 0
            @infoDeath = InfoDeath.new(sum: 1, trophies_deaths_id: 1)
            if @infoDeath.save
                @user.info_deaths_id = @infoDeath.id            
                @trophy_death = TrophyDeath.where("punctuation <= ?", @infoDeath.sum).limit(1)
                @infoDeath.trophies_deaths_id = @trophy_death.id
                return @infoDeath.save && @user.save
            end            
        else
            @infoDeath = InfoDeath.find(@user.info_deaths_id)
            @infoDeath.sum += 1
            @trophy_death = TrophyDeath.where("punctuation <= ?", @infoDeath.sum).limit(1)
            @infoDeath.trophies_id = @trophy_death.id
            return @infoDeath.save
        end
        return false
    end

end
