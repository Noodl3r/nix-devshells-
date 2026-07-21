{
  description = "Development environment templates";
  outputs = {self}: {
    templates = {
      c = {
        path = ./c;
        description = "C development environment with CMake default";
      };
      cpp = {
        path = ./cpp;
        description = "C++ development environment with CMake default";
      };
      ocaml = {
        path = ./ocaml;
        description = "OCaml development environment optimized for classes";
      };
      python = {
        path = ./python;
        description = "Python development environment for silliness";
      };
      embedded = {
        path = ./embedded;
        description = "Embedded environment for arduino, ESP etc. Lots to add";
      };
      default = self.templates.c;
    };
  };
}
