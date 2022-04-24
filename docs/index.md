---
layout: none
---
# BASH Kit
Working scripts and tools written in BASH ready to use as is or extend.  
For example, upload files for scanning or grepping logs for URLs for scanning. 
  
The scripts are up open source on GitHub and contain ample comments, so you can fork them and modify as you wish.

Also see [Bash Kit Listing](/plugin-list/plugin-secplugs-bash-kit)

## Installation
Download from [BashKit.zip](https://docs.secplugs.com/bash-kit/download/BashKit.zip) and extract to a folder.  
Or simply run the commands below in any BASH shell.
```bash
curl https://docs.secplugs.com/bash-kit/download/BashKit.zip -o ./BashKit.zip
unzip -o BashKit.zip
chmod +x ./*.sh
```
You'll now have all the BASH scripts in the directory ready to use.

## Usage
Usage pattern is to invoke the script with the scan target on the command line.

### Scan a File
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

### Scan a URL
Use this script for submitting urls for analysis
To scan a url, pass it as a parameter  
E.g. below shows scanning of a test url
```bash
./url_scan.sh https://example.com/?param=e81e043973f21d036e39fe
```

### Use Your Own API Key
To use additional features and the privacy of your own account, after registering with {brand-name}, sign in with your username and [create an API key](docs?doc=docs/HowTo/CreateKey) 

After creating a key, the only change is to set the SP_API_KEY environment variable before running the scripts

```bash
export SP_API_KEY="your-api-key"
```

## Contact
Having trouble? [Contact {brand-name} ](https://{brand-root-domain}/contacts)