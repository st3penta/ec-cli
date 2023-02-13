#!/usr/bin/env bash
# Copyright 2022 Red Hat, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

BUNDLE="quay.io/redhat-appstudio-tekton-catalog/pipeline-docker-build:devel"
MAIN_GO=$(git rev-parse --show-toplevel)/main.go
go run $MAIN_GO validate pipeline --pipeline-file <(tkn bundle list $BUNDLE -o json) | yq -P
