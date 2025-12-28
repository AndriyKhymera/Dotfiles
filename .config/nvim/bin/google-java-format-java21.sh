#!/bin/bash
export JAVA_HOME="$HOME/.sdkman/candidates/java/21.0.5-amzn"
exec /opt/homebrew/bin/google-java-format "$@"
