server '18.180.132.86', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/suzukishouta/.ssh/id_rsa'