# pins

## develop

### requirements
* ruby 2.0 (or later)
* bundler
* node.js
* npm
* MySQL (or MariaDB)
* git

### setup

bundle

```
% bundle install --path vendor/bundle
```

database (for development)

```
mysql -u root -p -e "CREATE DATABASE pins_development;"
mysql -u root -p -e "CREATE USER 'hoge'@'localhost' IDENTIFIED by 'hoge';"
mysql -u root -p -e "GRANT ALL ON pins_development.* TO 'hoge'@'localhost';"
```

migrate

```
% bundle exec rake db:migrate
% bundle exec rake db:test:clone
```

bower

```
% bundle exec rake bower:install
```

### gem

### front-end

- [typescript-rails](https://github.com/typescript-ruby/typescript-rails)
- [slim-rails](https://github.com/slim-template/slim-rails)
- [bower-rails](https://github.com/42dev/bower-rails)

### form helper

- [simple_form](https://github.com/plataformatec/simple_form)
- [enum_help](https://github.com/zmbacker/enum_help)

### auth

- [devise](https://github.com/plataformatec/devise)
- [cancancan](https://github.com/CanCanCommunity/cancancan)

### image uploader

- [carrierwave](https://github.com/carrierwaveuploader/carrierwave)
- [mini_magick](https://github.com/minimagick/minimagick)

### test

- [rspec-rails](https://github.com/rspec/rspec-rails)
- [factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails)
- [faker](https://github.com/stympy/faker)
- [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)

### error

- [better_errors](https://github.com/charliesome/better_errors)

### debug

- [pry-byebug](https://github.com/deivid-rodriguez/pry-byebug)


&copy; funnythingz
