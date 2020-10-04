#!/bin/bash
#
# ADFS Layout.

rm -rf tmp
mkdir tmp

# Copy source files.

cp ../src/* tmp

# Create !BOOT

cat > tmp/\!BOOT <<EOF
*LIB LIBRARY
*EXEC MakeMOS
EOF

# Convert sources to CR line endings
unix2mac tmp/*

# Add the tools (which don't need line ending conversion).
cp ../tools/TurMasm ../tools/IoMasm ../tools/Edit ../tools/*.inf tmp

# Create an ADFS disc.

cp bootable.adl AcornOS120.adl
afscp tmp/\!BOOT tmp/MO* tmp/MakeMOS tmp/TurMasm tmp/IoMasm tmp/Edit AcornOS120.adl:
rm -rf tmp

# End.
