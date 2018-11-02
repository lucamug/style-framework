## How to publish

To check the documentation in real time run the command
```
cmd/docs-preview
```

## How to develop

Run one of the following commands depending on which part you are developing:
```
$ cmd/start
$ cmd/start-example-button
$ cmd/start-example-customized
$ cmd/start-example-spa
```

## How to build for production

Run the command
```
$ cmd/build/start
```
This will generate files in the docs folder that will be automatically served by github on merging these files into the master branch.

## Analyze code

```
$ elm bump
```

After this update the version number at the top of Styleguide.elm

## Publish

```
$ elm publish
```
