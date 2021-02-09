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

end