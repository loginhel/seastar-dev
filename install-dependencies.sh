#!/bin/bash
#
# This file is open source software, licensed to you under the terms
# of the Apache License, Version 2.0 (the "License").  See the NOTICE file
# distributed with this work for additional information regarding copyright
# ownership.  You may not use this file except in compliance with the License.
#
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
# os-release may be missing in container environment by default.
if [ -f "/etc/os-release" ]; then
    . /etc/os-release
elif [ -f "/etc/arch-release" ]; then
    export ID=arch
else
    echo "/etc/os-release missing."
    exit 1
fi

debian_packages1=(
    ninja-build
    ragel
    libhwloc-dev
    libnuma-dev
    libpciaccess-dev
    libcrypto++-dev
    libboost-all-dev
    libxml2-dev
    xfslibs-dev
    libgnutls28-dev
    liblz4-dev
    libsctp-dev
    gcc
	g++
)

debian_packages2=(
    make
    libprotobuf-dev
    protobuf-compiler
    python3
    systemtap-sdt-dev
    libtool
    cmake
    libyaml-cpp-dev
    libc-ares-dev
    stow
    libfmt-dev
    diffutils
    valgrind
)

apt-get install -f -y "${debian_packages1[@]}"
apt-get update
apt-get install -f -y "${debian_packages2[@]}"
