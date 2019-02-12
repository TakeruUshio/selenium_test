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
