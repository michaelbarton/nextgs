---
  title: Installation
---

<%= youtube 'bXws8RnBsUU' %>

### How to install genomer

Genomer requires both [Ruby][] and [RubyGems][] to run. Fortunately these are
usually installed on recent Mac OSX or Linux systems, and can be installed easy
otherwise. First test the presence of these by running the following commands
on the console or terminal (excluding the '$' sign):

[Ruby]: http://www.ruby-lang.org/
[RubyGems]: http://rubygems.org/

    $ ruby -v
    $ gem -v

If both of these return without error then both ruby and ruby gems are
installed. If either of these are present then install the missing components,
[this guide][guide] provides an example. Once installed run the following
command to install genomer.

[guide]: http://docs.cloudfoundry.com/frameworks/ruby/installing-ruby.html

    $ gem install genomer

The install can be tests by running the following command. This should print
the list of available gnomer options.

    $ genomer

If this fails or returns an error the RubyGems executable directory may not be
in your shell path. The location of this can found using the following command,
the result of which should be added to the $PATH variable in your shell login
script. Examples of updating the shell path are available [for OS X][osx_path]
and [for Linux][linux_path]

[osx_path]: http://stackoverflow.com/questions/135688/setting-environment-variables-in-os-x
[linux_path]: http://www.troubleshooters.com/linux/prepostpath.htm

    # Add the output of this your $PATH
    $ gem env | grep "EXECUTABLE DIRECTORY" | cut -d : -f 2
