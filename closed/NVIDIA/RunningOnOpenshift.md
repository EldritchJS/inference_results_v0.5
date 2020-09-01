# Running MLPerf Inference on OpenShift

### Prerequisites
1. OpenShift cluster with admin rights and compatible GPU(s) (e.g. T4)
2. NVIDIA GPU operator installed on cluster
3. Node Feature Discovery operator installed on cluster

### Build MLPerf NVIDIA Image
Minimal: Follow the steps of the `README.md` file in this directory to the `make build_docker` step, then push the image to the image repository of your choice (e.g. quay.io)
Optional: Run the docker image locally, then run additional steps of the preparation process in the `README.md` file in this directory. `make download_dataset` will cause your image to be even more enormous. `make download_model` is safer. 

### Deploy image to OpenShift cluster 
Assuming you have a project on the cluster, navigate to the pods section of your project and click on 'create pod'.

Enter the contents of the `podsetup.yaml` file in this directory. Changing `namespace: ` value to your project namespace. 

### Acquire and preprocess data, acquire models, generate benchmark harnesses
In the terminal, run the following `./prep.sh`

### Run the benchmarks
In the terminal, run the following `./runharness.sh`

Note: This script runs two benchmarks using the SingleStream scenario. Sometimes MLPerf chooses to only run one of the benchmarks. It's easiest to check the output log to see if it was successful.

### Get the results files updated
In the terminal, run the following `make update_results` 

You can view your run results in `results/`

### Modify for your needs
`prep.sh` and `runharness.sh` are provided as examples. The steps for other benchmarks and scenarios are similar and would require only changing arguments in these scripts. Be sure to check the inference documentation to see what combinations of benchmark and scenario are valid. 


