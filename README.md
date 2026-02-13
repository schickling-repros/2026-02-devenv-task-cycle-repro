# devenv fork-bomb repro

This repo intentionally defines cyclic task dependencies in `devenv.nix`:

- `setup:pre:hooks` runs before `devenv:git-hooks:install`
- `devenv:git-hooks:install` runs before `setup:pre:hooks`

## Repro

From this directory run:

```bash
devenv tasks run setup:pre:hooks
```

Expected: task graph detection should report a cycle instead of completing.
