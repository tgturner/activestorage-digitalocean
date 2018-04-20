[![Build Status](https://travis-ci.org/tgturner/activestorage-digitalocean.png?branch=master)](https://travis-ci.org/tgturner/activestorage-digitalocean)

# ActiveStorage Service for DigitalOcean Spaces

**WARNING** this gem should not be used for any critical systems. It does not add much to the existing functionality of `ActiveStorage`. DigitalOcean Spaces are already compatible with the `ActiveStorage` implementation for Amazon. Instead of pulling in a new dependency, you should setup your `config/storage.yml` like this.

```yml
amazon:
  service: S3
  access_key_id: <YOUR_SPACES_KEY_HERE>
  secret_access_key: <YOUR_SPACES_SECRET_KEY_HERE>
  region: nyc3
  bucket: <YOUR_SPACES_NAME_HERE>
  endpoint: 'https://nyc3.digitaloceanspaces.com'
```

This Gem was born out of a [failed Rails PR](https://github.com/rails/rails/pull/32660).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activestorage-digitalocean'
```

And then execute:

```bash
$ bundle
```

## Usage

`config/storage.yml`

```yml
digital_ocean:
  service: DigitalOcean
  spaces_access_key: <YOUR_SPACES_KEY_HERE>
  spaces_secret_key: <YOUR_SPACES_SECRET_KEY_HERE>
  region: nyc3
  space_name: <YOUR_SPACES_NAME_HERE>
  endpoint: 'https://nyc3.digitaloceanspaces.com'
```

## Running Tests

Add your own environment variables for `test/configurations.yml`, then run either `bin/test` or `bundle exec rake test`

Currently there is an issue when running the full test suite at once that causes `Aws::S3::Errors::QuotaExceeded` errors to occur. If you would like to run a single tests, you may do so like this.

`bundle exec ruby -Itest test/digital_ocean_service_test.rb -n test_that_you_would_like_to_run`

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).