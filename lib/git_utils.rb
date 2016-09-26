require 'git'
module AwesomeS3uploader
  class GitUtils
    def initialize
      @git = Git.open('.')
    end

    def mark_commit
      name = "DEPLOY_#{Time.now.to_i}"
      p @git
      @git.add_tag(name, @git.log.first.sha)
    end

    def tags
      deploy_tags = []
      @git.tags.each do |t|
        deploy_tags.push(t) if t.name.include?('DEPLOY_')
      end
      return deploy_tags
    end

    def checkout_deploy_branch
      @git.branch('deploy').checkout
    end

    def reset_branch_to_sha(sha)
      @git.reset_hard(sha)
    end

    def clean_up
      p  @git.branch('master').checkout
      p  @git.branch('deploy').delete
    end

  end
end
