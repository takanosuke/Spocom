5.times do |n|
  Team.create(sport: 'soccer', name: "サンプルチーム#{n}")
end

user = User.new(email:'admin@123', password:'admin123', provider:'develop', uid:'12345', subscription_expiration:Time.zone.now+1.year, team_id:1, position:100, first_name:'亜土民', last_name:'管理', kana_first_name:'アドミン', kana_last_name:'カイハツ', agreement:true)
user.save!
user = User.new(email:'dev@123', password:'dev123', provider:'develop', uid:'12345', subscription_expiration:Time.zone.now+1.year, team_id:1, position:2, first_name:'次郎', last_name:'田中', kana_first_name:'ジロウ', kana_last_name:'タナカ', agreement:true)
user.save!
user = User.new(email:'dev@456', password:'dev123', provider:'develop', uid:'12345', subscription_expiration:Time.zone.now+1.year, team_id:1, position:2, first_name:'三郎', last_name:'山下', kana_first_name:'サブロウ', kana_last_name:'ヤマシタ', agreement:true)
user.save!

5.times do |n|
  user = User.new(email: "dev@#{n}", password:'dev123', provider:'develop', uid:"#{n}", subscription_expiration:Time.zone.now+1.year, team_id:1, position:1, first_name:"太郎#{n}", last_name:"開発#{n}", kana_first_name:"タロウ#{n}", kana_last_name:"カイハツ#{n}", agreement:true)
  user.save!
end
