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

user = User.new(email:'dev@123', password:'dev123', password_confirmation:'dev123', provider:'develop', uid:'12345', subscription_expiration:Time.zone.now+1.year, team_id:1, position:'player', first_name:'太郎', last_name:'開発', kana_first_name:'タロウ', kana_last_name:'カイハツ', display_name:'デベロプ', agreement:true)
user.save!