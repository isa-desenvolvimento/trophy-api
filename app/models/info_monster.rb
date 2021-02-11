class InfoMonster < ApplicationRecord

    def self.get(id)
        if InfoMonster.where("users_id=?", id).count > 0
            @info = InfoMonster.where("users_id=?", id)
            json = JSON.parse(@info.to_json)

            pos = 0
            data = {}

            json.each do |info|
                trophy = Trophy.find(info['trophies_id'])
                monster = Monster.find(info['monsters_id'])

                data[pos] = {
                    "trophy": trophy.name,
                    "monster": monster.name,
                    "sum-monster": info["sum"]
                }
                pos += 1
            end
            return data
        end
        return ""
    end

end
