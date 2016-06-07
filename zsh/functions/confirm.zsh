confirm()
{
 local resp
 while true
 do
   echo -n "$* [y/n]"
   read resp
   case $resp
     in
     [yY])
       return 0
       ;;
     [nN])
       return 1
       ;;
     *)
       echo "Please enter y or n"
   esac
 done
}

