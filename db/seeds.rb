# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user_1 = User.create!(email: 'test001@test.com', password: 'test009')
user_2 = User.create!(email: 'test002@test.com', password: 'test009')
user_3 = User.create!(email: 'test003@test.com', password: 'test009')

# Places for user_1 , all public
Place.create!(
    lat: 35.6804,
    lng: 139.7690,
    name: 'user_1: Tokyo',
    note: 'Place of work, since 2011'
    user: user_1,
    public: true
)

Place.create!(
    lat: 19.0760,
    lng: 72.8777,
    name: 'user_1: Mumbai',
    note: 'Where I went to college'
    user: user_1,
    public: true
)

Place.create!(
    lat: 21.1458,
    lng: 79.0882,
    name: 'user_1: Nagpur',
    note: 'Birthplace'
    user: user_1,
    public: true
)

Place.create!(
    lat: 18.5204,
    lng: 73.8567,
    name: 'user_1: Pune',
    note: 'Where I did my schooling'
    user: user_1,
    public: true
)

# Places for user_2, mix of public and private
Place.create!(
    lat: 41.3851,
    lng: 2.1734,
    name: 'user_2: Barcelona',
    note: 'Place where I did my training'
    user: user_2,
    public: true
)

Place.create!(
    lat: 51.1657,
    lng: 10.4515,
    name: 'user_2: Germany',
    note: 'Went there in winter!!'
    user: user_2,
    public: true
)

shared_place_1 = Place.create!(
    lat: 46.2276,
    lng: 2.2137,
    name: 'user_2: France',
    note: 'Birthplace'
    user: user_2,
    public: false
)

Share.create!(
    shared_with: user_1,
    shared_by: user_2,
    place: shared_place_1
)

Share.create!(
    shared_with: user_3,
    shared_by: user_2,
    place: shared_place_1
)

shared_place_2 = Place.create(
    lat: 10.8231,
    lng: 106.6297,
    name: 'user_2: ho chi minh city',
    note: 'Holidays'
    user: user_2,
    public: false
)
Share.create!(
    shared_with: user_1,
    shared_by: user_2,
    place: shared_place_2
)

Share.create!(
    shared_with: user_3,
    shared_by: user_2,
    place: shared_place_2
)


# Places for user_3, all private

shared_place_3 = Place.create!(
    lat: 41.3851,
    lng: 2.1734,
    name: 'user_3: Singapore',
    note: 'Private holiday'
    user: user_3,
    public: false
)

shared_place_4 = Place.create!(
    lat: 51.1657,
    lng: 10.4515,
    name: 'user_3: Thiland',
    note: 'Private holiday'
    user: user_3,
    public: false
)

Share.create!(
    shared_with: user_1,
    shared_by: user_3,
    place: shared_place_3
)

Share.create!(
    shared_with: user_2,
    shared_by: user_3,
    place: shared_place_4
)