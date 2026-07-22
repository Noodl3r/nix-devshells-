{
  getTemplates = path: {
    templates = builtins.listToAttrs (
      map (x: {
        name = x;
        value = let
          dir = path + "/${x}";
          flakeDescription = (import (dir + "/flake.nix")).description;
        in {
          description = flakeDescription;
          path = dir;
        };
      })
      (
        builtins.attrNames
        (builtins.readDir path)
      )
    );
  };
}
