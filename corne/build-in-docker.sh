#!/bin/bash
set -e
config_dir="/app/config"
timestamp=$(date -u +"%Y%m%d%H%M%S")
mkdir -p /app/firmware

# Parse build.yaml
while IFS=$',' read -r board shield; do
    # Remove quotes if present
    board=${board//\"/}
    shield=${shield//\"/}
    
    echo ""
    echo "-----------------"
    echo "BUILDING FIRMWARE"
    echo "-----------------"
    echo "Board: ${board}"
    echo "Shield: ${shield}"
    echo ""
    
    # Set artifact name and build directory
    artifact_name=${shield//nice_view_adapter /}
    artifact_name=${artifact_name//nice_view_custom /}
    artifact_name=${artifact_name//nice_view /}
    artifact_name=${artifact_name// /-}
    build_dir="/app/build/${artifact_name}-${board}"
    
    # Configure and build using the proper path to ZMK
    if [[ ! -d "$build_dir" ]]; then
        cd /app/zmk
        west build -s app -b "$board" -d "$build_dir" -- \
            -DZMK_CONFIG="$config_dir" -DSHIELD="${shield}"
    else
        cd /app/zmk
        west build -d "$build_dir" -- -DZMK_CONFIG="$config_dir"
    fi
    
    # Copy resulting firmware file
    for extension in uf2 hex bin; do
        artifact="${build_dir}/zephyr/zmk.${extension}"
        if [[ -f "$artifact" ]]; then
            filename="/app/firmware/${timestamp}-${artifact_name}-${board}"
            cp "$artifact" "${filename}.${extension}"
            echo "Created firmware file: ${filename}.${extension}"
            break
        fi
    done
done < <(grep -v '^#' /app/build.yaml | grep -e 'board:' -e 'shield:' | sed 's/.*: //' | sed 'N;s/\n/,/')
echo "Build process completed."
