# CodeTruss Homebrew tap

This is the official Homebrew tap for the CodeTruss CLI, a local-first acceptance
gate for AI-generated changes. It binds an agent task to the final Git diff, runs
deterministic analyzers and repository verification, and writes a verifiable
PASS, REVIEW_REQUIRED, or FAILED receipt.

## Install

Homebrew 6 requires trust for software from third-party taps. Installing the
fully qualified formula trusts only this formula, not every package the tap may
contain:

```sh
brew install DeliriumPulse/codetruss/codetruss
codetruss --version
```

To upgrade or uninstall:

```sh
brew upgrade codetruss
brew uninstall codetruss
```

Then initialize a Git repository and install the hook for your coding agent:

```sh
cd /path/to/repository
codetruss init --allow "src/**" --deny ".github/**"
codetruss hooks install codex    # or claude, pre-commit, or all
codetruss hooks doctor codex
```

Run a review directly:

```sh
codetruss review --task "Add account export" --allow "src/**" --verify "npm test"
```

Deterministic analysis and receipts stay on your machine. `--llm` is opt-in and
uses your selected provider credentials; only an explicit `codetruss sync`
uploads a receipt to CodeTruss. See the full [CLI documentation](https://codetruss.com/cli).

## Integrity and release policy

The formula downloads one immutable, versioned archive from the official
[`DeliriumPulse/codetruss-cli`](https://github.com/DeliriumPulse/codetruss-cli)
release. Its SHA-256 is pinned in the formula. Pull requests run formula style,
audit, install, and functional tests on supported macOS runners before merge.

Do not update only the version or URL. Every release change must update the URL,
SHA-256, and formula test together and must point to a published, immutable
CodeTruss release.

## Licensing boundary

The files in this tap repository are MIT-licensed. The CodeTruss CLI downloaded
by the formula is proprietary, free-to-use software governed by the license
inside the release archive and the [CodeTruss Terms](https://codetruss.com/terms).
The tap license does not relicense the CLI. See [NOTICE.md](NOTICE.md).

## Support and security

- Installation or formula issue: [open a tap issue](https://github.com/DeliriumPulse/homebrew-codetruss/issues)
- CLI issue: [open a CLI issue](https://github.com/DeliriumPulse/codetruss-cli/issues)
- Security report: follow the private reporting instructions in [SECURITY.md](SECURITY.md)

