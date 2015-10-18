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
after "change_permission"

desc "アプリケーションの動作に必要なパーミッションの設定をします"
task :change_permission, roles => :web do
  run <<-CMD
    chmod -R #{deploy_to}/current/app/tmp
  CMD
end

role :web, *%w[
  localhost
]
role :db, *%w[
  localhost
]

set :user, "vagrant"
set(:password) do
  Capistrano::CLI.password_prompt "Set password for develop server: "
end
