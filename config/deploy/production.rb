server '35.72.239.105', user: 'app', roles: %w{app db web}
set :ssh_options, {
  port: 22,
  keys: [ENV.fetch('PRODUCTION_SSH_KEY').to_s],
  forward_agent: true,
  auth_methods: %w[publickey]
}
