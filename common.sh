
demon_setup() {

systemctl daemon-reload
systemctl enable $component
systemctl restart $component

}