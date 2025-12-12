set -e
GITLAB_API_URL="https://gitlab.dac.digital/api/v4"
PROJECT_ID="$1"
ACCESS_TOKEN="$2"
BRANCH="master"

response=$(curl --silent --request POST "$GITLAB_API_URL/projects/$PROJECT_ID/pipeline" \
  --header "PRIVATE-TOKEN: $ACCESS_TOKEN" \
  --form ref="$BRANCH")

pipeline_id=$(echo $response | jq -r '.id')

if [ "$pipeline_id" != "null" ]; then
  echo "Pipeline run with success. ID Pipeline: $pipeline_id"
  echo "Response API: $response"
else
  echo "Pipeline failed. Response API: $response"
  exit 1
fi
