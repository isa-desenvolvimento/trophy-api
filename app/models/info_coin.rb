class InfoCoin < ApplicationRecord

    def self.get(id)
        if InfoCoin.where("id=?", id).count > 0
            @info = InfoCoin.find(id);

            return {
                "sum-coins": @info.sum,
                "trophy-coins": Trophy.get_name(@info.trophies_id)
            }
        end
        return ""
    end
end
