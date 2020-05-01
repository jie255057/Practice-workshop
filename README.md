# README

## Requirements

- Ruby 2.7.0
- Rails 6

## 部署步驟

1. heroku login 登入Heroku
2. heroku create
3. git remote -v 能看到 hook
4. git push heroku master
5. heroku run bundle
6. heroku run rails db:migrate

Heroku <https://practice-workshop.herokuapp.com/>