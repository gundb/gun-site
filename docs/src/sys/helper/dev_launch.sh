CMD1="
echo 'force_color_prompt=yes' >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
source /home/vagrant/.bashrc
$3
"
SCR1="
if ! screen -list | grep -q 'devscr'; then
  screen -dmS devscr bash -c 'bash --login'
  screen -S devscr -p 0 -X stuff '$CMD1'
  screen -r devscr
else
  screen -d -r devscr
fi
"

CMD2="
$2/helper/dev_trigger.sh $1
echo Done.
"
SCR2="
if ! screen -list | grep -q 'triggerscr'; then
  screen -dmS triggerscr bash -c 'bash --login'
  screen -S triggerscr -p 0 -X stuff '$CMD2'
fi
"

vagrant up ; vagrant ssh -- -t "$SCR2 $SCR1"