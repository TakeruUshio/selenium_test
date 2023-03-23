pipeline {
  agent none
  options {
    disableConcurrentBuilds()
  }
  environment {
    USE_HEADLESS = 'true'
  }
  stages {
    stage('test matrix') {
      matrix {
        axes {
          axis {
            name 'RBENV_VERSION'
            values '3.2'
          }
          axis {
            name 'BUNDLE_GEMFILE'
            values ''
          }
        }
        stages {
          stage('test') {
            agent { label 'functest' }
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
}

def loadEnvAndRun(Closure body){
  def ruby_version = env.RBENV_VERSION
  def gemfile = env.BUNDLE_GEMFILE
  if (gemfile){
    gemfile = sh(script: "basename ${gemfile}", returnStdout: true).trim()
  } else {
    gemfile = 'Gemfile'
  }
  withEnv([
    "TURNIP_FORMATTER_OUT=tmp/turnip_formatter/report-${ruby_version}-${gemfile}.html",
  ]){
    body()
  }
}

def runTest(){
  loadEnvAndRun(){
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
      bundle exec parallel_rspec -n 2 --type turnip spec/features/ || bundle exec parallel_rspec -n 2 --type turnip -- --only-failures -- spec/features/
    '''
  }
}

/* vim:set ft=groovy: */
