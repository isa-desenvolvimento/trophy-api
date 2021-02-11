class InfoDeath < ApplicationRecord

    def self.get(id)
        if InfoDeath.where("id=?", id).count > 0
            @info = InfoDeath.find(id)

            return {
                "sum-death": @info.sum,
                "trophy-death": TrophyDeath.get_name(@info.trophy_deaths_id)
            }
        end
        return ""
    end

end
