#!/usr/bin/env perl

=pod

=head1 Using the script for create services objects for Check Point dbedit
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
#		create tcp_service  tcp_111
#		modify services tcp_111 port 111
#		create tcp_service  tcp_1025
#		modify services tcp_1025 port 1025
#		create udp_service udp_111
#		modify services udp_111 port 111
#		create udp_service udp_1025
#		modify services udp_1025 port 1025
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
=cut

use strict;
use warnings;
use v5.14;
use utf8;

# Result outFile for dbedit
my $outFile = 'services_objects.txt';

my $protocol;
my $createService = "create $protocol_service";
my $modifyServices = "modify services ";
my $portCmd = "port";

# Open result outFile for writing
open( FHW, '>', $outFile ) or die "Couldn't Open file $outFile" . "$!\n";

while ( defined( my $line = <> ) ) {
    chomp($line);
    $line =~ /^(\d+)\/(tcp)$/;
    my $port = $1;
    my $protocol =$2;
    say FHW "$createService" . " . "$protocol" . "_" . "$port";
    say FHW "$modifyServices" . "$protocol" . "_" . "$port" . "$portCmd" . "$port";
}

# Close the filehandles
close(FHW) or die "$!\n";

say "**********************************************************************************\n";
say "Network objects TXT file: $outFile created successfully!";

my $cpUsage = <<__USAGE__;

***************************************************************************************
* # Create a TCP service 
* create tcp_service tcp_8081
* # Set port 8081 for TCP service
* modify services tcp_8081 port 8081
*
* # Create a UDP service
* create udp_service udp_8082
* # Set port 8082 for UDP service 
* modify services udp_8082 port 8082
*
* # Create a service of type ""other."" This can be used for random IP protocols
* # as well as services that require more complex INSPECT code for matching.
*
* # Create the service of type other
* create other_service inspect_svc
* # Modify the IP Protocol that matches the service
* modify services inspect_svc protocol 6
* # (Optional) Modify the INSPECT expression that matches this service.
* modify services inspect_svc exp ""dport=123”
* 
* update_all
* savedb    								
*					
***************************************************************************************

__USAGE__

say $cpUsage;

