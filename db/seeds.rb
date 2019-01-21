# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do |n|
  Team.create(sport: 'soccer', name: "サンプルチーム#{n}")
end

user = User.new(email:'dev@123', password:'dev123', provider:'develop', uid:'12345', subscription_expiration:Time.zone.now+1.year, team_id:1, position:2, first_name:'太郎', last_name:'開発', kana_first_name:'タロウ', kana_last_name:'カイハツ', display_name:'デベロプ', agreement:true)
user.save!

10.times do |n|
  user = User.new(email: "dev@#{n}", password:'dev123', provider:'develop', uid:"#{n}", subscription_expiration:Time.zone.now+1.year, team_id:1, position:1, first_name:"太郎#{n}", last_name:"開発#{n}", kana_first_name:"タロウ#{n}", kana_last_name:"カイハツ#{n}", display_name:"デベロプ#{n}", agreement:true)
  user.save!
end
