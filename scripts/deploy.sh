gem install --user travis
travis env set HEROKU_API_KEY 63d7fc3b-4bc5-4ee9-bf3a-d2d6dee988b6 --private -r mformihir/agile-sands-95544
git remote add heroku git@heroku.com:agile-sands-95544.git
mvn clean heroku:deploy-war
