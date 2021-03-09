server '35.72.239.105', user: 'app', roles: %w{app db web}
# set :ssh_options, keys: '~/.ssh/suggest_cd_ci-key.pem'
# set :ssh_options, auth_methods: ['publickey'],
                  # keys: '~/.ssh/cd_ci_rsa'# loca-aws ssh
set :ssh_options, {
  keys: [ENV.fetch('PRODUCTION_SSH_KEY').to_s],
  forward_agent: true,
  auth_methods: %w[publickey]
}
