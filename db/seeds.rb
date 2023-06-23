# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# first_user = User.create(name: 'Mancoba', photo: 'https://avatars.githubusercontent.com/u/53082877?s=96&v=4', bio: 'Teacher from Mexico.')
# second_user = User.create(name: 'Clement', photo: 'https://avatars.githubusercontent.com/u/53082877?s=96&v=4', bio: 'Teacher from Poland.')
# third_user = User.create(name: 'John', photo: 'https://avatars.githubusercontent.com/u/53082877?s=96&v=4', bio: 'Teacher from USA.')

# first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
# second_post = Post.create(author: first_user, title: 'Software', text: 'This is my second post')
# third_post = Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
# fourth_post = Post.create(author: first_user, title: 'Hello', text: 'This is my fourth post')
# fifth_post = Post.create(author: first_user, title: 'Hello', text: 'This is my fifth post')

# Comment.create(post: first_post, author: first_user, text: 'Hi Tom!' )
# Comment.create(post: first_post, author: first_user, text: 'Great work!' )
# Comment.create(post: first_post, author: first_user, text: 'I like the code!' )
# Comment.create(post: first_post, author: first_user, text: 'Good review!' )
# Comment.create(post: first_post, author: first_user, text: 'Wonderful news!' )
# Comment.create(post: first_post, author: first_user, text: 'Well Done!' )
# Comment.create(post: first_post, author: first_user, text: 'Awesome!' )

Like.destroy_all
Comment.destroy_all
Post.destroy_all

# User seeder
user_1 = User.first
user_2 = User.second

p "Created #{User.count} Users"

# Post seeder
post_1 = Post.create(author: user_1, title: 'Post 1', text: 'One Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod.')
post_2 = Post.create(author: user_2, title: 'Post 2', text: 'Two Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod.')
post_3 = Post.create(author: user_1, title: 'Post 3', text: 'Three Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod.')
post_4 = Post.create(author: user_2, title: 'Post 4', text: 'Four Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod.')

p "Created #{Post.count} Posts"

# Comment seeder
Comment.create([
{ post: post_1, author: user_1, text: 'User 1 comment in post 1' },
{ post: post_2, author: user_2, text: 'User 2 comment in post 2' },
{ post: post_3, author: user_1, text: 'User 1 comment in post 3' },
{ post: post_4, author: user_2, text: 'User 2 comment in post 4' },
{ post: post_1, author: user_1, text: 'User 1 comment in post 1' },
{ post: post_2, author: user_2, text: 'User 2 comment in post 2' }
])

p "Created #{Comment.count} Comments"

# Like seeder
Like.create([
{ post: post_1, author: user_1 },
{ post: post_2, author: user_2 },
{ post: post_3, author: user_1 },
{ post: post_4, author: user_2 }
])

p "Created #{Like.count} Likes" 