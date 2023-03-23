read -p "What is your username:   " username
read -p "What is your repo:   " repo_name

response="$(curl   -X DELETE \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer $GITHUB_TOKEN"\
  https://api.github.com/repos/$username/$repo_name)"

echo $response | jq -r .message
if [[ -z $(echo $response | jq -r .message) ]]; then
    echo "repository $repo_name deleted successfully"
else
    echo "error: $(echo $response | jq -r .message)"
fi