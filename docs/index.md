---
layout: none
---
# BASH Kit
## Summary
Working scripts and tools written in BASH ready to use as is or extend.  
For example, upload files for scanning or grepping logs for URLs for scanning. 
  
The scripts are up open source on GitHub and contain ample comments, so you can fork them and modify as you wish.

Also see [Bash Kit Listing](/plugin-list/plugin-secplugs-bash-kit)

## Quick Start
Download from [BashKit.zip](https://docs.secplugs.com/bash-kit/download/BashKit.zip) and extract to a folder.  
Or simply run the commands below in any BASH shell.
```bash
curl https://docs.secplugs.com/bash-kit/download/BashKit.zip -o ./BashKit.zip
unzip -o BashKit.zip
chmod +x ./*.sh
```
You'll now have all the BASH scripts in the directory ready to use.

## Usage

### url_scan.sh - Url Analysis Script
Use this script for submitting urls for analysis
To scan a url, pass it as a parameter  
E.g. below shows scanning of a test url
```bash
./url_scan.sh https://example.com/?param=e81e043973f21d036e39fe
```
### file_scan.sh - File Analysis Script
Use this script for submitting files for analysis
To test connectivity run without no argument, it will default to scanning eicar.  
```bash
./file_scan.sh
```
To scan a named file, pass the file as a parameter  
E.g. to have it scan itself use below.
```bash
./file_scan.sh ./file_scan.sh
```
To scan the contents of named directory, specify a directory as parameter
E.g. to scan the contents of the /tmp
```bash
./file_scan.sh /tmp
```


## Contact
Having trouble? [Contact {brand-name} ](https://{brand-root-domain}/contacts)