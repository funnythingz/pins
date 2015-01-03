# pins

## for developer

### requirements
* rails ~> 4.2.0
* ruby 2.1 (or later)
* rake ~> 10.4.2
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
% mysql -u root -p -e "CREATE USER 'username'@'localhost' IDENTIFIED by 'password';"
% mysql -u root -p -e "GRANT ALL ON pins_development.* TO 'username'@'localhost';"
```

migrate

```
% rake db:migrate
% rake db:test:clone
```

&copy; funnythingz
