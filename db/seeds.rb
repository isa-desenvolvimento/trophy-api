# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Abacaxi', email: 'abacaxi@abacaxi.com.br', password: 'relogio123')
User.create(name: 'Laranja', email: 'laranja@laranja.com.br', password: 'relogio123')
User.create(name: 'Abacate', email: 'abacate@abacate.com.br', password: 'relogio123')

Monster.create(name: 'turtle')
Monster.create(name: 'bowser')

Trophy.create(name: 'Diamond', punctuation: 100000)
Trophy.create(name: 'Platinum', punctuation: 10000)
Trophy.create(name: 'Gold', punctuation: 1000)
Trophy.create(name: 'Silver', punctuation: 100)
Trophy.create(name: 'Bronze', punctuation: 1)

TrophyDeath.create(name: 'Diamond', punctuation: 1)
TrophyDeath.create(name: 'Platinum', punctuation: 100)
TrophyDeath.create(name: 'Gold', punctuation: 1000)
TrophyDeath.create(name: 'Silver', punctuation: 10000)
TrophyDeath.create(name: 'Bronze', punctuation: 100000)

CollectedCoin.create(value_coin: 2, user_id:1)
CollectedCoin.create(value_coin: 5, user_id:1)
CollectedCoin.create(value_coin: 8, user_id:2)
CollectedCoin.create(value_coin: 2, user_id:2)

KilledMonster.create(user_id: 1, monster_id:1)
KilledMonster.create(user_id: 1, monster_id:1)
KilledMonster.create(user_id: 1, monster_id:2)
KilledMonster.create(user_id: 2, monster_id:2)

Death.create(user_id:1, time_reg:'2021-02-03 04:13:03')
Death.create(user_id:1, time_reg:'2021-02-02 05:33:03')
Death.create(user_id:2, time_reg:'2021-02-06 04:13:03')
Death.create(user_id:2, time_reg:'2021-02-07 04:13:03')
Death.create(user_id:2, time_reg:'2021-02-07 04:13:03')
Death.create(user_id:2, time_reg:'2021-02-07 04:13:03')
Death.create(user_id:2, time_reg:'2021-02-08 12:13:03')
Death.create(user_id:2, time_reg:'2021-02-08 04:13:03')
Death.create(user_id:2, time_reg:'2021-02-09 04:13:03')
Death.create(user_id:2, time_reg:'2021-02-09 10:13:03')
Death.create(user_id:2, time_reg:'2021-02-09 13:13:03')
Death.create(user_id:2, time_reg:'2021-02-09 14:13:03')

RankMonster.create(monster_id:1, user_infos_id: 1, rank_kill_monster: 'Bronze')
RankMonster.create(monster_id:2, user_infos_id: 1, rank_kill_monster: 'Bronze')

UserInfo.create(sum_coins:7, sum_deaths: 2, rank_coins: 'Bronze', rank_deaths: 'Diamond')
UserInfo.create(sum_coins:10, sum_deaths: 10, rank_coins: 'Bronze', rank_deaths: 'Diamond')

RankMonster.create(user_infos: 1, monster_id: 1, sum_kill: 2, rank_monster: 'Bronze')
RankMonster.create(user_infos: 1, monster_id: 2, sum_kill: 1 rank_monster: 'Bronze')
RankMonster.create(user_infos: 2, monster_id: 2, sum_kill: 1, rank_monster: 'Bronze')