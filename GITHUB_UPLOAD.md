# Uploading BabyAdam to GitHub

This guide provides step-by-step instructions for uploading the BabyAdam project to your GitHub repository at https://github.com/ai-in-pm/babyadam.

## Prerequisites

1. Git installed on your local machine
2. GitHub account with access to the repository https://github.com/ai-in-pm/babyadam
3. Basic knowledge of Git commands

## Step 1: Initialize Git Repository (if not already done)

If the project is not already a Git repository, initialize it:

```bash
cd D:\CC-WorkingDir\babyadam\babyadam-main
git init
```

## Step 2: Configure Git User Information

Set your user information for commits:

```bash
git config user.name "Darrell Mesa"
git config user.email "darrell.mesa@pm-ss.org"
```

## Step 3: Add Remote Repository

Connect your local repository to the GitHub repository:

```bash
git remote add origin https://github.com/ai-in-pm/babyadam.git
```

If you already have a remote but need to change it:

```bash
git remote set-url origin https://github.com/ai-in-pm/babyadam.git
```

## Step 4: Add Files to Staging

Add all files to the staging area:

```bash
git add .
```

## Step 5: Commit Changes

Create your first commit:

```bash
git commit -m "Initial commit of BabyAdam project"
```

## Step 6: Push to GitHub

Push your code to the main branch on GitHub:

```bash
git push -u origin main
```

If the repository already has content and you need to force push (use with caution):

```bash
git push -u origin main --force
```

## Step 7: Verify Upload

1. Visit https://github.com/ai-in-pm/babyadam in your web browser
2. Confirm that all files have been uploaded correctly
3. Check that the README.md is displayed properly on the repository homepage

## Additional Information

### GitHub Actions

This repository includes GitHub Actions workflows in the `.github/workflows` directory. These workflows will automatically run tests and linting checks when you push code to the repository.

### Branch Protection

Consider setting up branch protection rules for the main branch:

1. Go to the repository settings
2. Navigate to "Branches"
3. Add a rule for the main branch
4. Enable options like "Require pull request reviews before merging" and "Require status checks to pass before merging"

### Issues and Pull Requests

The repository includes templates for issues and pull requests in the `.github` directory. These templates will guide contributors on how to properly format their submissions.

## Troubleshooting

### Authentication Issues

If you encounter authentication issues, consider using a personal access token or SSH key:

- [Creating a personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
- [Connecting with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

### Large Files

If you have large files that exceed GitHub's file size limits, consider using Git LFS:

- [Git Large File Storage](https://git-lfs.github.com/)

### Merge Conflicts

If you encounter merge conflicts when pushing:

1. Pull the latest changes: `git pull origin main`
2. Resolve any conflicts
3. Commit the resolved conflicts: `git commit -m "Resolve merge conflicts"`
4. Push again: `git push origin main`
