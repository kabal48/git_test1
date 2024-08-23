#!/bin/bash
get_size() {
    local path="$1"
    local size=$(du -h -s "$path" 2>/dev/null | cut -f1)
    echo $size
}

list=$(ls -A)
for item in $list; do
    size=$(get_size "$item")
    result+=("$size $item")
done
printf "%s\n" "${result[@]}" | sort -rh | column -t