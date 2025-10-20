<!-- NOTE: This file's contents are automatically generated. Do not edit manually. -->
# Helm Publish (Action)

Publish a Helm chart to a registry.

Make sure that the workflow using this action has access to the Chart registry by setting up appropriate secrets.
By default a chart is published to the GitHub container registry. For authentication, the default `GITHUB_TOKEN` is used which has sufficient permissions.

This action supports overriding the chart version and appVersion during packaging.

## 🔧 Inputs

|Name                |Description                         |Required|Default                             |
|--------------------|------------------------------------|--------|------------------------------------|
|`repo-host`         |URL of target registry.             |Yes     |``                                  |
|`repo-user`         |Username for the registry.          |No      |``                                  |
|`repo-password`     |Password for the registry.          |No      |``                                  |
|`chart-path`        |Path to the chart dir.              |No      |`./charts`                          |
|`chart-output-path` |Path to the chart dir.              |No      |`${{ github.workspace }}/chart.tgz` |
|`version`           |Override the Helm chart version.    |No      |``                                  |
|`app-version`       |Override the Helm chart appVersion. |No      |``                                  |
|`args`              |Additional arguments for helm push. |No      |``                                  |

## 📤 Outputs

|Name      |Description                                               |
|----------|----------------------------------------------------------|
|`version` |The version of the published chart.                       |
|`digest`  |The digest of the published chart in the target registry. |

## 🚀 Usage

```yaml
- name: Helm Publish
  uses: eidp/actions-helm/publish@v0
  with:
    # your inputs here
```
