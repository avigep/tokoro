# [Tokoro]('https://japanesetactics.com/what-does-tokoro-mean-in-japanese-here-is-the-answer') is a collection of places!

## Heroku deploy
- https://polar-depths-22464.herokuapp.com
  
  Usernames: test001@test.com / test002@test.com  / test003@test.com 
  
  Password: test009
## Showcase
#### Login Page
<img src="public/showcase/1.png" alt="drawing" width="450"/>

#### Browse Users
<img src="public/showcase/4.png" alt="drawing" width="450"/>

#### Browse Users (Pagination)
<img src="public/showcase/5.png" alt="drawing" width="450"/>


#### Browse Places (Public)
<img src="public/showcase/6.png" alt="drawing" width="450"/>

#### Browse Places (With Marker info)
<img src="public/showcase/7.png" alt="drawing" width="450"/>

#### Browse own places
<img src="public/showcase/8.png" alt="drawing" width="450"/>

#### Browse places shared with me
<img src="public/showcase/9.png" alt="drawing" width="450"/>

#### Add a new place
<img src="public/showcase/10.png" alt="drawing" width="450"/>


# Local Setup

## Dependencies
- ruby 2.7.2p137
- Rails 6.1.1
- PG

## Seed entries
`bundle exec rails db:seed`

User 1
- email:test001@test.com pass:test009
- All public places

User 2 
- email:test002@test.com pass:test009
- Mix of public and private places

User 3
- email:test003@test.com pass:test009
- All private places

## Test
`bundle exec rspec`

Current code coverage 
<img src="public/showcase/test-coverage.png" alt="drawing" width="450"/>