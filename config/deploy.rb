require "capistrano/ext/multistage"
require "capistrano_colors"
require "railsless-deploy"
require "rubygems"
require 'dotenv'

Dotenv.load

set :application, "cakephp2"
set :scm, :git
set :repository,  "https://github.com/cakephp/cakephp.git"
set :branch, "2.8"
set :deploy_to, "/home/vagrant/cakephp_2"
set :deploy_via, :copy
set :use_sudo, true

role :web, *%w[
  localhost
]
role :db, *%w[
  localhost
]

set :user, "vagrant"
set :password, "vagrant"
