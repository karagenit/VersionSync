# Version Sync Script

This script is designed to make versioning with Android Studio easier.

Uses both standard version number (1.0.0) and a build number. 

## Features

* Updates versionName and versionCode in `build.gradle`
* Updates variables in `strings.xml` (see below)
* Commits changes under name "Update Version"
* Adds git tag with style VERSION_BUILD

### strings.xml

It expects you to have the following in your standards `strings.xml` file:

	<!DOCTYPE resources
		[
			<!ENTITY version "1.0.0">
			<!ENTITY buildno "1">
		]
	>

Though if this happens to be missing, nothing bad will happen, as the script simply uses regex to find and replace the version & build numbers. 
