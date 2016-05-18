# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Comment.destroy_all
Post.destroy_all
User.destroy_all

100.times do |i|
  user = FactoryGirl.create(:user)  
  100.times do |j|
    post = FactoryGirl.create(:post, user: user)
    FactoryGirl.create(:comment, post: post, user: user)
  end
end
