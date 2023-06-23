# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Mudasir', photo: 'https://avatars.githubusercontent.com/u/15003328?v=4', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Clement', photo: 'https://avatars.githubusercontent.com/u/15003328?v=4', bio: 'Teacher from Poland.')
third_user = User.create(name: 'John', photo: 'https://avatars.githubusercontent.com/u/15003328?v=4', bio: 'Teacher from USA.')

first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: first_user, title: 'Software', text: 'This is my second post')
third_post = Post.create(author: first_user, title: 'Hello', text: 'This is my third post')
fourth_post = Post.create(author: first_user, title: 'Hello', text: 'This is my fourth post')
fifth_post = Post.create(author: first_user, title: 'Hello', text: 'This is my fifth post')

Comment.create(post: first_post, author: first_user, text: 'Hi Tom!' )
Comment.create(post: first_post, author: first_user, text: 'Great work!' )
Comment.create(post: first_post, author: first_user, text: 'I like the code!' )
Comment.create(post: first_post, author: first_user, text: 'Good review!' )
Comment.create(post: first_post, author: first_user, text: 'Wonderful news!' )
Comment.create(post: first_post, author: first_user, text: 'Well Done!' )
Comment.create(post: first_post, author: first_user, text: 'Awesome!' )