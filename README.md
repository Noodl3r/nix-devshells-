# Nix based developer environments

This is a pretty straightforward flake that exposes a couple different build
directives for various languages and project types. Currently there are a couple
to complete.

- [x] C
- [ ] C++
- [x] OCaml
- [x] Java (ew)
- [ ] FPGA

## Adding New Templates

The top-level flake outputs the result of a helper function (defined in `lib.nix`) that takes the `./modules` directory as input. This function iterates over each subdirectory in `./modules` and defines a template named after that directory with the following attributes:

```nix
  rec {
    path = templateDir + "/${x}";
    description = (import (path + "/flake.nix")).description;
  };
```

For example, the directory `./modules/c` with file `./modules/c/flake.nix` defines the follwing template:

```nix
  c = {
    path = ./modules/c;
    description = "Nix dev shell for C";
  };
```

... which is reflected with `nix flake show`
```
[***]$ nix flake show
git+file:///home/***/Documents/nix-devshells
└───templates
    ├───c: template: Nix dev shell for C
```

In practice, defining a new template simply requires creating a subdirectory under `./modules` with the desired template name and adding a meaningful `description` attribute to its `flake.nix`.
