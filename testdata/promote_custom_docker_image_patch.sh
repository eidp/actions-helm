/bin/bash

export ADDITIONAL_IMAGE_VERSION="$GITHUB_SHA@sha256:$GITHUB_SHA" && yq eval -i ".additionalImage.tag = strenv(ADDITIONAL_IMAGE_VERSION)" values.yaml