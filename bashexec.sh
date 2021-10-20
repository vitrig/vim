#!/usr/bin/env bash

# Buffer all input so that executed script can access it
export VIM_CONTENTS=$(cat)

# Pass input to bash
bash <<< "$VIM_CONTENTS"
