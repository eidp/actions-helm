<!-- NOTE: This file's contents are automatically generated. Do not edit manually. -->
# Helm Publish (Action)

Publish a Helm chart to a container registry.

## 🔧 Inputs

|        Name       |             Description            |Required|              Default              |
|-------------------|------------------------------------|--------|-----------------------------------|
|    `repo_host`    |  URL of target container registry. |   Yes  |                 ``                |
|    `repo_user`    |Username for the container registry.|   No   |                 ``                |
|  `repo_password`  |Password for the container registry.|   No   |                 ``                |
|    `chart_path`   |       Path to the chart dir.       |   No   |             `./charts`            |
|`chart_output_path`|       Path to the chart dir.       |   No   |`${{ github.workspace }}/chart.tgz`|
|     `version`     |  Override the Helm chart version.  |   No   |                 ``                |
|   `app-version`   | Override the Helm chart appVersion.|   No   |                 ``                |
|       `args`      | Additional arguments for helm push.|   No   |                 ``                |

## 📤 Outputs

_None_

## 🚀 Usage

```yaml
- name: Helm Publish
  uses: eidp/actions-helm/helm-publish@v0
  with:
    # your inputs here
```
