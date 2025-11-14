# How to build a Hugging Face container using NGC TensorFlow as a base

## Copy or pre-download the NGC TensorFlow image

Run the script `predownload.sh`

## Build the HF container

Run the script `build_hf.sh`

## Check

Check Python version:

``` console
$ apptainer run --nv ./hf.sif python --version
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

Python 3.12.3
```

Check `transformers` version:

``` console
$ apptainer run --nv ./hf.sif python -c 'import transformers ; print(transformers.__version__)'

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

