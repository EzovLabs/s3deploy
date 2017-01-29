# AwesomeS3uploader

TODO

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'awesomeS3uploader'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install awesomeS3uploader

also you need to install `s3cmd`

for arch  you can run `pacman -S s3cmd`
for ubuntu you can run `apt-get install s3cmd`


## Usage

create 'config.yml' in root of your project. and fill it as in example
```yaml
bucket_name: 'your bucket name'
aws_key: your aws access key
aws_secret: your aws secret key
aws_region: your aws region
path_to_source: './build' # path to assembled js files
deploy_path: '/assets/' # where you want to upload
```

then run `s3deploy deploy` to deploy or `s3deploy rollback` to rollback to any state that have been pushed

also do no use 'deploy' branch name in your git because it reserved by this tool and if you do it can lead to unwanted things

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/awesomeS3uploader.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
