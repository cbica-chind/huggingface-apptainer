# How to build a Hugging Face container using NGC TensorFlow as a base

## Copy or pre-download the NGC TensorFlow image

Run the script `predownload.sh`

## Build the HF container

Run the script `build_hf.sh`

## Check

Check `nvidia-smi`:

``` console
$ apptainer run --nv ./hf.sif nvidia-smi

================
== TensorFlow ==
================

NVIDIA Release 25.02-tf2 (build 143088767)
TensorFlow Version 2.17.0
Container image Copyright (c) 2025, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
Copyright 2017-2024 The TensorFlow Authors.  All rights reserved.

Various files include modifications (c) NVIDIA CORPORATION & AFFILIATES.  All rights reserved.

This container image and its contents are governed by the NVIDIA Deep Learning Container License.
By pulling and using the container, you accept the terms and conditions of this license:
https://developer.nvidia.com/ngc/nvidia-deep-learning-container-license

NOTE: Mellanox network driver detected, but NVIDIA peer memory driver not
      detected.  Multi-node communication performance may be reduced.

Fri Nov 14 12:24:16 2025
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 580.82.07              Driver Version: 580.82.07      CUDA Version: 13.0     |
+-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA GH200 480GB             On  |   00000009:01:00.0 Off |                    0 |
| N/A   23C    P0             82W /  900W |      58MiB /  97871MiB |      0%      Default |
|                                         |                        |             Disabled |
+-----------------------------------------+------------------------+----------------------+

+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI              PID   Type   Process name                        GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
|  No running processes found                                                             |
+-----------------------------------------------------------------------------------------+
```

Check Python version:

``` console
$ apptainer run --nv ./hf.sif python --version

...

Python 3.12.3
```

Check `transformers` version:

``` console
$ apptainer run --nv ./hf.sif python -c 'import transformers ; print(transformers.__version__)'

...

4.57.1
```

### Check GPU availability

Run the test script `test.py`:

``` python
#!/usr/bin/env python3
# filename: test.py
import tensorflow as tf

print(f'{tf.config.list_physical_devices("GPU")}')
```

``` console
$ apptainer run --nv ./hf.sif python test.py
...
[ warnings about factories ignored ]
...

[PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')]
```

