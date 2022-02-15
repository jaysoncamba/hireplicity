# README
To run this properly

1.) clone the repo
2.) go to the directory
3.) docker-compose up --build
4.) attach to the web container
  docker ps
  docker exec -it contianer_name_here bash
5.) run this commands:
  1. rake db:create
  2. rake db:migrate
  3. rake db:seed
6.) Navigate to localhost:3000
7.) login using the credentials form the seeds.rb

Notes:
1. signout links is not working
2. It doesn't have tests.
* ...
