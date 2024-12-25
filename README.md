dns_incrementor
===============

I got really sick of incrementing the DNS serial. So I made this.

It replaces your zone serial in YYYYmmddxx (xx being the version for the day) with the latest date and resets the version counter if necessary

Installation
------------

`gem install dns_incrementor`

Usage
-----

`dns_incrementor example.zone`

Bugs
----

It will overflow the serial if you make more than 100 revisions in a day (eg. 2014123199 -> 20141231100). If you need to make more than 100 revisions a day, then either you're doing something wrong or you've got enough going on that maybe this script isn't for you.
