module AwesomeS3uploader
  class Deploy
    def initialize(path_to_source, bucketname, access_key, secret_key, region, deploy_path)
      @path_to_source = path_to_source
      @bucketname = bucketname
      @access_key = access_key
      @secret_key = secret_key
      @region = region
      @deploy_path = deploy_path
    end

    def run
      p `s3cmd  --access_key '#{@access_key}' --secret_key '#{@secret_key}' --region '#{@region}' -P sync #{@path_to_source}/* s3://#{@bucketname}#{@deploy_path}`
    end
  end
end
