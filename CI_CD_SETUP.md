# GitHub Actions CI/CD Setup for Kanban App

## Overview
This project uses GitHub Actions to automate testing, code analysis, and APK building.

## Workflow File
📁 `.github/workflows/flutter-ci.yml`

## What Happens on Every Push

### 1. **Test Job** ✅
- Runs on: Ubuntu Latest
- Steps:
  - Checkout code
  - Setup Flutter SDK
  - Get dependencies (`flutter pub get`)
  - Run build_runner
  - Run all tests with coverage (`flutter test --coverage`)
  - Upload coverage to Codecov

### 2. **Analyze Job** 📊
- Runs on: Ubuntu Latest
- Steps:
  - Checkout code
  - Setup Flutter SDK
  - Get dependencies
  - Run `flutter analyze` (lint checks)
  - Check code formatting with `flutter format`

### 3. **Build Job** 🏗️
- Runs on: Ubuntu Latest
- **Only runs if** Test and Analyze jobs pass
- Steps:
  - Checkout code
  - Setup Flutter SDK
  - Get dependencies
  - Run build_runner
  - Build release APK (`flutter build apk --release`)
  - Upload APK as artifact (downloadable from Actions)

### 4. **Notify Job** 📢
- Runs on: Ubuntu Latest
- **Runs after all jobs complete**
- Provides final status summary
- Fails if any job failed

## How to Enable CI/CD

### Step 1: Push Workflow File to GitHub
```bash
cd /Users/macbook/Projects/kanban_app
git add .github/workflows/flutter-ci.yml
git commit -m "Add GitHub Actions CI/CD workflow"
git push origin main
```

### Step 2: Verify in GitHub
1. Go to your GitHub repository
2. Click **Actions** tab
3. You should see **Flutter CI/CD** workflow listed
4. Each push will trigger the workflow automatically

### Step 3: Monitor Test Results
- Green ✅ = All checks passed
- Red ❌ = One or more checks failed
- Click on the workflow to see detailed logs

## Test Status Requirements

For the pipeline to pass, you need:
✅ All unit tests passing
✅ No lint/analyze errors (`flutter analyze`)
✅ Code properly formatted
✅ Build successfully

### Current Status
```
Tests: 75 passed, 5 failed
Status: ❌ FAILING
```

## Fix Failing Tests

Run locally to debug:
```bash
# Run specific test file
flutter test test/presentation/cubit/theme_cubit_test.dart

# Run all tests with verbose output
flutter test --verbose

# Run tests with coverage
flutter test --coverage

# Check what's failing
flutter test 2>&1 | grep "FAILED\|Error"
```

## GitHub Actions Secrets (Optional)

If you need API keys or credentials:
1. Go to GitHub repo → Settings → Secrets and variables → Actions
2. Add secrets like:
   - `TODOIST_API_KEY`
   - `SIGNING_KEY_STORE` (for signed APK)
3. Reference in workflow: `${{ secrets.TODOIST_API_KEY }}`

## Artifacts

After a successful build, download the APK:
1. Go to Actions → Latest workflow run
2. Scroll down to **Artifacts**
3. Download `kanban-app-release.apk`

## Environment Variables (if needed)

Add to workflow for build customization:
```yaml
env:
  FLUTTER_VERSION: '3.16.0'
  JAVA_VERSION: '17'
```

## Integration with Git Hooks (Optional)

Run tests locally before pushing:
```bash
# Create pre-push hook
cat > .git/hooks/pre-push << 'EOF'
#!/bin/bash
echo "Running tests before push..."
flutter test --coverage
if [ $? -ne 0 ]; then
  echo "Tests failed! Push cancelled."
  exit 1
fi
EOF

chmod +x .git/hooks/pre-push
```

## Troubleshooting

### Tests fail in CI but pass locally
- Ensure Flutter version matches in CI (3.16.0)
- Run `flutter clean` locally and retry
- Check for environment-specific issues

### Build fails in CI
- Check build_runner output: `flutter pub run build_runner build --delete-conflicting-outputs`
- Ensure all dependencies are in `pubspec.yaml`
- Check for Dart SDK version mismatches

### Codecov upload fails
- This is non-critical (fail_ci_if_error: false)
- Coverage still gets collected locally

## Branch Protection Rules (Recommended)

Configure in GitHub:
1. Go to Settings → Branches → Branch protection rules
2. Add rule for `main`:
   - ✅ Require status checks to pass (select: test, analyze)
   - ✅ Require code reviews
   - ✅ Dismiss stale reviews
   - ✅ Require up-to-date branches

This prevents merging until CI passes.

## Next Steps

1. ✅ Create `.github/workflows/flutter-ci.yml`
2. ✅ Push to GitHub
3. ⏳ Fix failing tests
4. 📊 Monitor in Actions tab
5. 🔐 (Optional) Add branch protection rules

## Resources

- [Flutter GitHub Actions](https://github.com/subosito/flutter-action)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [Codecov Setup](https://docs.codecov.io/docs/quick-start)
