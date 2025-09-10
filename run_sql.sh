#!/bin/bash

# ===========================
# 設定
# ===========================
CLOUD_SQL_PROXY="./cloud-sql-proxy"
CREDENTIALS_FILE="key.json"
INSTANCE="taido-competition:asia-northeast1:postgres-instance"
PG_USER="postgres"
PG_DB="postgres"

# SQL 実行フォルダ（taido-competition-record-main 配下の絶対パス）
SQL_FOLDERS=(
  "./data/2025_kita/static"
  "./data/2025_kita/original"
  "./data/2025_kita/test/static"
  "./data/2025_kita/test/original"
)

# ===========================
# Cloud SQL Proxy 起動
# ===========================
chmod +x "$CLOUD_SQL_PROXY"
echo "Starting Cloud SQL Proxy..."
"$CLOUD_SQL_PROXY" --credentials-file="$CREDENTIALS_FILE" "$INSTANCE" &
PROXY_PID=$!

# 少し待って接続準備
sleep 2

export PGPASSWORD="$PG_USER"

# ===========================
# SQL ファイル順番に実行
# ===========================
for FOLDER in "${SQL_FOLDERS[@]}"; do
  if [ -d "$FOLDER" ]; then
    if [ -f "$FOLDER/generate_tables.sql" ]; then
      echo "Running SQL in $FOLDER..."
      psql -h 127.0.0.1 -p 5432 -U "$PG_USER" -d "$PG_DB" -f "$FOLDER/generate_tables.sql"
    else
      echo "SQL file not found in $FOLDER, skipping."
    fi
  else
    echo "Folder $FOLDER does not exist, skipping."
  fi
done

# ===========================
# Cloud SQL Proxy 停止
# ===========================
echo "Stopping Cloud SQL Proxy..."
kill "$PROXY_PID"
wait "$PROXY_PID" 2>/dev/null

echo "All done."


