set -e
GITLAB_API_URL="https://gitlab.com/api/v4"
PROJECT_ID="$GITLAB_PROJECT_ID"
ACCESS_TOKEN="$GITLAB_ACCESS_TOKEN"
BRANCH="master"

response=$(curl --silent --request POST "$GITLAB_API_URL/projects/$PROJECT_ID/pipeline" \
  --header "PRIVATE-TOKEN: $ACCESS_TOKEN" \
  --form ref="$BRANCH")

pipeline_id=$(echo $response | jq -r '.id')

if [ "$pipeline_id" != "null" ]; then
  echo "Pipeline run with success. ID Pipeline: $pipeline_id"
else
  echo "Pipeline failed. Response API: $response"
fi
