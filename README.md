# Ideas Board API

Assumes:
- Ruby/rubygems installed and in PATH ('ruby -v' to check ruby, 'gem -v' to check rubygems)
- Bundler gem installed ('which bundler' to check, 'gem install bundler' to install)

To install/run:

1. Navigate to ideas-board-api folder
> cd ./ideas-board-api

2. Install padrino and required dependencies
> bundle install

3. Create and migrate the database
> padrino rake ar:create && padrino rake ar:migrate

4. Start padrino server (choose a different port if 4000 in use, add -h X.X.X.X for a different IP)
> padrino start -p 4000

5. Update API_URL variable in ideas-board-app to 'http://localhost:4000'

