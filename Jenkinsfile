pipeline {
  agent { label 'functest' }
  options {
    disableConcurrentBuilds()
  }
  stages {
    stage('test'){
      environment {
        RBENV_VERSION = '2.5.2'
        USE_HEADLESS = 'true'
      }
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
        // check firefox, geckodriver version
        sh "bash -lc 'firefox --version'"
        sh "bash -lc 'geckodriver --version'"
        // check google-chrome, chromedriver version
        sh "bash -lc 'google-chrome --version'"
        sh "bash -lc 'chromedriver --version'"
        // Run test
        sh '''#!/bin/bash -l
          set -xe
          bundle exec rspec spec/features/*.feature
        '''
        // Save tmp/turnip_formatter/report.html as artifact
        archiveArtifacts allowEmptyArchive: true, artifacts: "tmp/turnip_formatter/report.html"
        // Cleanup workspace
        cleanWs()
      }
    }
  }
}

/* vim:set ft=groovy: */
