set :stage, :production
set :rvm_type, :user #Tell rvm to look in ~/.rvm
set :rvm_ruby_version, '2.0.0-p247'


# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.

# set :server_3, %w{ec2-50-18-43-219.us-west-1.compute.amazonaws.com}
set :servers_11, %w{ec2-54-219-5-76.us-west-1.compute.amazonaws.com ec2-54-241-67-96.us-west-1.compute.amazonaws.com ec2-50-18-43-219.us-west-1.compute.amazonaws.com ec2-54-219-24-121.us-west-1.compute.amazonaws.com ec2-54-219-21-236.us-west-1.compute.amazonaws.com ec2-204-236-189-129.us-west-1.compute.amazonaws.com ec2-204-236-166-137.us-west-1.compute.amazonaws.com ec2-54-219-81-125.us-west-1.compute.amazonaws.com ec2-54-219-95-80.us-west-1.compute.amazonaws.com ec2-54-219-79-198.us-west-1.compute.amazonaws.com ec2-54-219-76-194.us-west-1.compute.amazonaws.com}
set :server_4_9_10_11, %w{ec2-54-219-24-121.us-west-1.compute.amazonaws.com ec2-54-219-95-80.us-west-1.compute.amazonaws.com ec2-54-219-79-198.us-west-1.compute.amazonaws.com ec2-54-219-76-194.us-west-1.compute.amazonaws.com}
set :server_db, %w{ec2-50-18-135-154.us-west-1.compute.amazonaws.com}

# role :web, fetch(:server_name) # Needed for precompiling assets
# role :app, fetch(:server_name) # Needed for preparing something I forgot what
# role :db, fetch(:server_name) # Needed for migration
# role :all, fetch(:server_name) # This doesn't work completely yet, hence the above 3 specifications

role :web, fetch(:servers_4_9_10_11)
role :app, fetch(:servers_4_9_10_11)
role :db, fetch(:server_db)

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
#server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
set :ssh_options, {
    user: %{ubuntu},                # The user we want to log in as
    keys: %w{/Users/zhe-mac/Code/MentorLandDeploy/mentorland_california.pem}, # Your .pem file
    forward_agent: true,          # In order for our EC2 instance to be able to access Github via ssh we need to forward our local ssh agent (since we have set up Github to accept that)
    auth_methods: %w(publickey)   # We are using ssh with .pem files  }
}
# and/or per server
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options

set :rails_env, :production #This is for the rails module which does not find the env correctly
fetch(:default_env).merge!(rails_env: :production)
