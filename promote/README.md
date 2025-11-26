<!-- NOTE: This file's contents are automatically generated. Do not edit manually. -->
# Helm Promote (Action)

Promote a Helm chart by pulling it from an OCI registry, updating versions, repackaging it, and publishing it to a target registry.

Features:
- Pull Helm charts from OCI registries
- Update chart version and appVersion
- Patch Docker image versions (image.tag) in values.yaml with provided docker image version and optionally digest
- Support for custom image version patching script for advanced version/digest patching needs
- Publish promoted chart to target registry

The action supports authentication to a Helm registry. If `repo-user` and `repo-password` are provided, 
Authentication is optional for public registries.

A Custom patch script can be provided and will be executed in the chart directory context to be able to provide custom chart version / image tag patching logic.
This can be useful for charts with multiple images or non-standard image tag locations.
The promoted chart is published to the target registry after packaging.

## 🔧 Inputs

|Name                               |Description                                                                                                                                                                                                                                                                       |Required|Default|
|-----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------|-------|
|`chart`                            |OCI path of chart to retag. E.g. oci://ghcr.io/owner/repo/chart                                                                                                                                                                                                                   |Yes     |``     |
|`source-version`                   |The source chart version.                                                                                                                                                                                                                                                         |No      |``     |
|`target-version`                   |The target chart version.                                                                                                                                                                                                                                                         |No      |``     |
|`patch-docker-image`               |Whether to patch the docker image version in the chart.                                                                                                                                                                                                                           |No      |`true` |
|`custom-docker-image-patch-script` |Custom script to patch the version of the docker image(s) in the chart. Provide a reference to a script file in the repository. The location must be an absolute path (e.g. using the `github.workspace` context. The script will be executed in the directory of the Helm chart. |No      |``     |
|`target-docker-image-version`      |The target docker image version.                                                                                                                                                                                                                                                  |No      |``     |
|`target-docker-image-digest`       |The target docker image sha256 digest.                                                                                                                                                                                                                                            |No      |``     |
|`package-args`                     |Additional arguments to pass to the `helm package` command.                                                                                                                                                                                                                       |No      |``     |
|`repo-url`                         |URL of target registry to publish the promoted Chart to.                                                                                                                                                                                                                          |Yes     |``     |
|`repo-user`                        |Username for the registry.                                                                                                                                                                                                                                                        |No      |``     |
|`repo-password`                    |Password for the registry.                                                                                                                                                                                                                                                        |No      |``     |
|`push-args`                        |Additional arguments to pass to the `helm push` command.                                                                                                                                                                                                                          |No      |``     |

## 📤 Outputs

|Name      |Description                                              |
|----------|---------------------------------------------------------|
|`version` |The version of the promoted chart.                       |
|`digest`  |The digest of the promoted chart in the target registry. |

## 🚀 Usage

```yaml
- name: Helm Promote
  uses: eidp/actions-helm/promote@v0
  with:
    # your inputs here
```
