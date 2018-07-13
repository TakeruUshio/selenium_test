# Run test:

```shell
bundle exec rspec spec/features/*.feature
```

parallel execution:

```shell
bundle exec ./exec/rspec-queue.rb spec/featureas/*.feature
```

Headless execution:

```shell
export USE_HEADLESS=true
bundle exec rspec spec/features/*.feature
```
