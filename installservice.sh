echo "[Unit]
Description=Digital Wellbing Timer
StartLimitIntervalSec=0
[Service]
Type=simple
Restart=always
RestartSec=1
ExecStart=bash -c 'su - $(logname) && cd $PWD && $PWD/service.sh'

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/digitalwellbing.service
