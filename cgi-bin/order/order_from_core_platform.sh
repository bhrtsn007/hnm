#!/bin/bash
order_information () {
    order_id=`sshpass -p '9)MntJFsj(H7' ssh -o StrictHostKeyChecking=no -t gor@172.19.40.34 "/home/gor/test.sh $1 " | head -3 | tail -1 | grep -o '[[:digit:]]*'`
    echo "<br>"
    echo $order_id
    echo "<br>"
    echo "Order status from platform"
    echo '<pre>'
    sshpass -p '9)MntJFsj(H7' ssh -o StrictHostKeyChecking=no -t gor@172.19.40.34 "/home/gor/updated_status.sh $1 "
    echo '</pre>'
    echo "Status on Core"
    echo '<pre>'
    sudo /opt/butler_server/erts-9.3.3.6/bin/escript /home/gor/rpc_call.escript order_node get_by_id "[<<\"$order_id\">>]."
    echo '</pre>'
}
echo "Content-type: text/html"
echo ""

echo '<html>'
echo '<head>'
echo '<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">'
echo '<title>Get order status from core and platform</title>'
echo '</head>'
echo '<body style="background-color:#B8B8B8">'

echo '<img src="https://scmtech.in/assets/images/grey.png" style="position:fixed; TOP:5px; LEFT:850px; WIDTH:400px; HEIGHT:80px;"></img>'
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"
echo "<br>"

  echo "<form method=GET action=\"${SCRIPT}\">"\
       '<table nowrap>'\
          '<tr><td>External_Service_Request_ID</TD><TD><input type="number" name="External_Service_Request_ID" size=12></td></tr>'\
		  '</tr></table>'

  echo '<br><input type="submit" value="SUBMIT">'\
       '<input type="reset" value="Reset"></form>'

  # Make sure we have been invoked properly.

  if [ "$REQUEST_METHOD" != "GET" ]; then
        echo "<hr>Script Error:"\
             "<br>Usage error, cannot complete request, REQUEST_METHOD!=GET."\
             "<br>Check your FORM declaration and be sure to use METHOD=\"GET\".<hr>"
        exit 1
  fi

  # If no search arguments, exit gracefully now.
  echo "$QUERY_STRING<br>"
  echo "<br>"
  if [ -z "$QUERY_STRING" ]; then
        exit 0
  else
   # No looping this time, just extract the data you are looking for with sed:
     XX=`echo "$QUERY_STRING" | sed -r 's/([^0-9]*([0-9]*)){1}.*/\2/'`
	
     echo "External_Service_Request_ID: " $XX
     echo '<br>'
     order_information $XX 
  fi
echo '</body>'
echo '</html>'

exit 0
