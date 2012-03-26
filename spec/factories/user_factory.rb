Factory.define :user do |u|
  u.email "user_#{rand(1000).to_s}@factory.com"
  u.password "password"
end