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
      @project_path = config['path_to_project']
      @access_key = config['aws_key']
      @secret_key = config['aws_secret']
      @region = config['aws_region']
    end

    def initialize
      parse_config
      @deploy = Deploy.new @project_path, @bucket_name, @access_key, @secret_key, @region
      @git = GitUtils.new @project_path
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
