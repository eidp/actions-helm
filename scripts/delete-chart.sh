HARBOR_URL="https://$(echo $HARBOR_HOST | cut -d'/' -f1)"
HARBOR_CREDS=$(echo -n "$HARBOR_USERNAME:$HARBOR_PASSWORD" | base64)
PROJECT_NAME=$(echo $GITHUB_REPOSITORY | cut -d'/' -f2)
curl -X 'DELETE' \
  "${HARBOR_URL}/api/v2.0/projects/${PROJECT_NAME}/repositories/${REPO_NAME}/artifacts/${CHART_VERSION}" \
  -H 'accept: application/json' \
  -H "authorization: Basic ${HARBOR_CREDS}"