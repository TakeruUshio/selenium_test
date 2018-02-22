pipeline {
  agent { label 'functest' }
  options {
    disableConcurrentBuilds()
  }
  stages {
    stage('test'){
      steps {
        // Show environment
        sh '''#!/bin/bash -l
          set -xe
          export -p
          rbenv versions
          gem env
          bundle --version
        '''
        // bundle install
        sh '''#!/bin/bash -l
          set -xe
          bundle check || bundle install --jobs=4 --path=/opt/bundler/TakeruUshi__selenium_test --deployment
          bundle config
          [ "$GIT_BRANCH" = "master" ] && bundle clean
          bundle show --paths
        '''
        // Run test
        sh '''#!/bin/bash -l
          set -xe
          xvfb-run bundle exec rspec spec/features/*.feature
        '''
        // Cleanup workspace
        cleanWs()
      }
    }
  }
}

/* vim:set ft=groovy: */
