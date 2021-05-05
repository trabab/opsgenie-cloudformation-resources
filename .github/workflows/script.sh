
#!/usr/bin/evn bash
# python as multi line string

read -r -d '' PYSCRIPT << ENDPY
import json
def updateJsonFile():

    with open('/Users/trabab/dev/opsgenie-ecosystem/opsgenie-cloudformation-resources/opsgenie_team/overrides.json', 'r') as f:
        data = json.load(f)
        data["CREATE"]["/OpsgenieApiKey"]= "test-api-2"
        print(data);
        with open('/Users/trabab/dev/opsgenie-ecosystem/opsgenie-cloudformation-resources/opsgenie_team/overrides.json', 'w') as f1:
            json.dump(data, f1, indent=4)

updateJsonFile()
ENDPY

# execute python and fail on error

echo "$PYSCRIPT" |python - || exit 1