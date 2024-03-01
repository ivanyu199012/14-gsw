[comment]: <> (Title: Script for Easy Git Branch Management)
[comment]: <> (Sub-title: Custom function which simplifies switching branch, create branch and branch navigation)

 This bash script aims to simplify your workflow within Git by offering a convenient way to manage branches.

# Setup
1. Download the script in https://github.com/ivanyu199012/14-gsw/blob/master/gsw.sh
2. Run `source gsw.sh` in the terminal of your linux machine,

# Feature

## 1. `gsw` --> Change git branch using no.
- Type `gsw` and it lists all available local branches and ask you to input the branch no., which you would like to switch to. Note that branch marked with * is your current branch.

```console
$ gsw
1.   master
2. * test-branch-1
3.   test-branch-2
4.   test-branch-3
5.   test-branch-4
6.   test-branch-5
Enter branch no.:
```

- Enter the branch no., e.g. `4` for `test-branch-3`, and press `enter`. Then it switches to the branch `test-branch-3`;

```console
$ gsw
1.   master
2. * test-branch-1
3.   test-branch-2
4.   test-branch-3
5.   test-branch-4
6.   test-branch-5
Enter branch no.: 4
Switched to branch 'test-branch-3'

$ git branch
  master
  test-branch-1
  test-branch-2
* test-branch-3
  test-branch-4
  test-branch-5
```

## 2. `gsw -m` --> Fast switch back to `master` branch
- use `gsw -m` to switch back to master branch directly

```console
$ gsw -m
Switched to branch 'master'

$ git branch
* master
  test-branch-1
  test-branch-2
  test-branch-3
  test-branch-4
  test-branch-5
```

## 3. `gsw -c <branch name>` --> create new branch
- use `gsw -c <branch name>` to create new branch

```console
$ gsw -c test-new-branch
Switched to a new branch 'test-new-branch'

$ git branch
  master
  test-branch-1
  test-branch-2
  test-branch-3
  test-branch-4
  test-branch-5
* test-new-branch
```

# Summary
| Command                | Description                                |
| :---------------------- | :------------------------------------------ |
| `gsw` + no.            | Change git branch using no.                |
| `gsw -m`               | Switch to `master` branch                  |
| `gsw -c <branch name>` | Create a branch with name `<branch name>` |

# Reason I wrote this blog
How do you switch git branch? Most of you may follow below steps:

1. Use `git branch` to list all the branches
2. Find your desired branch and copy the name
3. Type `git checkout` or  `git checkout` and then paste the name

Before developed this script, I did above steps a lot of times every day and found it very troublesome. I asked myself:
1. Why do I type 2 commands and use my mouse to copy the branch name for just switching branch?
2. Can I switch branch using number instead of name?

As a result, the script was made and hope that it can help you to streamline git branch management.🙂