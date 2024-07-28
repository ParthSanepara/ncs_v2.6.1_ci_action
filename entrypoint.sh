#!/bin/bash

# Source the Zephyr environment script
. /workdir/ncs/zephyr/zephyr-env.sh

# Check if ZEPHYR_TAG is set
if [ -z "$ZEPHYR_TAG" ]; then
  echo "Error: ZEPHYR_TAG environment variable is not set."
  exit 1
fi

# Check if the SDK directory exists
if [ ! -d "/workdir/zephyr-sdk-${ZEPHYR_TAG}" ]; then
  echo "Error: Zephyr SDK directory not found: /workdir/zephyr-sdk-${ZEPHYR_TAG}"
  exit 1
fi

# Configure the SDK for the target architecture
/bin/bash /workdir/zephyr-sdk-${ZEPHYR_TAG}/setup.sh -t arm-zephyr-eabi

# Configure the SDK for cross-compilation
/bin/bash /workdir/zephyr-sdk-${ZEPHYR_TAG}/setup.sh -c

# Execute the remaining commands passed to the script
exec "$@"

