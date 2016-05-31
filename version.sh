#!/bin/sh

# Files

GRADLE="./app/build.gradle"
STRINGS="./app/src/main/res/values/strings.xml"

# Get Current Version

LASTVERS=`git tag | tail -n 1`
echo "Previous Version: $LASTVERS"
echo "Enter Version Number (#.#.#)" 
read VERSION
echo "Enter Build Number (#)"
read BUILD
FULL="${VERSION}_${BUILD}"

echo ""
echo "Generating Version $FULL"
echo ""

# Strings FNR

sed -i -E "s/(<!ENTITY version \")+[0-9.]{3,}+(\">)/\1$VERSION\2/" $STRINGS
sed -i -E "s/(<!ENTITY buildno \")+[0-9]{1,}+(\">)/\1$BUILD\2/" $STRINGS
echo "Strings File Done"

# Gradle FNR

sed -i -E "s/(versionName \")+[0-9.]{3,}+(\")/\1$VERSION\2/" $GRADLE
sed -i -E "s/(versionCode )+[0-9]{1,}/\1$BUILD/" $GRADLE
echo "Gradle File Done"

# Git

git add $GRADLE
git add $STRINGS
git commit -m "Update Version Number"
git tag -a "$FULL" -m ""
echo "Git Done"

