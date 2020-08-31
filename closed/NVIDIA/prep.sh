#!/bin/bash
make download_dataset
make preprocess_data_no_imagenet
make download_model
make generate_engines RUN_ARGS="--benchmarks=ssd-large,gnmt --scenarios=SingleStream"

