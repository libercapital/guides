# Git

A guide for programming within version control.

## Best Practices

- Squash multiple trivial commits into a single commit.

## Maintain a Repo

- Avoid including files in source control that are specific to your development
  machine or process.
- Delete local and remote feature branches after merging.
- Perform work in a feature branch.
- Rebase frequently to incorporate upstream changes.
- Use a [pull request] for code reviews.

[pull request]: https://help.github.com/articles/using-pull-requests/

## Write a Feature

Create a local feature branch based off `release`.

```console
git switch release
git pull origin release
git switch -b <branch-name>
```

Rebase frequently to incorporate upstream changes.

```console
git fetch origin
git rebase origin/release
```

Resolve conflicts. When feature is complete and tests pass, stage the changes.

```console
git add --all
```

When you've staged the changes, commit them.

```console
git status
git commit --verbose
```

Write a [good commit message]. Example format:

    Present-tense summary under 50 characters

    - More information about commit (under 72 characters).
    - More information about commit (under 72 characters).

    https://liber.atlassian.net/browse/XXX-XXX

If you've created more than one commit, [use `git rebase` interactively] to squash them into cohesive commits with good
messages:

```console
git rebase -i origin/release
```

Share your branch.

```console
git push origin <branch-name>
```

Submit a [GitHub pull request].

Ask for a code review in the #pull-requests channel in Slack.

[good commit message]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[use `git rebase` interactively]: https://help.github.com/articles/about-git-rebase/
[github pull request]: https://help.github.com/articles/using-pull-requests/

## Review Code

A team member other than the author reviews the pull request. They follow [Code
Review](/code-review/) guidelines to avoid miscommunication.

They make comments and ask questions directly on lines of code in the GitHub web
interface or in the project's chat room.

Prefer to use the code suggestion feature in Github when reviewing pull requests so
the owner can accept them without losing previous approvals.

For changes which they can make themselves, they check out the branch.

```console
git checkout <branch-name>
./bin/setup
git diff staging/release..HEAD
```

They make small changes right in the branch, test the feature on their machine,
run tests, commit, and push.

When satisfied, they comment on the pull request `Ready to merge.`

## Merge

Rebase interactively. Squash commits like "Fix whitespace" into one or a small
number of valuable commit(s). Edit commit messages to reveal intent. Run tests.

```console
git fetch origin
git rebase -i origin/release
```

Force push your branch. This allows GitHub to automatically close your pull
request and mark it as merged when your commit(s) are pushed to `main`. It also
makes it possible to [find the pull request] that brought in your changes.

```console
git push --force-with-lease origin <branch-name>
```

View a list of new commits. View changed files. Merge branch into `main`.

```console
git log origin/release..<branch-name>
git diff --stat origin/release
git checkout release
git merge <branch-name> --ff-only
git push
```

Delete your remote feature branch.

```console
git push origin --delete <branch-name>
```

Delete your local feature branch.

```console
git branch --delete <branch-name>
```

[find the pull request]: http://stackoverflow.com/a/17819027

## Pull Requests (or Merge Requests)

### Description

- When the change has a JIRA
  - Add the Jira code and link to the PR description
- When the change does not have a JIRA
  - Add all the necessary information to help other developers understand why and how that change was done

### Helpers

**Auto-merger**

- When `auto-merge` is enabled, the PR is automatically merged into the destination branch after all the checks are green.

**WIP Tag**

- Place the tag `[WIP]` at the beginning of the title of your PR to let other developers know that this is still a work in progress and avoid an accidental merge.
