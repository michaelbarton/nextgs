---
  title: "Troubleshooting"
---

<%= anchor 'Installing genomer', 'install' %>

#### Command not found: ruby

This indicates Ruby is not installed on your system and should be installed to
use genomer. Please see the [this guide][guide] for examples of installing ruby
on your system.

[guide]: http://docs.cloudfoundry.com/frameworks/ruby/installing-ruby.html

#### Command not found: gem

RubyGems may not be installed on your system. Please see the above solution for
installing Ruby and RubyGems on your system.

#### ERROR: Failed to build gem native extension

This indicates gem files cannot be compiled for your system. This is usually a
Mac OSX problem and can be fixed by following the instructions for the [OSX GCC
Installer.](https://github.com/kennethreitz/osx-gcc-installer/) If you are
using Linux consider whether or not the build-essential package is installed.

#### WARNING:  Installing to ~/.gem since \[...\] aren't writable

The RubyGems home directory is not specified. To fix this add the following to
the file ``~/.profile``

    export GEM_HOME="$HOME/.gem"

Then run the following on the command line:

    source ~/.profile

#### ERROR: You don't have write permissions into the \[...\] directory.

RubyGems is trying to install genomer into a system directory. Generally
software should be installed on a per user basis. The solution above fixes this
by installing genomer to the user home directory. After follow this try
installing genomer again according to the [install instructions](/install).

#### Error installing genomer: requires RubyGems version >= 1.8.0

Genomer requires RubyGems 1.8.0 or later. The following command will install
the latest version of RubyGems.

    gem update --system

If this does not work try using the sudo command.

    sudo gem update --system

#### Command not found: genomer

If you have correctly installed genomer following the steps on the [install
page](/install) then the RubyGems ``bin`` directory may not be on your command
line path. Update the file ``~/.profile`` as follows: 

    export PATH="$PATH:$GEM_HOME/bin"

Then run the following on the command line:

    source ~/.profile

If this does not work check the location where RubyGems are being installed and
replace ``$GEM_HOME`` in the above line with this location.

<%= anchor 'Using genomer', 'using' %>

#### Unresolved specs during Gem::Specification.reset:

Try running the command

    gem cleanup NAME

Where NAME is the gem causing the warning. More details about this error can be
found on [a related stackoverflow
question](http://stackoverflow.com/questions/17936340/unresolved-specs-during-gemspecification-reset).

#### The source :rubygems is deprecated because HTTP requests are insecure.

In the file `Gemfile`, replace the line:

    source :rubygems

with:

    source "https://rubygems.org"
