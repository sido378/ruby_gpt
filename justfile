set dotenv-load := true

build:
  gem build ruby_gpt.gemspec
  sudo gem install ruby_gpt-0.1.0.gem

test:
  ruby test.rb
