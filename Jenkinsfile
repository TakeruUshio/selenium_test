pipeline {
  agent { label 'functest' }
  options {
    disableConcurrentBuilds()
  }
  stages {
    stage('test'){
      environment {
        RBENV_VERSION = '2.6'
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
          bundle install --jobs=4 --path=vendor/bundle --deployment
          bundle config
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
          bundle exec rspec spec/features/ || bundle exec rspec spec/features/ --only-failures
        '''
      }
      post {
        always {
          // Save tmp/turnip_formatter/report.html as artifact
          archiveArtifacts allowEmptyArchive: true, artifacts: "tmp/turnip_formatter/report*.html"
        }
        cleanup {
          // Cleanup workspace after build
          cleanWs()
        }
      }
    }
  }
}

/* vim:set ft=groovy: */
