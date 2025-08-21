#!/bin/bash

# Script to convert JPEG images to WebP and remove EXIF metadata
echo "Converting JPEG images to WebP and removing EXIF metadata..."

# Find all JPEG files in content directory
find content/ -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) | while read -r file; do
    echo "Processing: $file"
    
    # Get the directory and filename without extension
    dir=$(dirname "$file")
    filename=$(basename "$file")
    name="${filename%.*}"
    
    # Convert to WebP with high quality and remove metadata
    cwebp -q 85 -metadata none "$file" -o "${dir}/${name}.webp"
    
    if [ $? -eq 0 ]; then
        echo "  ✓ Converted to WebP: ${dir}/${name}.webp"
        
        # Remove the original JPEG file
        rm "$file"
        echo "  ✓ Removed original: $file"
    else
        echo "  ✗ Failed to convert: $file"
    fi
done

echo "Image conversion complete!"
