#!/bin/bash

shopt -s extglob

cd "$(dirname "$0")"

cat << EOF > toxcore.sh
#!/bin/bash

class BashToxcore BASHBinding
  public:
EOF

FOUND=0

while read line; do
  line="${line/\#*}"
  line="${line/%*( )}"
  line="${line/#*( )}"
  [ -z "$line" ] && continue
  if [[ "$line" == 'beginBinding:' ]]; then
    FOUND=1
    continue
  fi
  (( FOUND == 0 )) && continue

  funcName="${line/%*( )(*}"
  funcName="${funcName/#* *(\*)}"

  echo "    :: $funcName"
done >> toxcore.sh < bind.def

cat << EOF >> toxcore.sh
ssalc
EOF
