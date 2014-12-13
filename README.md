# pins

## for developer

### requirements
* rails ~> 4.2.0.rc1
* ruby 2.1 (or later)
* rake ~> 10.4.0
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
% cp config/database.yml.sample config/database.yml
```

use MySQL

```
% mysql -u root -p -e "CREATE DATABASE pins_development;"
% mysql -u root -p -e "CREATE USER 'hoge'@'localhost' IDENTIFIED by 'hoge';"
% mysql -u root -p -e "GRANT ALL ON pins_development.* TO 'hoge'@'localhost';"
```

migrate

```
% rake db:migrate
% rake db:test:clone
```

bower

```
% rake bower:install
```

### gem

### front-end

- [typescript-rails](https://github.com/typescript-ruby/typescript-rails)
- [slim-rails](https://github.com/slim-template/slim-rails)
- [bower-rails](https://github.com/42dev/bower-rails)

### view helper

- [simple_form](https://github.com/plataformatec/simple_form)
- [enum_help](https://github.com/zmbacker/enum_help)
- [active_link_to](https://github.com/comfy/active_link_to)

### decorate

- [draper](https://github.com/drapergem/draper)

### paginate

- [kaminari](https://github.com/amatsuda/kaminari)

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
