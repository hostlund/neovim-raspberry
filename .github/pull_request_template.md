## Description

<!-- What does this PR change and why? Keep it short and concrete. -->

## Type of change

- [ ] Bug fix
- [ ] New feature / enhancement
- [ ] Docs
- [ ] Build / Docker / install script
- [ ] Chore (deps, cleanup, CI)

## How has this been tested?

<!-- Pick what applies. This repo builds Neovim in Docker on Raspberry Pi, so state where and how you tested. -->

- [ ] `./install.sh` (default stable)
- [ ] `./install.sh <version>` (specify version: )
- [ ] `./install.sh --keep-image`
- [ ] `remote-install.sh` / remote install path
- [ ] Docker build only (no install)

Test environment:

- Raspberry Pi model:
- OS (e.g. `Raspberry Pi OS 64-bit`, output of `cat /etc/os-release`):
- Docker version (`docker --version`):
- Neovim version installed (`nvim --version`, first lines):

Logs / output (paste relevant excerpt):

```text

```

## Checklist

- [ ] I have not committed directly to `main` — this change goes via PR
- [ ] Shell scripts pass `shellcheck` (if touched `*.sh`)
- [ ] Shell scripts pass `shfmt -d` / are consistently formatted (if touched `*.sh`)
- [ ] `Dockerfile` builds (if touched)
- [ ] Docs updated (`README.md` / script `--help` output, if behavior changed)
- [ ] No secrets, tokens, or local paths committed

## Related issues

<!-- e.g. Closes #12 -->

Closes #
