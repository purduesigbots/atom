stage('Build') {
  parallel (
    "linux64": {
      node("lin64") {
        checkout scm
        sh 'bash -ic "nvm install --lts=boron; nvm exec --lts=boron ./script/build --compress-artifacts"'
        archiveArtifacts allowEmptyArchive: true, artifacts: 'out/*.tar.gz', onlyIfSuccessful: true
      }
    },
    "linux86": {
      node("lin86") {
        checkout scm
        sh 'bash -ic "nvm install --lts=boron; nvm exec --lts=boron ./script/build --compress-artifacts"'
        archiveArtifacts allowEmptyArchive: true, artifacts: 'out/*.tar.gz', onlyIfSuccessful: true
      }
    },
    "windows64": {
      node("win64") {
        checkout scm
        retry(3) {
          bat '.\\script\\build.cmd --compress-artifacts'
        }
        archiveArtifacts allowEmptyArchive: true, artifacts: 'out/*.zip', onlyIfSuccessful: true
      }
    },
    "windows32": {
      node("win86") {
        checkout scm
        retry(3) {
          bat '.\\script\\build.cmd --compress-artifacts'
        }
        archiveArtifacts allowEmptyArchive: true, artifacts: 'out/*.zip', onlyIfSuccessful: true
      }
    }
  )
}
