#!/usr/bin/env bash
set -euo pipefail

APP_ROOT="/var/www/html"
TPL="/opt/templates/dba.php.tpl"
OUT="$APP_ROOT/support/dba.php"

for d in smartyfolders languages/locale support; do
  if [ -d "$APP_ROOT/$d" ]; then
    chown -R www-data:www-data "$APP_ROOT/$d" || true
    chmod -R u+rwX,g+rwX "$APP_ROOT/$d" || true
  fi
done

: "${SQ_FORCE_DBA_TEMPLATE:=false}"

should_render="false"
if [ ! -f "$OUT" ]; then
  should_render="true"
fi

case "$(echo "$SQ_FORCE_DBA_TEMPLATE" | tr '[:upper:]' '[:lower:]')" in
  1|true|yes|on) should_render="true" ;;
esac

if [ "$should_render" = "true" ] && [ -f "$TPL" ]; then
  : "${SQ_DB_HOST:=db}"
  : "${SQ_DB_NAME:=tlv}"
  : "${SQ_DB_PORT:=3306}"
  : "${SQ_DB_USER:=tlvUser}"
  : "${SQ_DB_PASS:=tlvUser}"
  : "${SQ_SQLITE_PATH:=/var/www/html/support/sqlite_db.sq3}"
  : "${SQ_USE_REGISTRATION:=false}"
  : "${SQ_USE_PRETTY_URLS:=true}"

  php -r '
    $tplPath = "'"$TPL"'";
    $outPath = "'"$OUT"'";

    if (!$tplPath || !$outPath) {
      fwrite(STDERR, "Template or output path missing\n");
      exit(1);
    }

    $tpl = file_get_contents($tplPath);

    $bool = function($v, $default) {
      if ($v === false || $v === null || $v === "") return $default;
      $v = strtolower(trim($v));
      if (in_array($v, ["1","true","yes","on"], true)) return "true";
      if (in_array($v, ["0","false","no","off"], true)) return "false";
      return $default;
    };

    $repl = [
      "{{DB_HOST}}"         => getenv("SQ_DB_HOST") ?: "db",
      "{{DB_NAME}}"         => getenv("SQ_DB_NAME") ?: "tlv",
      "{{DB_PORT}}"         => getenv("SQ_DB_PORT") ?: "3306",
      "{{DB_USER}}"         => getenv("SQ_DB_USER") ?: "tlvUser",
      "{{DB_PASS}}"         => getenv("SQ_DB_PASS") ?: "tlvUser",
      "{{SQLITE_PATH}}"     => getenv("SQ_SQLITE_PATH") ?: "/var/www/html/support/sqlite_db.sq3",
      "{{USE_REGISTRATION}}" => $bool(getenv("SQ_USE_REGISTRATION"), "false"),
      "{{USE_PRETTY_URLS}}"  => $bool(getenv("SQ_USE_PRETTY_URLS"), "true"),
    ];

    file_put_contents($outPath, strtr($tpl, $repl));
  '

  chown www-data:www-data "$OUT" || true
  chmod 640 "$OUT" || true
fi

exec "$@"
