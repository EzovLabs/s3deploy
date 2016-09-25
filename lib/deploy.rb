module AwesomeS3uploader
  class Deploy
    def initialize(path_to_project, bucketname)
      @path_to_project = path_to_project
      @bucketname = bucketname
    end

    def run
      p `s3cmd -P sync #{@path_to_project} s3://#{@bucketname}`
    end
  end
end
