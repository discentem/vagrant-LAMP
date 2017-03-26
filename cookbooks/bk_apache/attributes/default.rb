default["bk_apache"]["sites"] = {
  "Database_Programming" => {
    "port" => 80,
    "servername" => "bsk.com",
    "serveradmin" => "kurtz.brandon@gmail.com"
  }
}

default["bk_apache"]["apache2.config"]["_extra_keys"] = {
  'KeepAlive' => 'Off'
}
