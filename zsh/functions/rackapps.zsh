rackapps () {
  local _dir=`pwd`
  case $1 in
    (start) cd ~/dev/core && bundle exec rackup -p 3001 -D -P /tmp/core_rackup.pid > /dev/null && echo "core started!"
      cd ~/dev/id && bundle exec rackup -p 3002 -D -P /tmp/id_rackup.pid > /dev/null && echo "id started!"
      # cd ~/dev/billing && bundle exec rackup -p 3004 -D -P /tmp/billing_rackup.pid > /dev/null && echo "billing started!" ;;
      ;;
    (stop) [[ -s /tmp/core_rackup.pid ]] && kill -s TERM `cat /tmp/core_rackup.pid` > /dev/null && echo "core stopped!"
      [[ -s /tmp/id_rackup.pid ]] && kill -s TERM `cat /tmp/id_rackup.pid` > /dev/null && echo "id stopped!"
      # [[ -s /tmp/billing_rackup.pid ]] && kill -s TERM `cat /tmp/billing_rackup.pid` > /dev/null && echo "billing stopped!" ;;
      ;;
    (restart) [[ -s /tmp/core_rackup.pid ]] && kill -s TERM `cat /tmp/core_rackup.pid` > /dev/null && echo "core stopped!"
      [[ -s /tmp/id_rackup.pid ]] && kill -s TERM `cat /tmp/id_rackup.pid` > /dev/null && echo "id stopped!"
      # [[ -s /tmp/billing_rackup.pid ]] && kill -s TERM `cat /tmp/billing_rackup.pid` > /dev/null && echo "billing stopped!"
      cd ~/dev/core && bundle exec rackup -p 3001 -D -P /tmp/core_rackup.pid > /dev/null && echo "core started!"
      cd ~/dev/id && bundle exec rackup -p 3002 -D -P /tmp/id_rackup.pid > /dev/null && echo "id started!"
      # cd ~/dev/billing && bundle exec rackup -p 3004 -D -P /tmp/billing_rackup.pid > /dev/null && echo "billing started!"
      touch ~/dev/core/tmp/restart.txt
      touch ~/dev/id/tmp/restart.txt
      # touch ~/dev/billing/tmp/restart.txt ;;
      ;;
    (touch) touch ~/dev/core/tmp/restart.txt && echo "core restarted"
      touch ~/dev/id/tmp/restart.txt && echo "id restarted"
      # touch ~/dev/billing/tmp/restart.txt && echo "billing restarted" ;;
      ;;
    (status) [[ -s /tmp/core_rackup.pid ]] && echo "core is running! pid: `cat /tmp/core_rackup.pid`"
      [[ -s /tmp/id_rackup.pid ]] && echo "id is running! pid: `cat /tmp/id_rackup.pid`"
      # [[ -s /tmp/billing_rackup.pid ]] && echo "billing is running! pid: `cat /tmp/billing_rackup.pid`" ;;
      ;;
    (*) echo "Usage: $0 {start|stop|restart|touch|status}" ;;
  esac
  cd $_dir
}
