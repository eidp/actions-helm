HARBOR_URL="https://$(echo $HARBOR_HOST | cut -d'/' -f1)"
HARBOR_CREDS=$(echo -n "$HARBOR_USERNAME:$HARBOR_PASSWORD" | base64)
DIGEST=$(curl -s -k -X GET "$HARBOR_URL/api/v2.0/projects/$GITHUB_REPOSITORY/repositories/$REPO_NAME/artifacts" \
  -H "Authorization: Basic $HARBOR_CREDS" \
  | jq -r 'if . == null then empty else .[] | select(.tags[]?.name == "'"$CHART_VERSION"'") | .digest end // empty')

echo "Digest for tag $CHART_VERSION: $DIGEST"

# Delete the artifact
curl -s -k -X DELETE "$HARBOR_URL/api/v2.0/projects/$GITHUB_REPOSITORY/repositories/$REPO_NAME/artifacts" \
  -H "Authorization: Basic $HARBOR_CREDS" \
  -H "Content-Type: application/json" \
  -d '{"digest": "'"$DIGEST"'"}'
