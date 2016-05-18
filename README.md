# rails-performance-test

## purpose
To test performance tools, this app contains N+1 problems and multi view renders.

## source
```
# models
class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
end

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
end

# controller(1 action)
class RootController < ApplicationController
  def index
    # NOT includes any
    @users = User.all
  end
end

# views
## index.html.slim
ul
- @users.each do |user|
  li = user.name
  == render partial: 'root/posts', locals: { posts: user.posts }

## _posts.html.slim
ul
  - posts.each do |post|
    li = post.title
    == render partial: 'root/comments', locals: { comments: post.comments }

## _comments.html.slim
ul
  - comments.each do |comment|
    li = comment.body
```
