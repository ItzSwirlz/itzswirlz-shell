#!/usr/bin/perl
#
# ItzSwirlz Shell (c) Joshua Peisach 2020
# Contact Email: itzswirlz2020@outlook.com
# ---------------------------------------------------------------
# This is a shell for ItzSwirlz, but you may use it
# however you want for your own personal needs.
#
# This software is licensed under the GNU Public License V3.
# You may open issues, pull requests, or create forks at the
# GitHub repository at:
# https://github.com/ItzSwirlz/itzswirlz-shell
#
#
# ItzSwirlz Shell: File Description
# This file contains the main overall script for the shell.
# This is basically the thing that will let you type in commands
# and will actually execute them.
# ---------------------------------------------------------------

use Cwd;

sub start {
  print "ItzSwirlz Shell v0.1~devel (c) GPL v3 Joshua Peisach 2020\n";
  print "Welcome to the ItzSwirlz Shell!\n";
}

sub startStatistics {
  print "OS Statistics:\n";
  system("neofetch | lolcat");
}

sub getDateTime {
  # TODO: Print date/time.
  # This will be shown before main loop begins.
  $date = "YYYY-MM-DD HH:MM:SS ZZZZ"
}

sub main {
  # The infinite loop that does everything.
  $USER = $ENV{USER};
  $CURRENTDIR = getcwd;
  print "[$USER] $CURRENTDIR: ";
  $cmd = <STDIN>;
  chop($cmd);

  $cdcmd = "cd ";

  if (index($cmd, $cdcmd) != -1) {
    $cmd =~ s/^\S+\s*//;
    chdir($cmd);
    main();
  }

  if($cmd eq "") {
    main();
  } elsif($cmd eq "cd") {
    chdir($ENV{OLDPWD});
    main();
  } else {
    system("$cmd | lolcat");
  }
  main();
}

start();
startStatistics();
main();
