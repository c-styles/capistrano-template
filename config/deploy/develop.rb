# develop                                                                                                                                                                                                          #
role :web, *%w[
  ENV['HOSTNAME']
]
role :db, *%w[
  ENV['HOSTNAME']
]

set :user, ENV['CAP_DEPLOY_USER']
set(:password) do
  Capistrano::CLI.password_prompt "Set password for develop server: "
end
