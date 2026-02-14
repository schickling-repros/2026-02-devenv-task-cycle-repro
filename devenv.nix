{ ... }:

{
  tasks = {
    "devenv:git-hooks:install" = {
      after = [ "setup:pre:hooks" ];
      exec = "echo entering-hook-install; devenv tasks run setup:pre:hooks --no-tui --mode before";
    };

    "setup:pre:hooks" = {
      before = [ "devenv:git-hooks:install" ];
      exec = "echo setup-pre-hooks";
    };
  };
}
