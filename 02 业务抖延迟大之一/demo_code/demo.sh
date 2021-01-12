#!/bin/bash

stress -c 1 --vm 4 --vm-bytes 256MB --vm-keep

stress -c 1 --vm 4 --vm-bytes 256MB --vm-hang 5

stress -c 1 --vm 4 --vm-bytes 256MB --vm-stride 64