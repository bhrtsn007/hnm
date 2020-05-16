#!/bin/bash
station_help () {
    echo "Station recovery Help"
    echo "<br>"
    echo '<pre>'
    sudo /opt/butler_server/bin/butler_server rpcterms station_recovery help
    echo '</pre>'
}
echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Station recovery help</title>'
echo '</head>'
echo '<body style="background-color:#B8B8B8">'

echo '<img src="https://scmtech.in/assets/images/grey.png" style="position:fixed; TOP:5px; LEFT:850px; WIDTH:400px; HEIGHT:80px;"></img>'
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"

station_help   
     
echo '</body>'
echo '</html>'

exit 0
