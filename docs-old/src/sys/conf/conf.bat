SET sys_dev_title=GUN_Docs_dev
SET sys_dev_title_cons1=GunDocsConsole
SET sys_dev_title_cons2=GunDocsWatcher
SET sys_dev_sync_port=51086
SET sys_dev_box_sys_dir=/vagrant/docs/src/sys

SET sys_dev_screen1_cmd=echo \"$(tput clear)\" ; ^
echo \"===============================\" ; ^
echo \"To re-run parcel dev server do:\" ; ^
echo \"$(tput setaf 3)# yarn dev$(tput sgr0)\" ; ^
echo \"To visit the dev site:\" ; ^
echo \"$(tput setaf 3)http://127.0.0.1:51085$(tput sgr0)\" ; ^
echo \"===============================\" ; ^
echo ; ^
cd /_vagrant/docs/src ; ^
yarn dev
