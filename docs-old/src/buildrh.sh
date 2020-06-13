#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
{
  rimraf .cache dist && \
  yarn build && \

  fn=d5038f03b73d97e967f3012ad5cb2884.js && \
  grep $fn dist/index.html && \
  cs=$(sha1sum dist/$fn) && \
  set -- $cs && \
  sed -i "s/${fn}/${fn}?bst=${1}/g" dist/index.html && \

  fn=72fc3d4628ee09039c8c64d588033ae4.css && \
  grep $fn dist/index.html && \
  cs=$(sha1sum dist/$fn) && \
  set -- $cs && \
  sed -i "s/${fn}/${fn}?bst=${1}/g" dist/index.html && \

  find .. -maxdepth 1 -type f -not -name 'navigation.json' -delete && \
  cp dist/* .. && \
  rsync -aP --delete --exclude='.git/' --exclude='.cache/' --exclude='dist/' --exclude node_modules /var/www/gundocs/gun-site/docs/ /media/sf_gundocs/gun-site/docs && \

  echo -e "${GREEN}=== Success ===${NC}"
}  || {
  echo -e "${RED}!!!!!!!!!! Error !!!!!!!!!!${NC}"
}

#  cp 301/* .. && \
