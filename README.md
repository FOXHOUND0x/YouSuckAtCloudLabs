# cloud-labs
A structured set of pulumi monorepo that follows the various cloud certification objectives.

### What to expect
- [You Suck At Cloud - Cloud Lab Walkthrough](https://www.youtube.com/watch?v=sI29xu_A1BA)

### The goal
To have a single mono-repo that is split by cloud provider and their respective certification paths from [Microsoft Learn](https://learn.microsoft.com/en-us/training/), [AWS Training and Certification](https://aws.amazon.com/training/), and [Google Cloud Training](https://cloud.google.com/training) and container technologies such as Docker and Kubernetes as well as some common devops tools like Packer, Vagrant, and consul and more.

This will allow for a structured approach to learning cloud technologies and provide a way to deploy resources in a consistent manner.


### Deployment Model
The deployment model is based on the [Pulumi](https://www.pulumi.com/) framework. The Pulumi framework allows for the deployment of cloud resources using a programming language. This allows for the use of a single language to deploy resources across multiple cloud providers.


### Structure
there will be a dedicated folder for each cloud provider, and within each cloud provider folder, there will be a folder for each certification path. The certification path folder will contain the pulumi code to deploy the resources required for that certification path.

Additionally, this repo will contain a folder for dedciated docker and kubernetes resources which will be practices locally since I don't have the money to spend on cloud based labbing at that scale.

```
cloud-labs
│
├───azure
│   ├───az-104
│   ├───az-204
│   ├───az-303
│   └───az-304
│---aws
│   ├───aws-ccp
│   ├───aws-sa
│   ├───aws-dev
│   └───aws-pro
│---gcp
│   ├───gcp-ace
│   ├───gcp-pca
│   ├───gcp-pca
---docker
|  ├─── README.md
---kubernetes
|  ├─── README.md
---consul
|  ├─── README.md
---packer
|  ├─── README.md
---vagrant
|  ├─── README.md
--- README.md
```

