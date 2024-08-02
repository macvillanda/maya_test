set -e
flutter test --coverage
echo "Generating html file test coverage"
genhtml coverage/lcov.info --output-directory coverage/html --show-details
