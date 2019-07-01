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