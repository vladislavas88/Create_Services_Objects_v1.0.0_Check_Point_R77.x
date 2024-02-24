 
Using the script for create services objects for Check Point dbedit
#===============================================================================
#
#       FILE: create_services_objects.pl
#
#       USAGE: $ touch ./in_net.txt
#		 111/tcp
#		 1025/tcp
#		 111/udp
#		 1025/udp
#		 etc
#
#		$ ./create_services_objects.pl in_services.txt
#
#		$ cat ./net_network_objects.txt
#		  create tcp_service  tcp_111
#		  modify services tcp_111 port 111
#		  create tcp_service  tcp_1025
#		  modify services tcp_1025 port 1025
#		  create udp_service udp_111
#		  modify services udp_111 port 111
#		  create udp_service udp_1025
#		  modify services udp_1025 port 1025
#		
#  DESCRIPTION: Create network objects for Check Point dbedit
#
#      OPTIONS: ---
# REQUIREMENTS: Perl v5.14+ 
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Vladislav Sapunov 
# ORGANIZATION:
#      VERSION: 1.0.0
#      CREATED: 23.01.2024 22:48:36
#     REVISION: ---
#===============================================================================
