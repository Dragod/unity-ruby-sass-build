# unity-ruby-sass-build

Building sass with ruby without the need to remember the sass commands and folder path and automating the main.css overrides.

This bash script will only work on screendragon configured machine.

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
Just add you path in `build-config.json` file.

Example:

```json
"main-css-path": ["C:/your/path/here"]
```

> Please make sure that `"main-css-path": ["C:/your/path/here"]` is the last line of your `build-config.json`  or it will return an error while you try to run the script.

If you want to set the main.css manually each time just comment out last line in `build-config.json`.

## How to use build.sh

1. Copy the `build.sh` into the main project folder as well as build-config.json, make sure they are in the same directory.
2. Open a bash console on the main project folder and run `./build.sh`.
3. The script will run.
4. Just follow the suggested step by the script.





