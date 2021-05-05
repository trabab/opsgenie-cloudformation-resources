
#!/usr/bin/evn bash
# python as multi line string

read -r -d '' PYSCRIPT << ENDPY
import json
import os
def updateJsonFile():

    with open('opsgenie_team/overrides.json', 'r') as f:
        data = json.load(f)
        data["CREATE"]["/OpsgenieApiKey"]= os.environ['OPSGENIE_API_KEY']
        data["CREATE"]["/OpsgenieApiEndpoint"]= os.environ['OPSGENIE_API_URL']
        print(data);
        with open('opsgenie_team/overrides.json', 'w') as f1:
            json.dump(data, f1, indent=4)

updateJsonFile()
ENDPY

# execute python and fail on error

echo "$PYSCRIPT" |python - || exit 1
