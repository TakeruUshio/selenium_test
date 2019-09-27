pipeline {
  agent none
  options {
    disableConcurrentBuilds()
  }
  environment {
    RBENV_VERSION = '2.6'
    USE_HEADLESS = 'true'
  }
  stages {
    stage('test'){
      parallel {
        stage('root') {
          agent { label 'functest' }
          // environment {
          // }
          steps {
            runTest()
          }
          post {
            always {
              // Save tmp/turnip_formatter/report*.html as artifact
              archiveArtifacts allowEmptyArchive: true, artifacts: "tmp/turnip_formatter/report*.html"
            }
            cleanup {
              // Cleanup workspace after build
              cleanWs()
            }
          }
        }
        stage('selenium3') {
          agent { label 'functest' }
          environment {
            BUNDLE_GEMFILE = 'gemfiles/selenium_3.gemfile'
          }
          steps {
            runTest()
          }
          post {
            always {
              // Save tmp/turnip_formatter/report*.html as artifact
              archiveArtifacts allowEmptyArchive: true, artifacts: "tmp/turnip_formatter/report*.html"
            }
            cleanup {
              // Cleanup workspace after build
              cleanWs()
            }
          }
        }
        stage('selenium4') {
          agent { label 'functest' }
          environment {
            BUNDLE_GEMFILE = 'gemfiles/selenium_4.gemfile'
          }
          steps {
            runTest()
          }
          post {
            always {
              // Save tmp/turnip_formatter/report*.html as artifact
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
  }
}

def runTest(){
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

/* vim:set ft=groovy: */
