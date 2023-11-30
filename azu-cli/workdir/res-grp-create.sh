#!/bin/bash

az group create -n "${GROUP}" -l "${LOCATION}"
az configure --defaults group="${GROUP}" location="${LOCATION}"
