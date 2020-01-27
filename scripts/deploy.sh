gem install --user travis
travis login --pro
travis encrypt --pro HEROKU_API_KEY=63d7fc3b-4bc5-4ee9-bf3a-d2d6dee988b6 -r mformihir/agile-sands-95544
git remote add heroku git@heroku.com:agile-sands-95544.git
mvn clean heroku:deploy-war
