node ('master') {
    stage('Clone repository) {
         /* Let's make  sure we have the repository cloned  to  our workspace */
        checkout scm
    }
    stage('Build image') {
         /* This buildsthe actual image; sysnonymous to 
           * docker build on the command line */
         app = docker.build("sayedyunis/Dockerfile1")
    }

    stage('Test image') {
         /* Ideally, we would run a test framework against our image.
           * For this example, we're using a Volkswagenn-type approach ;-) */
     
        app.inside {
             sh 'echo "Tests passed"'
        }
    }    

     stage('Push image') {
        /* Finally, we'll push the image with tow tags:
          * First, the incremental build number from Jenkins
          * Second, the 'latest' tag.
          * Pushiing multiple tags is cheap, as all the layers are ressued. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credential') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
