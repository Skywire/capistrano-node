# Node

- Gem for capistrano to run NPM and gulp
- This is for Magento sites only

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
