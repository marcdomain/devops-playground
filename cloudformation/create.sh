#!/bin/bash

aws cloudformation create-stack --stack-name marcdomain --template-body file://EC2.yml
