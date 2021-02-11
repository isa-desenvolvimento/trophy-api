class User < ApplicationRecord

  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :registerable,
  :database_authenticatable,
  :jwt_authenticatable,
  jwt_revocation_strategy: self

  def self.sum_coins(user_id)
    CollectedCoin.sum_coins(user_id)
  end

  def self.exists(user_id)
    count = User.where("id=?", user_id).count
    return count > 0
  end


  def self.rank(user_id)

    if self.where("id=?", user_id).count > 0
      @user = self.find(user_id)
      coins = InfoCoin.get(@user.info_coins_id)
      kill = InfoMonster.get(@user.id)
      deaths = InfoDeath.get(@user.info_deaths_id)

      {
          'sum_coins': coins,
          'sum_deaths': deaths,
          'sum_kill': kill
      }
    end
  end

end