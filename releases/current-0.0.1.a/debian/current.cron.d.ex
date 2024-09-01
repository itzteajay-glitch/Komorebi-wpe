#
# Regular cron jobs for the current package
#
0 4	* * *	root	[ -x /usr/bin/current_maintenance ] && /usr/bin/current_maintenance
