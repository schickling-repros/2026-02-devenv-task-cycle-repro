# devenv fork-bomb repro

This repo recreates the fork-loop pattern discussed in cachix/devenv issue #688 by defining

- `setup:pre:hooks` depends on `devenv:git-hooks:install` (via `before`), and
- `devenv:git-hooks:install` runs the same task again.

That creates an unbounded task-spawn pattern when exercised through a shell entry path.

## Repro

```bash
devenv shell
```

Expected (with a safe failure mode): devenv should refuse to recurse and report an actionable cycle.
Observed in affected versions: shell startup never returns and the process tree keeps respawning.

## Repro with explicit `direnv` path

```bash
cat > .envrc <<'EOF'
use devenv
EOF
direnv allow
timeout 5s direnv exec . bash -lc "devenv tasks run setup:pre:hooks --no-tui --mode before"
```

In the faulty behavior, the command exits with `124` after timeout rather than returning a fast
`Cycle detected` error.
