#!/usr/bin/env perl
use strict;
use utf8;

my $key = [
	{ 
	  "key" => [ "KEY_PREVIOUSSONG", "KEY_SCROLLUP" ],
	  "cmd" => "/usr/bin/mpc prev"
    },
	{ 
	  "key" => [ "KEY_NEXTSONG", "KEY_SCROLLDOWN" ],
	  "cmd" => "/usr/bin/mpc next"
    },
	{ 
	  "key" => [ "KEY_UP", "KEY_VOLUMEUP" ],
	  "cmd" => "/usr/bin/mpc volume +5"
    },
	{ 
	  "key" => [ "KEY_DOWN", "KEY_VOLUMEDOWN" ],
	  "cmd" => "/usr/bin/mpc volume -5"
    },
	{ 
	  "key" => [ "KEY_BACK", "KEY_LEFT" ],
	  "cmd" => "/usr/bin/mpc seek -5%"
    },
	{ 
	  "key" => [ "KEY_RIGHT", "KEY_FORWARD" ],
	  "cmd" => "/usr/bin/mpc seek +5%"
    },
	{ 
	  "key" => [ "KEY_PLAYPAUSE", "KEY_ENTER" ],
	  "cmd" => "/usr/bin/mpc toggle"
    },
	{ 
	  "key" => [ "KEY_STOP" ],
	  "cmd" => "/usr/bin/mpc stop"
    },
	{ 
	  "key" => [ "KEY_POWER" ],
	  "cmd" => "systemctl poweroff"
    },
	{ 
	  "key" => [ "KEY_SUSPEND" ],
	  "cmd" => "systemctl reboot -i"
    },
	{ 
	  "key" => [ "KEY_SWITCHVIDEOMODE" ],
	  "cmd" => "/usr/bin/mpc random"
    },
	{ 
	  "key" => [ "KEY_REFRESH" ],
	  "cmd" => "/usr/bin/mpcu"
    },
	{ 
	  "key" => [ "KEY_RED", "KEY_GREEN", "KEY_YELLOW", "KEY_BLUE" ],
	  "cmd" => "cp /boot/wlan0-default /boot/wlan0-config"
    },
];



foreach my $m ( @$key ) {
	foreach my $k ( @{$m->{"key"}} ) {
		print "begin\n";
		print "\tprog = irexec\n";
		print "\tbutton = $k\n";
		print "\tconfig = $m->{'cmd'}\n";
		print "\trepeat = 0\n";
		print "end\n";
	}
}

foreach my $k ( 0 .. 9 ) {
	print "begin\n";
	print "\tprog = irexec\n";
	print "\tbutton = KEY_$k\n";
	print "\tconfig = /usr/bin/mpc play $k\n";
	print "\trepeat = 0\n";
	print "end\n";
}
