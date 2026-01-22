#!/bin/bash

# --- Configuration (Relative Paths) ---
STEAMCMD_PATH="./steamcmd/steamcmd.sh"
INSTALL_DIR="."
APP_ID="322330"

# Source of Truth: Your Master Shard modoverrides
OVERRIDES_FILE="./DoNotStarveTogether/config/server/Master/modoverrides.lua"

# Destination Paths
SRC="./Steam/steamapps/workshop/content/$APP_ID"
MODS_DIR="./mods"
MASTER_UGC="./ugc_mods/server/Master/content/$APP_ID"
CAVES_UGC="./ugc_mods/server/Caves/content/$APP_ID"

# ---------------------------------------------------------
# Phase 1: ID Extraction
# ---------------------------------------------------------
echo ""
echo "========================================================="
echo "PHASE 1: Extracting IDs from Master modoverrides"
echo "========================================================="

if [ ! -f "$OVERRIDES_FILE" ]; then
    echo "ERROR: Overrides file not found at $OVERRIDES_FILE"
    exit 1
fi

# Extracts numbers inside ["workshop-12345678"]
mapfile -t UNIQUE_IDS < <(grep -oE 'workshop-[0-9]+' "$OVERRIDES_FILE" | grep -oE '[0-9]+' | sort -u)

if [ ${#UNIQUE_IDS[@]} -eq 0 ]; then
    echo "ERROR: No workshop IDs found in modoverrides.lua."
    exit 1
fi

echo "Found ${#UNIQUE_IDS[@]} unique mods to process."
echo "---------------------------------------------------------"
echo ""

# ---------------------------------------------------------
# Phase 2: SteamCMD Download
# ---------------------------------------------------------
echo "========================================================="
echo "PHASE 2: Downloading via SteamCMD"
echo "========================================================="

CMD="+force_install_dir $INSTALL_DIR +login anonymous"
for id in "${UNIQUE_IDS[@]}"; do
    CMD="$CMD +workshop_download_item $APP_ID $id"
done
CMD="$CMD +quit"

eval "$STEAMCMD_PATH $CMD"
echo ""
echo "Download phase finished."
echo "---------------------------------------------------------"
echo ""

# ---------------------------------------------------------
# Phase 3: Alignment & Syncing
# ---------------------------------------------------------
echo "========================================================="
echo "PHASE 3: Syncing and Unpacking"
echo "========================================================="

mkdir -p "$MODS_DIR" "$MASTER_UGC" "$CAVES_UGC"

for id in "${UNIQUE_IDS[@]}"; do
    mod_path="$SRC/$id"
    
    if [ ! -d "$mod_path" ]; then
        echo "[SKIP] Mod $id: Folder not found in $SRC"
        continue
    fi

    # Handle Legacy Bin (.bin file exists)
    if ls "$mod_path"/*.bin >/dev/null 2>&1; then
        echo "[LEGACY] Mod $id -> Extracting to $MODS_DIR/workshop-$id"
        TARGET_MOD_FOLDER="$MODS_DIR/workshop-$id"
        
        # Clean old folder and re-extract
        rm -rf "$TARGET_MOD_FOLDER"
        mkdir -p "$TARGET_MOD_FOLDER"
        bin_file=$(ls "$mod_path"/*.bin | head -n 1)
        unzip -q -o "$bin_file" -d "$TARGET_MOD_FOLDER"
        
    # Handle UGC Folder (Already extracted)
    else
        echo "[UGC]    Mod $id -> Syncing to Shard folders"
        
        # Master Shard
        rm -rf "$MASTER_UGC/$id"
        mkdir -p "$MASTER_UGC/$id"
        cp -R "$mod_path"/* "$MASTER_UGC/$id/"
        
        # Caves Shard
        rm -rf "$CAVES_UGC/$id"
        mkdir -p "$CAVES_UGC/$id"
        cp -R "$mod_path"/* "$CAVES_UGC/$id/"
    fi
done

# --- Final Step: Cleanup & Finish ---
echo ""
echo "Setting permissions..."
chmod -R 777 "$MODS_DIR" "./ugc_mods"

echo ""
echo "========================================================="
echo "SUCCESS: All mods aligned and ready for launch!"
echo "========================================================="
echo ""