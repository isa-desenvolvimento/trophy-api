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

Trophy.create(name: 'Gold')
Trophy.create(name: 'Silver')
Trophy.create(name: 'Bronze')
Trophy.create(name: 'Platinum')
Trophy.create(name: 'Diamond')

CollectedCoin.create(value_coin: 2, user_id:1)
CollectedCoin.create(value_coin: 5, user_id:1)
CollectedCoin.create(value_coin: 8, user_id:2)
CollectedCoin.create(value_coin: 2, user_id:2)

KilledMonster.create(user_id: 1, monster_id:1)
KilledMonster.create(user_id: 1, monster_id:1)
KilledMonster.create(user_id: 1, monster_id:2)
KilledMonster.create(user_id: 2, monster_id:2)

Death.create(user_id:1, time_reg:'2021-02-06 04:13:03')
Death.create(user_id:1, time_reg:'2021-02-06 04:13:03')
Death.create(user_id:2, time_reg:'2021-02-06 04:13:03')
Death.create(user_id:2, time_reg:'2021-02-06 04:13:03')