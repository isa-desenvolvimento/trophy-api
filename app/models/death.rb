class Death < ApplicationRecord

    def self.sum_deaths(user_id)
        Death.select("user_id").where("user_id = ?", user_id).count
    end


end
