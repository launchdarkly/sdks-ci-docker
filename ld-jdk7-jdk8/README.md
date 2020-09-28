# ldcircleci/ld-jdk7-jdk8

This is an Ubuntu 14.04 image that has both OpenJDK 7 and OpenJDK 8 installed. This allows testing for Java 7 compatibility in Gradle-based projects; Java 8 is required for running Gradle even if the project code will be run in Java 7.

The environment variables `JDK7_HOME` and `JDK8_HOME` will be set in the container to point to both versions. The default Java toolset will be OpenJDK 8 (`JAVA_HOME` will be the same as `JDK8_HOME`; you must configure your Gradle project explicitly to use OpenJDK 7.

Here is an example of Gradle configuration that allows the target JVM to be set dynamically for compiling and executing unit tests. While it is possible to set the compiler to use Java 7 as the target language version when compiling even if it is running in Java 8, actually compiling under Java 7 (and running tests in Java 7) verifies that there are no dependencies using the Java 8 class format.

Example (note that you may need to add a blank `overrideJavaHome=` line to `gradle.properties` to provide a default):

```groovy
tasks.withType(AbstractCompile) {
  options.with {
    if (overrideJavaHome != null) {
      fork = true
      forkOptions.javaHome = file(overrideJavaHome)
    }
  }
}
tasks.withType(Javadoc) {
  if (overrideJavaHome != null) {
    executable = new File(overrideJavaHome, "bin/javadoc")
  }
}
tasks.withType(Test) {
  if (overrideJavaHome != null) {
    executable = new File(overrideJavaHome, "bin/java")
  }
}
tasks.withType(JavaExec) {
  if (overrideJavaHome != null) {
    executable = new File(overrideJavaHome, "bin/java")
  }
}
```

```shell
./gradlew -Dorg.gradle.project.overrideJavaHome=$JDK7_HOME test
```
