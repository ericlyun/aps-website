#!/bin/bash

# Set up Ruby gem environment for pixi
export GEM_HOME="${PIXI_PROJECT_ROOT}/.pixi/envs/default/share/rubygems"
export GEM_PATH="${GEM_HOME}:${PIXI_PROJECT_ROOT}/.pixi/envs/default/lib/ruby/gems/3.3.0"
export PATH="${GEM_HOME}/bin:${PATH}"

# Conda's macOS linker may not understand newer Apple SDKs. Ruby's native
# extensions must use the compiler/linker shipped with the active system SDK.
if [[ "$(uname -s)" == "Darwin" ]]; then
    export CC="$(/usr/bin/xcrun --find clang)"
    export CXX="$(/usr/bin/xcrun --find clang++)"
    export SDKROOT="$(/usr/bin/xcrun --show-sdk-path)"
    export RUBYLIB="${PIXI_PROJECT_ROOT}/scripts${RUBYLIB:+:${RUBYLIB}}"
    export RUBYOPT="${RUBYOPT:+${RUBYOPT} }-rmacos-toolchain"
fi
