install:
	bundle install

lint:
	bundle exec rubocop lib

my_test:
	rake test