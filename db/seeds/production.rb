Team.create(sport: 'soccer', name: "sample_team")

user = User.new(email:'admin@123', password:'admin123', provider:'develop', uid:'12345', subscription_expiration:Time.zone.now+1.year, team_id:1, position:100, first_name:'亜土民', last_name:'管理', kana_first_name:'アドミン', kana_last_name:'カイハツ', agreement:true)
user.save!
