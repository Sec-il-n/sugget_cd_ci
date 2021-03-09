server '35.72.239.105', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '~/.ssh/suggest_cd_ci-key.pem'
# set :ssh_options, keys: '/Users/secil/.ssh/id_rsa'
