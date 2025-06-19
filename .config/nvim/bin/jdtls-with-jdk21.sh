#!/bin/bash
current_jdtls_version=$(ls /opt/homebrew/Cellar/jdtls/)
JAVA_HOME="$HOME/.sdkman/candidates/java/21.0.5-amzn" exec "/opt/homebrew/Cellar/jdtls/${current_jdtls_version}/libexec/bin/jdtls"  "$@"
