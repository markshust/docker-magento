#!/usr/bin/env bash
# Shared helpers for reading compose/lib/versions.tsv.
#
# Source this file with:
#   . "$(dirname "$0")/../lib/versions.sh"
#
# Exported helpers:
#   versions_tsv_path                       — absolute path to versions.tsv
#   versions_lookup <edition> <version>     — prints a TAB-separated row
#                                             "php<TAB>opensearch<TAB>nginx<TAB>db<TAB>rabbitmq<TAB>cache<TAB>composer"
#                                             on stdout, or returns 1 if no row matches.
#   versions_prefix_match <prefix> <version> — returns 0 if `<prefix>` is a
#                                              boundary-aware prefix of `<version>`.

versions_tsv_path() {
  local script_dir
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  printf '%s\n' "$script_dir/versions.tsv"
}

# Boundary-aware prefix match. Returns 0 if `version` starts with `prefix`
# AND the next character is either end-of-string, `.`, or `-`. This makes
# prefix "2.4.9" match "2.4.9", "2.4.9-p1", and "2.4.9.0" but NOT "2.4.91".
# Prefix "1" matches "1.0.5" and "1.3.1" but NOT "10.0.0".
versions_prefix_match() {
  local prefix="$1"
  local version="$2"
  case "$version" in
    "$prefix"|"$prefix".*|"$prefix"-*) return 0 ;;
    *) return 1 ;;
  esac
}

# Print the matching row's service columns (tab-separated) on stdout.
# Returns 1 if no row matches, with no output. Rows are scanned top-to-bottom;
# the first match wins, so the TSV should keep more-specific prefixes above
# less-specific ones.
versions_lookup() {
  local edition="$1"
  local version="$2"
  local tsv
  tsv="$(versions_tsv_path)"

  [ -f "$tsv" ] || return 1
  [ -n "$edition" ] || return 1
  [ -n "$version" ] || return 1

  local row_edition row_prefix php os nginx db rmq cache composer
  while IFS=$'\t' read -r row_edition row_prefix php os nginx db rmq cache composer; do
    # Skip comments and blank lines.
    case "$row_edition" in
      ''|'#'*) continue ;;
    esac
    if [ "$row_edition" = "$edition" ] && versions_prefix_match "$row_prefix" "$version"; then
      printf '%s\t%s\t%s\t%s\t%s\t%s\t%s\n' "$php" "$os" "$nginx" "$db" "$rmq" "$cache" "$composer"
      return 0
    fi
  done < "$tsv"

  return 1
}
