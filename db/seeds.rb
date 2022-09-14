# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

Admin.find_or_create_by(email: 'z@z') do |admin|
  admin.password = 'zzzzzz'
end

users = User.create!(
  [
    {email: 'james@test.com', name: 'James', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_seed_1.jpg"), filename:"user_seed_1.jpg")},
    {email: 'lucas@test.com', name: 'Lucas', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_seed_2.jpg"), filename:"user_seed_2.jpg")},
    {email: 'olivia@test.com', name: 'Olivia', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_seed_3.jpg"), filename:"user_seed_3.jpg")},
    {email: 'emma@test.com', name: 'Emma', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_seed_4.jpg"), filename:"user_seed_4.jpg")},
    {email: 'sophia@test.com', name: 'Sophia', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_seed_5.jpg"), filename:"user_seed_5.jpg")},
    {email: 'noah@test.com', name: 'Noah', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_seed_6.jpg"), filename:"user_seed_6.jpg")},
    {email: 'isabella@test.com', name: 'Isabella', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_seed_7.jpg"), filename:"user_seed_7.jpg")},
    {email: 'charlotte@test.com', name: 'Charlotte', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/user_seed_8.jpg"), filename:"user_seed_8.jpg")},
  ]
)

genres = Genre.create!(
  [
    {name: 'バトル'},
    {name: 'サスペンス'},
    {name: 'スポーツ'},
    {name: '恋愛'},
    {name: 'ファンタジー'},
    {name: 'ホラー'},
    {name: 'ギャグ'},
    {name: 'アンダーグラウンド'},
    {name: 'その他'},
  ]
)

post_image = PostImage.create!(
  [
    {comic_name: '鋼の錬金術師', caption: '錬金術バトルファンタジー', user_id: 5, genre_id: 5, star: '4', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/fantasy_seed.jpg"), filename:"fantasy_seed.jpg")},
    {comic_name: 'カラダ探し', caption: '学園スリルホラー', user_id: 6, genre_id: 6, star: '1', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/horror_seed.jpg"), filename:"horror_seed.jpg")},
    {comic_name: '銀魂', caption: '江戸時代SFコメディ', user_id: 7, genre_id: 7, star: '3', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/gag_seed.jpg"), filename:"gag_seed.jpg")},
    {comic_name: '新宿スワン', caption: '歌舞伎町スカウトサバイバル', user_id: 8, genre_id: 8, star: '2', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/underground_seed.jpg"), filename:"underground_seed.jpg")},
    {comic_name: 'アオハライド', caption: '学園恋愛ストーリー', user_id: 4, genre_id: 4, star: '3', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/love_seed.jpg"), filename:"love_seed.jpg")},
    {comic_name: 'DEATH NOTE', caption: '心理戦スリルサスペンス', user_id: 2, genre_id: 2, star: '4', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/suspense_seed.jpg"), filename:"suspense_seed.jpg")},
    {comic_name: 'SLAM DUNK', caption: 'バスケマンガの金字塔', user_id: 3, genre_id: 3, star: '5', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/sports_seed.jpg"), filename:"sports_seed.jpg")},
    {comic_name: 'ワンピース', caption: '海賊冒険ロマン', user_id: 1, genre_id: 1, star: '5', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/app/assets/images/battle_seed.jpg"), filename:"battle_seed.jpg")},
  ]
)


