---
  title: Installation
---

<%= youtube 'bXws8RnBsUU' %>

### How to install genomer

Genomer requires both [Ruby][] and [RubyGems][] to run. Fortunately both of
these are found on most recent Mac OSX or Linux systems. Test the installation
of these by running the following commands on the console or terminal
(excluding the ``$`` sign):

[Ruby]: http://www.ruby-lang.org/
[RubyGems]: http://rubygems.org/

    $ ruby -v
    $ gem -v

If both of these return without error then both Ruby and RubyGems are
installed. If either of these are missing then they need to be installed to use
genomer. [This guide][guide] provides examples of installing Ruby and RubyGems
on several different systems. Once installed run the following command to
ensure that RubyGems is installed to the latest version.

[guide]: http://docs.cloudfoundry.com/frameworks/ruby/installing-ruby.html

    $ sudo gem update --system

Then install genomer with the following command:

    $ gem install genomer

Genomer can be tested by running the following command. This should print a
short genomer help command. 

    $ genomer

If any of steps fail when installing genomer please check the [troubleshooting
page for installing.][trouble]

[trouble]: /troubleshooting#install
