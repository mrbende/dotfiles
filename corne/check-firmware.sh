#!/bin/bash

# Check if file is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <uf2-file>"
  exit 1
fi

UF2_FILE=$1

# Check if file exists
if [ ! -f "$UF2_FILE" ]; then
  echo "Error: File '$UF2_FILE' not found."
  exit 1
fi

# Check file size is multiple of 512 (UF2 block size) - macOS compatible
FILE_SIZE=$(stat -f%z "$UF2_FILE")
if [ $(($FILE_SIZE % 512)) -ne 0 ]; then
  echo "❌ Invalid: File size ($FILE_SIZE bytes) is not a multiple of 512 bytes"
  exit 1
fi

BLOCKS=$(($FILE_SIZE / 512))
echo "✓ File size is valid: $FILE_SIZE bytes ($BLOCKS blocks)"

# Check magic numbers in the first block
MAGIC1=$(hexdump -s 0 -n 4 -e '1/4 "0x%08x"' "$UF2_FILE")
MAGIC2=$(hexdump -s 4 -n 4 -e '1/4 "0x%08x"' "$UF2_FILE")

if [ "$MAGIC1" != "0x0a324655" ] || [ "$MAGIC2" != "0x9e5d5157" ]; then
  echo "❌ Invalid: Magic numbers not found at start of file"
  echo "  Expected: 0x0a324655 0x9e5d5157"
  echo "  Found:    $MAGIC1 $MAGIC2"
  exit 1
fi

echo "✓ Magic numbers are valid"

# Sample a few random blocks to verify they all have the magic numbers
# This is faster than checking every block for large files
NUM_BLOCKS=$(($FILE_SIZE / 512))
if [ $NUM_BLOCKS -gt 10 ]; then
  echo "Sampling blocks for validity check..."
  
  # Check blocks at different positions (beginning, middle, end)
  for pos in 0 $(($NUM_BLOCKS/2)) $(($NUM_BLOCKS-1)); do
    OFFSET=$(($pos * 512))
    MAGIC1=$(hexdump -s $OFFSET -n 4 -e '1/4 "0x%08x"' "$UF2_FILE")
    MAGIC2=$(hexdump -s $(($OFFSET+4)) -n 4 -e '1/4 "0x%08x"' "$UF2_FILE")
    
    if [ "$MAGIC1" != "0x0a324655" ] || [ "$MAGIC2" != "0x9e5d5157" ]; then
      echo "❌ Invalid: Block $pos has invalid magic numbers"
      echo "  Expected: 0x0a324655 0x9e5d5157"
      echo "  Found:    $MAGIC1 $MAGIC2"
      exit 1
    fi
  done
  echo "✓ Sampled blocks have valid structure"
else
  # For small files, check all blocks
  for ((i=0; i<NUM_BLOCKS; i++)); do
    OFFSET=$(($i * 512))
    MAGIC1=$(hexdump -s $OFFSET -n 4 -e '1/4 "0x%08x"' "$UF2_FILE")
    MAGIC2=$(hexdump -s $(($OFFSET+4)) -n 4 -e '1/4 "0x%08x"' "$UF2_FILE")
    
    if [ "$MAGIC1" != "0x0a324655" ] || [ "$MAGIC2" != "0x9e5d5157" ]; then
      echo "❌ Invalid: Block $i has invalid magic numbers"
      exit 1
    fi
  done
  echo "✓ All blocks have valid structure"
fi

echo "✅ UF2 file appears to be valid"
exit 0
