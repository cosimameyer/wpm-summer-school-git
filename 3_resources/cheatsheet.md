# Git Cheat Sheet — the afternoon on one page

Git is a **time machine for your code**. A **commit** is a labelled save point. **GitHub** is the
cloud copy you share and back up to. Six commands do almost everything.

## The mental model

```
   YOUR LAPTOP                                          GITHUB
   Working dir  →  Staging  →  Local repo   ── push ──→  Remote
   (your files)    (git add)   (git commit)  ←─ pull ──   (origin)
```
Edit → `add` (choose what to include) → `commit` (snapshot) → `push` (send up) → `pull` (get others').

![](slides/img/git9-cheatsheet.jpg)

## The six commands you'll actually use

| Command | What it does |
|---|---|
| `git status` | **Run this constantly.** Shows what changed and what's staged. |
| `git add <file>` | Stage a file for the next snapshot. `git add .` = everything. |
| `git commit -m "message"` | Take the snapshot with a message. |
| `git push` | Send your commits up to GitHub. |
| `git pull` | Get everyone else's commits down. **Do this before you push.** |
| `git checkout <branch>` | Move to another branch. `git checkout -b <name>` = create + move. |

## Getting started with a repo

```bash
git clone https://github.com/<username>/<repo>.git   # download a repo + its history
cd <repo>
git remote -v                     # check it's wired to GitHub ("origin")
```
Starting from a local folder instead? `git init` inside it turns it into a repo.

> **First `git push`?** Git asks to log in: **Username** = your GitHub name, **Password** = **paste
> your Personal Access Token** (not your GitHub password — it won't show as you type). It's saved after that.

## The everyday loop

```bash
git status                        # what changed?
git add .                         # stage it
git commit -m "Add year filter to cleaning script"
git pull                          # grab others' work first
git push                          # send yours up
```

## Good commit messages

Imperative mood, specific, small. Finish the sentence "This commit will…":
- ❌ `"stuff"` · `"fixed"` · `"asdf"`
- ✅ `"Fix year filter dropping 2020 observations"` · `"Add descriptive stats for Ch. 3"`
- ✨ Nice-to-have: start it with a short label — `feat:` new feature, `fix:` bug fix, `doc:` docs,
  `test:` tests. Like `"feat: Add descriptive stats for Ch. 3"`. Optional flourish, not a rule.

## Branches = growing trees 🌳

`main` is the trunk. A branch is a limb where you try things without breaking the trunk.

![](slides/img/branch10-cheatsheet.jpg)

```bash
git checkout -b feature/my-analysis   # grow a new limb
# ...edit, add, commit...
git push -u origin feature/my-analysis   # publish the branch (first time)
```
Then on GitHub: open a **Pull Request** → describe what & why → review → **Merge** into `main`.
Afterwards, back on your machine: `git checkout main` then `git pull`.
> You may also see the newer `git switch` / `git switch -c` — same thing; we use `checkout` as it's more common.

## Merge conflicts = Git being honest, not broken

Two branches changed the **same line**, and Git refuses to silently pick a winner — it stops and asks *you*. You'll see:
```
<<<<<<< HEAD
your version of the line
=======
the incoming version
>>>>>>> other-branch
```
**Fix it:** delete the `<<<<<<<`, `=======`, `>>>>>>>` markers, keep the line you want (or blend
both), then:
```bash
git add <file>
git commit -m "fix: Solve merge conflict"   # or: git commit --no-edit (keeps the default message)
git push
```

## `.gitignore` — protect your data & secrets (do this first!)

Create a file named `.gitignore` in the repo root listing what Git must **never** track:
```
.Renviron          # API keys / secrets — never commit
.Rproj.user/
.Rhistory
data/raw/          # sensitive / large data
*.csv
*.rds
*.dta
.DS_Store
```
⚠️ `.gitignore` only stops *future* tracking. If a secret is already committed, rotate it and get
help removing it from history.

## Undo / rescue

| I want to… | Command |
|---|---|
| Unstage a file (keep the edit) | `git restore --staged <file>` |
| Throw away uncommitted edits to a file | `git restore <file>` ⚠️ can't undo |
| See history | `git log --oneline` |
| See what's in the last commit | `git show HEAD` |
| See exactly what I changed | `git diff` |

## When it breaks

| Symptom | Do this |
|---|---|
| `not a git repository` | `cd` into the repo folder |
| push rejected, "fetch first" | `git pull`, then `git push` |
| `Please tell me who you are` | set `git config --global user.name/user.email` |
| `Authentication failed` | You typed your password — paste your **token** instead |
| conflict markers in a file | remove markers, `git add`, `git commit` |
| totally lost | `git status` — it almost always tells you the next step |

## Learn more

- **Happy Git and GitHub for the useR** — <https://happygitwithr.com>
- Atlassian Git tutorials — <https://www.atlassian.com/git/tutorials>
- GitHub docs — <https://docs.github.com/en/get-started>

---

© 2026 Cosima Meyer · [cosimameyer.com](https://cosimameyer.com) · 
[CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
