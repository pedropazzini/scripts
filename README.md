This bash script is suposed to be used to download the image of the day on the bing WebSite.

Make sure that the following folders exist:
local_folder='/usr/bin/scripts/papel_de_parede/'
pasta_destino='/root/imagens/bing/'

Otherwise you could create the folders or edit the script to fit your system.

You could also change the bing's url to your region. The script was written to download the image of the brazilian version of bing. To do so edit the following line:
site='http://br.bing.com'
For more info about bing's region: http://www.bing.com/account/worldwide

To check for new images evry hour, the following line should be added to the crontab of the root user:
00 * * * * /usr/bin/scripts/papel_de_parede/papel_de_parede.sh >> /usr/bin/scripts/papel_de_parede/papel_de_parede.log 2>&1

This could be done with the command:
#crontab -e
More info about crontab and the syntax http://www.adminschoice.com/crontab-quick-reference/

After downloading the script the image could be used to change the desktop image periodically or in every login, and also to be send thru email.
