# Node

- Gem for capistrano to run NPM and gulp

## Add to your project:

Add the following to your project Gemfile

~~~
gem 'capistrano-node', :git => 'git@github.com:Skywire/capistrano-node.git', :branch => 'master'
~~~

Then run 

~~~
bundle install
~~~

Add the following to your project Capfile

~~~
require "capistrano/node"
~~~


## Configuration

In your `deploy.rb` add the following configuration

~~~
set :gulp_paths, ["app/design/frontend/skywire/default/"]
set :npm_commands, [{path: "app/design/frontend/skywire/default/", command: "install"},{path: "skywire-patternlab", command: "install"},{path: "skywire-patternlab", command: "run pl:build"}]
~~~

If installing into a non magento build then add the following into the `config.rb`:

~~~
after "deploy:updated", "node:npm:run"
after "deploy:updated", "node:gulp:run"
~~~
