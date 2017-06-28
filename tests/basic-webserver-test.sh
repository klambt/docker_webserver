#!/usr/bin/env bats

@test "/ (HTTP Code 200)" {
  result="$(curl -LI http://webserver -o /dev/null -w '%{http_code}\n' -s)"
  [ "$result" -eq 200 ]
}

@test "/server-status (HTTP Code 403)" {
  result="$(curl -LI http://webserver/server-status -o /dev/null -w '%{http_code}\n' -s)"
  [ "$result" -eq 403 ]
}

#@test "Apache ServerSignature (Prod)" {
#  run bash -c "curl -s -LI http://webserver/ | grep 'Server:' | grep -v 'Ubuntu'"
#  [[ ${lines[0]} =~ "Server: Apache" ]]
#}


