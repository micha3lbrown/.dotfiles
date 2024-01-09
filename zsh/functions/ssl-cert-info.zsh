ssl-cert-info()
{
  fqdn=$*
  echo | openssl s_client -showcerts -servername $fqdn -connect $fqdn 2>/dev/null | openssl x509 -inform pem -noout -text
}
