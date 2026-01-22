#!/bin/bash

# --- Configuration (Relative Paths) ---
STEAMCMD_PATH="./steamcmd/steamcmd.sh"
INSTALL_DIR="."
APP_ID="322330"

# Source of Truth: Your Master Shard modoverrides
OVERRIDES_FILE="./DoNotStarveTogether/config/server/Master/modoverrides.lua"

# Destination Paths
SRC="./steamapps/workshop/content/$APP_ID"
MODS_DIR="./mods"
MASTER_UGC="./ugc_mods/server/Master/content/$APP_ID"
CAVES_UGC="./ugc_mods/server/Caves/content/$APP_ID"

# --- Step 1: Extract IDs from modoverrides.lua ---
if [ ! -f "$OVERRIDES_FILE" ]; then
    echo "Error: Overrides file not found at $OVERRIDES_FILE"
    exit 1
fi

echo "--- Phase 1: Extracting IDs from Master modoverrides ---"
# Extracts numbers inside ["workshop-12345678"]
mapfile -t UNIQUE_IDS < <(grep -oE 'workshop-[0-9]+' "$OVERRIDES_FILE" | grep -oE '[0-9]+' | sort -u)

if [ ${#UNIQUE_IDS[@]} -eq 0 ]; then
    echo "No workshop IDs found in modoverrides.lua. Check your formatting."
    exit 1
fi

echo "Found ${#UNIQUE_IDS[@]} unique mods: ${UNIQUE_IDS[*]}"

# --- Step 2: Download via SteamCMD ---
echo "--- Phase 2: Downloading via SteamCMD ---"
CMD="+force_install_dir $INSTALL_DIR +login anonymous"
for id in "${UNIQUE_IDS[@]}"; do
    CMD="$CMD +workshop_download_item $APP_ID $id"
done
CMD="$CMD +quit"

eval "$STEAMCMD_PATH $CMD"

# --- Step 3: Align & Sync ---
echo "--- Phase 3: Syncing and Unpacking ---"
mkdir -p "$MODS_DIR" "$MASTER_UGC" "$CAVES_UGC"

for id in "${UNIQUE_IDS[@]}"; do
    mod_path="$SRC/$id"
    
    if [ ! -d "$mod_path" ]; then
        echo "Warning: Mod $id folder not found in steamapps. Skipping..."
        continue
    fi

    # Scenario A: Legacy Bin (.bin file exists)
    if ls "$mod_path"/*.bin >/dev/null 2>&1; then
        echo "Mod $id: Legacy Bin -> Extracting to $MODS_DIR/workshop-$id"
        TARGET_MOD_FOLDER="$MODS_DIR/workshop-$id"
        mkdir -p "$TARGET_MOD_FOLDER"
        bin_file=$(ls "$mod_path"/*.bin | head -n 1)
        unzip -o "$bin_file" -d "$TARGET_MOD_FOLDER"
        
    # Scenario B: UGC Folder (Already extracted)
    else
        echo "Mod $id: UGC Folder -> Syncing to Shard UGC directories"
        # Master Shard
        mkdir -p "$MASTER_UGC/$id"
        cp -R "$mod_path"/* "$MASTER_UGC/$id/"
        # Caves Shard
        mkdir -p "$CAVES_UGC/$id"
        cp -R "$mod_path"/* "$CAVES_UGC/$id/"
    fi
done

# --- Step 4: Final Permissions ---
chmod -R 777 "$MODS_DIR" "./ugc_mods"
echo "--- SUCCESS: All mods aligned and ready ---"