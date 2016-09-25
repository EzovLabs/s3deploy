module AwesomeS3uploader
  class Rollback
    def initialize(git_utils)
      @git = git_utils
    end

    def menu(tags)
      tags.each_with_index do |t, index|
        time = DateTime.strptime(t.name[7..t.name.length], '%s')
        p "#{index}) #{time.strftime('%B %d, %Y %H:%M') }"
      end
    end

    def run
      deploy_tags = @git.tags
      menu(deploy_tags)
      user_choice = STDIN.gets
      sha = deploy_tags[user_choice.to_i].sha
      @git.checkout_deploy_branch
      @git.reset_branch_to_sha(sha)
    end
  end
end
