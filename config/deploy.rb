set :stages, %w(staging staging-ours staging-shengda production)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
