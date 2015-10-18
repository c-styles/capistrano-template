# develop                                                                                                                                                                                                          #
role :web, *%w[
  localhost
]
role :db, *%w[
  localhost
]

set :user, "deploy"
set(:password) do
  Capistrano::CLI.password_prompt "Set password for develop server: "
end
