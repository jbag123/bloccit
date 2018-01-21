require 'random_data'

# Create Posts
50.times do
# #1
  Post.create!(
# #2
        title:  RandomData.random_sentence,
        body:   RandomData.random_paragraph
  )
end
# Create unique post and check if exists

Post.find_or_create_by!(title: "Unique Title", body: "Unique Body")

posts = Post.all


# Create Comments
# #3
100.times do
  Comment.create!(
# #4
        post: posts.sample,
        body: RandomData.random_paragraph
  )
end

Comment.find_or_create_by!(body: "Unique Comment Title", post: Post.find(51))

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
