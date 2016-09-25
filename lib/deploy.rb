module AwesomeS3uploader
  class Deploy
    def initialize(path_to_project, bucketname, access_key, secret_key, region)
      @path_to_project = path_to_project
      @bucketname = bucketname
      @access_key = access_key
      @secret_key = secret_key
      @region = region
    end

    def run
      p `s3cmd  --access_key '#{@access_key}' --secret_key '#{@secret_key}' --region '#{@region}' -P sync #{@path_to_project} s3://#{@bucketname}`
    end
  end
end
