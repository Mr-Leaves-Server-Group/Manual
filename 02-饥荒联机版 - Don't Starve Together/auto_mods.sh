# Define paths
SRC="/mnt/server/steamapps/workshop/content/322330"
MODS_DIR="/mnt/server/mods"
MASTER_UGC="/mnt/server/ugc_mods/server/Master/content/322330"
CAVES_UGC="/mnt/server/ugc_mods/server/Caves/content/322330"

# Ensure target directories exist
mkdir -p "$MODS_DIR"
mkdir -p "$MASTER_UGC"
mkdir -p "$CAVES_UGC"

for mod_path in "$SRC"/*; do
    mod_id=$(basename "$mod_path")
    
    # Check if this specific mod folder contains a .bin file
    if ls "$mod_path"/*.bin >/dev/null 2>&1; then
        echo "Mod $mod_id: Detected Legacy Bin. Extracting to /mods/workshop-$mod_id..."
        
        TARGET_MOD_FOLDER="$MODS_DIR/workshop-$mod_id"
        mkdir -p "$TARGET_MOD_FOLDER"
        
        bin_file=$(ls "$mod_path"/*.bin)
        unzip -o "$bin_file" -d "$TARGET_MOD_FOLDER"
        
    else
        echo "Mod $mod_id: Detected UGC Folder. Copying to Shard UGC directories..."
        
        # Create and copy to Master Shard UGC
        mkdir -p "$MASTER_UGC/$mod_id"
        cp -R "$mod_path"/* "$MASTER_UGC/$mod_id/"
        
        # Create and copy to Caves Shard UGC
        mkdir -p "$CAVES_UGC/$mod_id"
        cp -R "$mod_path"/* "$CAVES_UGC/$mod_id/"
    fi
done

# Cleanup permissions
chmod -R 777 "$MODS_DIR"
chmod -R 777 /mnt/server/ugc_mods