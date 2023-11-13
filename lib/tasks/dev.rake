desc "Fill the database tables with some sample data"
task( :sample_data => :environment) do
  p "Creating sample data"

  if Rails.env.development?
    FollowRequest.destroy_all
    Comment.destroy_all
    Like.destroy_all
    Photo.destroy_all
    User.destroy_all
  end

  12.times do

    User.create(
      email: "#{Faker::Name.first_name.downcase}@example.com",
      password: "password",
      username: Faker::JapaneseMedia::OnePiece.character ,
      private: [true, false].sample,
    )
  end


  usernames = Array.new { Faker::Name.first_name }

  usernames << "alice"
  usernames << "bob"

  usernames.each do |username|
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
      private: [true, false].sample,
    )
  end
  

  p "#{User.count} users have been created"
  
  users = User.all
  users.each do |user|
    rand(1...10).times do 
      user.sent_follow_requests.create(
      recipient: users[(rand(0...users.length))],
      status: FollowRequest.statuses.values.sample
      )
    end

  end
  p "#{FollowRequest.count} follow requests have been created"

  users.each do |user|
    rand(15).times do
      photo = user.own_photos.create(
        caption: Faker::JapaneseMedia::OnePiece.quote,
        image: Faker::LoremFlickr.image(size: "500x600", search_terms: ['island', 'pirate', 'ship'])
      )

      user.followers.each do |follower|
        if rand < 0.5
          photo.fans << follower
        end

        if rand < 0.25
          photo.comments.create(
            body: Faker::Games::HeroesOfTheStorm.quote,
            author: follower
          )
        end
      end
    end
  end
  p "There are now #{User.count} users."
  p "There are now #{FollowRequest.count} follow requests."
  p "There are now #{Photo.count} photos."
  p "There are now #{Like.count} likes."
  p "There are now #{Comment.count} comments."
 
end
