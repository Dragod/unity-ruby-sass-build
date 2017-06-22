# unity-ruby-sass-build

Building sass with ruby without the need to remember the sass commands and folder path and automating the main.css overrides.

This bash script will only working on screendragon unity configured machines.

It's reccomended to run this on a `Visual studio code` editor on a bash command line.

Some skin are already pre-configured to compile, just check `build-config.json` for a list.

## Configuration

You can configure your own skin to be compiled. 
All you need to do is just add a new value pair in the `build-config.json`.

Example:

```json
"your-skin-name":["your-skin-name"],
```

Also you need to set the main css file path, if you want the script to override it for you.
Just add you path to the last line of the `build-config.json` file.

```json
"main-css-path": ["C:/your/path/here"]
```

## How to use build.sh

1. Copy the `build.sh` into the main project folder as well as build-config.json, make sure they are in the same directory.
2. Open a bash console on the main project folder and run `./build.sh`.
3. The script will run and show you 3 simple step to follow.





