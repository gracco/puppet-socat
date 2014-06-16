# == Class: socat
#
# Define and configure a socat service to confirure a Linux system 
# to act as a TCP port forwarder without using a firewall.
# 

class socat {
	
	package { 'socat' :  
      ensure => installed,
  }

}
