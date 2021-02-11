class TrophyDeath < ApplicationRecord
    
    def self.get_name(id)
        if TrophyDeath.where("id=?", id).count > 0
            return TrophyDeath.find(id).name
        end
        return ""
    end

end
