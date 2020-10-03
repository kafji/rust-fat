#!/bin/bash

set -e

podman build --no-cache --tag rust-fat .
