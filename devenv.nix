{ ... }:

{
  tasks = {
    # This intentionally causes shell entry to re-run itself through the git-hooks
    # installation task, producing a runaway process chain.
    "devenv:git-hooks:install" = {
      after = [ "setup:pre:hooks" ];
      exec = "echo entering-hook-install; devenv shell -c true";
    };

    "setup:pre:hooks" = {
      before = [ "devenv:git-hooks:install" ];
      exec = "echo setup-pre-hooks";
    };
  };
}
