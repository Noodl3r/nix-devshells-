{
  getTemplates = templateDir: {
    templates = builtins.listToAttrs (
      map (x: {
        name = x;
        value = rec {
          path = templateDir + "/${x}";
          description = (import (path + "/flake.nix")).description;
        };
      })
      (
        builtins.attrNames
        (builtins.readDir templateDir)
      )
    );
  };
}
