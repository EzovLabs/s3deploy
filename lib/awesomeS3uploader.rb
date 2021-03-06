require "awesomeS3uploader/version"
require 'yaml'
require_relative 'deploy'
require_relative 'git_utils'
require_relative 'rollback'
require 'pry'
module AwesomeS3uploader
  class Main
    def parse_config
      config = YAML.load_file './config.yml'
      @bucket_name = config['bucket_name']
      @source_path = config['path_to_source']
      @access_key = config['aws_key']
      @secret_key = config['aws_secret']
      @deploy_path = config['deploy_path']
      @region = config['aws_region']
    end

    def initialize
      parse_config
      @deploy = Deploy.new @source_path, @bucket_name, @access_key, @secret_key, @region, @deploy_path
      @git = GitUtils.new
      @rollback = Rollback.new @git
    end

    def run(args)
      case args.first
      when 'rollback'
        @rollback.run
        @deploy.run
        @git.clean_up
      when 'deploy'
        @git.mark_commit
        @deploy.run
      end
    end
  end
end
