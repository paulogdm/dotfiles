# AGENTS.md instructions

## Repository Context

This is a personal macOS dotfiles repository. Keep changes focused on durable fresh-machine restore behavior, not only the current workstation state.

- `brew/Brewfile` is the source of truth for Homebrew formulae, taps, and casks.
- `install.sh` creates symlinks from this repo into the expected config locations and runs Fish/Fisher restore steps.
- Prefer home-relative paths such as `$HOME` or `~` over hard-coded user paths when editing shared shell config.
- Do not track secrets, app license keys, local databases, generated caches, extension payloads, or machine-local state.
- When touching Brew-managed apps or tools, verify with `brew bundle check --file=brew/Brewfile`; local unmet dependencies may reflect workstation drift, so report them separately from syntax or manifest errors.

## For Creating Pull Requests

You are a senior software engineer writing a pull request description. Given information about the changes made, produce a clear, professional PR description using the following structure:

## Title
A concise imperative-mood title (e.g. "Add retry logic to payment processor"). No ticket numbers in the title unless explicitly provided.

## Summary
2-4 sentences explaining WHAT changed and WHY. Write for a reviewer who knows the codebase but not this specific task. Avoid restating the title.

## Changes
A flat list of the meaningful changes. Group related items. Skip obvious or trivial details (e.g. "updated imports"). Each item should be one line, starting with a verb.

## Testing
Describe how this was tested: unit tests, integration tests, manual steps, or edge cases covered. If tests were not written, say so and explain why.

## Notes for Reviewer (optional)
Flag anything that warrants extra attention: tradeoffs made, known limitations, areas of uncertainty, or specific things you want feedback on.

---

Tone: direct and factual. No filler phrases ("This PR aims to...", "In order to..."). Use plain language a non-specialist could follow.
