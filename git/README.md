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

## How we commit


**[Presentation](https://docs.google.com/presentation/d/1Ej6kYkBoMOaDFspYK2DFhNc1sN6jpxr4oCKZ-3cqkUU/edit#slide=id.gde0622bef5_0_92)**

### [Main projects](https://github.com/libercapital)
  - [docs](https://github.com/libercapital/docs)
  - [liber-monolith](https://github.com/libercapital/liber-monolith)
  - [liber-auth](https://github.com/libercapital/liber-auth)
  - [liber-sign](https://github.com/libercapital/liber-sign)
  - [liber-id](https://github.com/libercapital/liber-id)
  - [liber-accounting](https://github.com/libercapital/liber-accounting)
  - [liber-edi](https://github.com/libercapital/liber-edi)
  - [snakehole](https://github.com/libercapital/snakehole)

### workflow

**branchs:**
- main → production
- release → staging
- feature branch → release

> novas features branchs são criadas a partir da release (não temos a development)

**How we name a branch:**

**_Note:_** *We name branchs in this way to integrate Jira with github*

**E.g:**

```
  feat/<jira-code>
  fix/<jira-code>
  etc...
```


```
  feat/ATL-42
  feat/EGYPT-88
  fix/EGYPT-67
```

**How we commit**

We mount a commit message using a pattern, this pattern allow us to know what kind of code the commit implements(feature, fix, improvement), integrates with a script to create new releases and let the developers know what the code aggregates:

**E.g:**

``` bash
  git commit -m "feat(ATL-43): Adds new features"
```

**These are the Tags the we use:**

```
  feat:        A new feature
  fix:         A bug fix
  improvement: An improvement to a current feature
  docs:        Documentation only changes
  style:       Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
  refactor:    A code change that neither fixes a bug nor adds a feature
  perf:        A code change that improves performance
  test:        Adding missing tests or correcting existing tests
  build:       Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)
  ci:          Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)
  chore:       Other changes that don't modify src or test files
  revert:      Reverts a previous commit
```

**Integration with Jira:**

Insert the Jira code between `()` after the tag. This will be used by a script to mount a new release

All the commit messages, PR descriptions and discussions should be done in `portuguese`

### How to open a new Pull Request(PR):**

**About branchs:**

- Feature branch → release (or to an epic/XXX-XX branch when needed);

**Naming a PR:**

Jira code between `[ ]` and a general description about the changes.

**E.g:**

```
[ATL-235] Nova listagem de títulos para o fornecedor

[EGYPT-67] Endpoint cancelamento antecipação
```

**PR description:**

- Fill up the template in the PR description with the Jira code and link, this helps us to undertand the code context.
- Adds other descriptions that you think that can be helpful to other developers.

**PR Approval:**

Automatic Checks:
  - Circle-CI → tests;
  - Rubocop → Ruby linter;

Aproves:

1 approval is required to be able to merge your PR into release:
  - Should be at least from one code owner
  - This flow is used to to merge features, improvements and fixes that should be tested in stating environment

1 approval is required to be able to merge your PR into master:
  - Should be done by a code owner
  - This flow is normally used to merge hot-fixes into master

Auto-merger:
When this is turned on, makes the PR being automatically merged into release branch when passed all the checks

WIP Tag:
  - This is useful to not run the checks, to notice other developers that you are doing changes to code, and to declare that your code is not able to be merged
