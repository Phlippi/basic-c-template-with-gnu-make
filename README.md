# Overview
This is a basic and small template for c++. It is inted to be customized.

## Features
- Include folders
- Deps so that only necessary parts are compiled
- clangd and clang-format support
- diffrent build modes (release and debug)
- very customizable

## Notes on clangd
clangd is a bit weird (at least in vscode).
Apparently clangd resolves paths relativ to the file that its applied on.

For Example:

If you have a setup like this
- include
- src
    - file.cpp
- .clangd

If clangd looks something like this:

```
CompileFlags:
  Add:
    - "-Iinclude"
```

and you try to open file.cpp clangd will look for a include folder in src.
To solve this I added a relative path with .. in the clangd file.

The only problem is that you can't have nested directories. (I don't see that as much of a problem