#!/bin/bash

# Run the build_runner code generation task
fvm flutter pub run build_runner build -d

echo "build_runner code generation task completed."