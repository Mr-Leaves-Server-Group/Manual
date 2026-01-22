#!/bin/bash

# --- Configuration (Relative Paths) ---
STEAMCMD_PATH="./steamcmd/steamcmd.sh"
ZIP_PATH="./7zz"
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
# PHASE 3: Syncing and Unpacking
# ---------------------------------------------------------
echo "========================================================="
echo "PHASE 3: Syncing and Unpacking"
echo "========================================================="

# Ensure 7zz is executable
if [ -f "$ZIP_PATH" ]; then
    chmod +x "$ZIP_PATH"
else
    echo "ERROR: 7zz binary not found at $ZIP_PATH"
    exit 1
fi

mkdir -p "$MODS_DIR" "$MASTER_UGC" "$CAVES_UGC"

for id in "${UNIQUE_IDS[@]}"; do
    mod_path="$SRC/$id"
    
    if [ ! -d "$mod_path" ]; then
        echo "[SKIP] Mod $id: Folder not found in $SRC"
        continue
    fi

    # Handle Legacy Bin (.bin file exists)
    if ls "$mod_path"/*.bin >/dev/null 2>&1; then
        echo "[LEGACY] Mod $id -> Extracting via 7zz to $MODS_DIR/workshop-$id"
        TARGET_MOD_FOLDER="$MODS_DIR/workshop-$id"
        
        rm -rf "$TARGET_MOD_FOLDER"
        mkdir -p "$TARGET_MOD_FOLDER"
        bin_file=$(ls "$mod_path"/*.bin | head -n 1)
        
        # Extract
        "$ZIP_PATH" x "$bin_file" -o"$TARGET_MOD_FOLDER" -y > /dev/null
        
        # --- FIX FOR WINDOWS BACKSLASHES ---
        # This looks for files with \ in the name and creates the real directory structure
        (
            cd "$TARGET_MOD_FOLDER"
            find . -name "*\\*" | while read -r file; do
                newfile=$(echo "$file" | tr '\\' '/')
                mkdir -p "$(dirname "$newfile")"
                mv "$file" "$newfile"
            done
        )
        
    # Handle UGC Folder
    else
        echo "[UGC]    Mod $id -> Syncing to Shard folders"
        
        rm -rf "$MASTER_UGC/$id"
        mkdir -p "$MASTER_UGC/$id"
        cp -R "$mod_path"/* "$MASTER_UGC/$id/"
        
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