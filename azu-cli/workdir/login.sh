#!/bin/bash

az login -u "${USER_PRINCIPAL}" -p "${PASSWORD}"
az account set -s "${SUBSCRIPTION}"
