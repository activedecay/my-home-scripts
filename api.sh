#!/bin/bash

curl -s -H "Accept: application/json" -H "Authorization: Basic amZhdXN0OkhvaWFzZXI1" -k https://essjira.sandisk.com/rest/api/2/issue/EMD-$1
