# debugwand-demo

This project creates a container that can be debugged by [debugwand](https://github.com/savannahostrowski/debugwand/tree/main).

My environment was Ubuntu 26.04.1 LTS with podman.

## Setup the local environment

```bash
python3.14 -m venv .venv
source .venv/bin/activate
pip install debugwand==0.5.0
```

## Build the image

```bash
podman build -t debugwand-demo:1.0.0 .
```

## Run the container

The example program is a simple web app. The port 8080 is opened for
the app and 5679 is opened for the debugger.

```bash
podman run \
    --name debugwand-demo \
    -p 8080:8080 \
    -p 5679:5679 \
    --cap-add=SYS_PTRACE \
    localhost/debugwand-demo:1.0.0
```

Open a browser at: http://127.0.0.1:8080/

## Start debugwand

```bash
wand debug --container debugwand-demo
```

## Debug

Attach the debugger, set a breakpoint on the request handler and refresh the
browser.

This is the launch.json for vscode.

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Attach to container",
      "type": "debugpy",
      "request": "attach",
      "connect": {
        "host": "127.0.0.1",
        "port": 5679
      },
      "pathMappings": [
        {
          "localRoot": "${workspaceFolder}",
          "remoteRoot": "/app"
        }
      ]
    }
  ]
}
```
