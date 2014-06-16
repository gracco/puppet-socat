node 'node-test.acme' {

include socat
    socat::profile{ 'name' :
     port_listen                  => 'system port',
     address_bind                 => 'system address',
     port_bind                    => 'bind port',
  }


}

