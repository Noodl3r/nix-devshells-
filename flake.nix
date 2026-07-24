{
  description = "Development environment templates";
  outputs = {self}:
    (import ./lib.nix).getTemplates ./modules;
}
