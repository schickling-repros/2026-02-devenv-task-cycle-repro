{ pkgs, ... }:

{
  packages = [ pkgs.git ];

  tasks = {
    "setup:pre:hooks" = {
      before = ["devenv:git-hooks:install"];
      exec = "echo 'running setup:pre:hooks'";
    };

    "devenv:git-hooks:install" = {
      before = ["setup:pre:hooks"];
      exec = "echo 'running devenv:git-hooks:install'";
    };
  };
}
