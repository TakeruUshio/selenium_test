# Run test:

```shell
rm -f tmp/example_status.txt
bundle exec rspec spec/features/
bundle exec rspec spec/features/ --only-failures
```

Headless execution:

```shell
export USE_HEADLESS=true
rm -f tmp/example_status.txt
bundle exec rspec spec/features/
bundle exec rspec spec/features/ --only-failures
```

Run selenium3 feature only `@selenium3` tag scenario:

```shell
BUNDLE_GEMFILE=gemfiles/selenium_3.gemfile bundle exec rspec spec/features/sample_use_selenium3_or_seleninum4.feature
```

Run selenium4 feature only `@selenium4` tag scenario:

```shell
BUNDLE_GEMFILE=gemfiles/selenium_4.gemfile bundle exec rspec spec/features/sample_use_selenium3_or_seleninum4.feature
```

