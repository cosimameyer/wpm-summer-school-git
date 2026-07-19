# Collaborative Exercise — step by step

Follow along. Replace `<your-name>` with your name (no spaces — use a hyphen, e.g. `dario-r`).

---

## Part 0 — Accept the invite & clone (once)

1. Check your email (or <https://github.com/notifications>) for a repo invitation and **accept** it.
2. In Positron's terminal (**View → Terminal**):

```bash
cd ~                                    # or wherever you keep projects
git clone https://github.com/cosimameyer/wpm-summer-school-git.git
cd wpm-summer-school-git
```

> ❓ Clone says "not found" or asks for a login you can't complete? You probably haven't accepted the
> invite yet. Do that, then retry.

---

## Part 1 — The happy path: add your function → Pull Request

**1. Grow your own branch:**
```bash
git checkout -b feature/<your-name>
```

**2. Create your function file.** Copy the template and edit it in Positron's editor:
```bash
cp functions/EXAMPLE.R functions/<your-name>.R
```
Open `functions/<your-name>.R`. Personalise the comment (your name + one line about your research),
and if you like, tweak the little function. It doesn't have to be clever — a one-liner you'd
actually use is perfect. Save.

**3. Snapshot and publish your branch:**
```bash
git add functions/<your-name>.R
git commit -m "Add helper function for <your-name>"
git push -u origin feature/<your-name>
```

**4. Open a Pull Request:**
- Go to the repo on GitHub. Click the **"Compare & pull request"** banner.
- Write a one-line description (e.g. "Add my intro"). Click **Create pull request**.

**5. Review your pair's PR.** Swap: find your partner's PR on GitHub, leave **one comment** on a
line, then click **Approve**. This is the part that makes a PR different from just pushing —
someone else actually looked at it.

**6. Watch merges land.** Your instructor will merge the approved PRs live. Once yours (or others')
is merged, get everyone's work onto your machine:
```bash
git checkout main
git pull
```
Look in `functions/` — your classmates' functions appeared. 🎉 That's collaboration: separate files,
no conflicts, everyone's work combined automatically.

---

## Part 2 — A deliberate merge conflict

Now we all touch the **same line** on purpose. Your instructor will pair you up and tell you **which
country line** of `country_names.R` your pair owns (e.g. Pair A → the `"USA"` line).

**1. Start fresh from the latest main:**
```bash
git checkout main
git pull
git checkout -b conflict/<your-name>
```

**2. Edit your assigned line** in `country_names.R` — replace the `___` with the full country name
*you* would use. Both people in your pair edit the **same** line, and you'll each pick a slightly
different name (e.g. `"United States"` vs `"United States of America"`). That disagreement is the
whole point. Save.

**3. Commit and push:**
```bash
git add country_names.R
git commit -m "Fill in country name for <your-name>"
git push -u origin conflict/<your-name>
```

**4. Open a PR each.** The **first** person's PR merges cleanly. The **second** person's PR will show
**"This branch has conflicts that must be resolved."** That's the honest bit — Git won't guess.

**5. Resolve the conflict** (second person). Bring main's new version into your branch and fix it:
```bash
git checkout conflict/<your-name>
git pull origin main            # this triggers the conflict locally
```
Open `country_names.R`. You'll see something like:
```
<<<<<<< HEAD
  "USA"  = "United States",       # your version
=======
  "USA"  = "United States of America",   # your pair-partner's, already in main
>>>>>>> main
```
Delete the `<<<<<<<`, `=======`, and `>>>>>>>` lines, and keep **one** line you both agree on (talk
to your partner — that conversation *is* conflict resolution). Save. Then:
```bash
git add country_names.R
git commit -m "fix: Solve merge conflict"     # or: git commit --no-edit (keeps the default message)
git push
```
Refresh your PR — the conflict is gone and it can merge. **You just resolved a real merge
conflict.** 💪

---

## Part 3 — Test things out

Try any of these in the shared repo — you can't break anything permanently:

- Review a *different* classmate's PR too — comment, or **request changes** this time instead of approving.
- Make a branch, decide you don't want it, and delete it: `git branch -d <branch>`.
- Create a *second* conflict on purpose and resolve it solo.
- Run `git log --oneline --graph --all` and admire the tree you all grew. 🌳