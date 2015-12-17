# 向数据库中添加示例用户

User.create!(name: "孙琨",
     email: "sunkun201309@163.com",
     password:  "caiyicai",
     password_confirmation: "caiyicai",
     admin: true)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@163.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end
