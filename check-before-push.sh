#!/bin/bash

# Kanban App - Local Testing Before Push
# Run this script before pushing to ensure CI won't fail

echo "🚀 Running pre-push checks..."

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Counter
FAILED=0

# 1. Get dependencies
echo -e "${YELLOW}1️⃣  Getting dependencies...${NC}"
flutter pub get
if [ $? -ne 0 ]; then
  echo -e "${RED}❌ Failed to get dependencies${NC}"
  FAILED=$((FAILED+1))
fi

# 2. Run build_runner
echo -e "${YELLOW}2️⃣  Running build_runner...${NC}"
flutter pub run build_runner build --delete-conflicting-outputs
if [ $? -ne 0 ]; then
  echo -e "${RED}❌ Build runner failed${NC}"
  FAILED=$((FAILED+1))
fi

# 3. Analyze code
echo -e "${YELLOW}3️⃣  Analyzing code...${NC}"
flutter analyze
if [ $? -ne 0 ]; then
  echo -e "${RED}❌ Code analysis failed${NC}"
  FAILED=$((FAILED+1))
fi

# 4. Check formatting
echo -e "${YELLOW}4️⃣  Checking code format...${NC}"
flutter format --set-exit-if-changed --dry-run lib/ test/
if [ $? -ne 0 ]; then
  echo -e "${RED}❌ Code formatting issues found${NC}"
  echo "Run: flutter format lib/ test/"
  FAILED=$((FAILED+1))
fi

# 5. Run tests
echo -e "${YELLOW}5️⃣  Running tests...${NC}"
flutter test
if [ $? -ne 0 ]; then
  echo -e "${RED}❌ Tests failed${NC}"
  FAILED=$((FAILED+1))
fi

# Summary
echo ""
echo "════════════════════════════════════════"
if [ $FAILED -eq 0 ]; then
  echo -e "${GREEN}✅ All checks passed! Safe to push.${NC}"
  exit 0
else
  echo -e "${RED}❌ $FAILED check(s) failed. Fix before pushing.${NC}"
  exit 1
fi
