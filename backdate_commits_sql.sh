#!/bin/bash

# Define commit dates
DATES=("2025-01-05" "2025-01-09" "2025-01-03" "2025-01-13" "2025-01-15" "2025-01-19" "2025-02-03" "2025-02-15" "2025-02-23" "2025-03-08" "2025-03-09")

for DATE in "${DATES[@]}"
do
    echo "Backdated commit on $DATE" >> backdated_sql_changes.txt  # Add a dummy change
    git add .
    GIT_AUTHOR_DATE="$DATE 12:00:00" GIT_COMMITTER_DATE="$DATE 12:00:00" git commit -m "Backdated commit for $DATE in sql-main"
done

# Push all commits to GitHub
git push -u origin main

