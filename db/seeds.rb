# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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


InfoCoin.create(trophies_id: 5, sum: 7)
InfoCoin.create(trophies_id: 5, sum: 10)

InfoDeath.create(trophy_deaths_id: 1, sum: 2)
InfoDeath.create(trophy_deaths_id: 1, sum: 10)


User.create(name: 'Abacaxi', email: 'abacaxi@abacaxi.com.br', password: 'relogio123', info_coins_id: 1, info_deaths_id: 1)
User.create(name: 'Laranja', email: 'laranja@laranja.com.br', password: 'relogio123', info_coins_id: 2, info_deaths_id: 2)
User.create(name: 'Abacate', email: 'abacate@abacate.com.br', password: 'relogio123', info_coins_id: 3, info_deaths_id: 2)

InfoMonster.create(users_id: 1, monsters_id:1, trophies_id: 5, sum: 2)
InfoMonster.create(users_id: 1, monsters_id:2, trophies_id: 5, sum: 1)
InfoMonster.create(users_id: 2, monsters_id:2, trophies_id: 5, sum: 1)

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

