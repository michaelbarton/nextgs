--- 
  title: Using Plugins
---

Genomer is structured around using plugins to add functionality for editting
and finishing genome sequences. This guide will illustrate how these plugins
are used in a genome project and they make the project more robust to future
changes. If you are following this guide please first make sure you [have
genomer installed](/install) already. The lines beginning with `$` are those
that should be typed into the terminal excluding this `$` sign.

### Create a new genomer project

First begin by creating a new genomer project:

    $ genomer init example-project
    $ cd example-project
    $ ls -lR

This will show the list of files in the newly created genomer project. This
file I will be focusing on is `Gemfile`. This specifies which plugins are used
in the genomer project. If you look at this file you see that this doesn't
contain very much.

    source :rubygems

    gem 'genomer',    '~> 0.0.0'

The line "`source :rubygems`" specifies that the plugins are fetched from the
[RubyGems](http://rubygems.org/) website. This is the location where new
plugins are published and this line should not be changed.

### Specifying versions

The second line specifies that genomer is required to run genomer projects. The
second half of this line "`~> 0.0.0`" designates the version of genomer which
should be used. The symbol "`~>`" is a fuzzy matching to the version number.
Fuzzy matching of a version means matching to an approximate version of this
software which in this case would be `0.0.x` where `x` should be the highest
possible version of the software. If the specified version were "`~> 0.0`" Then
the software would be `0.x.y` for the highest value of `x` first followed by
the highest version of `y`. This allows you to specify what genomer plugins
should be specified according to [semantic versioning](semver.org).

Run the following command to update the current plugins:

    $ bundle update

This will install any new versions of software specified in the Gemfile
according to the conventions I described in the paragraph above. This will
create a file "`Gemfile.lock`". This file describes that plugins that were
installed.

    GEM
      remote: http://rubygems.org/
      specs:
        binman (3.2.0)
        bio (1.4.3)
        configliere (0.4.18)
          highline (>= 1.5.2)
          multi_json (>= 1.1)
        genomer (0.0.9)
          bundler (> 1.1.0)
          configliere (~> 0.4.8)
          md2man (~> 1.4.0)
          rake (~> 0.9.0)
          scaffolder (~> 0.4.0)
          scaffolder-annotation-locator (>= 0.1.4)
          unindent (~> 1.0.0)
        highline (1.6.15)
        md2man (1.4.0)
          binman (~> 3.0)
          redcarpet (~> 2.1)
        multi_json (1.6.1)
        rake (0.9.6)
        redcarpet (2.2.2)
        scaffolder (0.4.4)
          bio (~> 1.4)
        scaffolder-annotation-locator (0.1.4)
          bio (~> 1.4.0)
          scaffolder (>= 0.4.3)
        unindent (1.0)

    PLATFORMS
      ruby

    DEPENDENCIES
      genomer (~> 0.0.0)

Your file may look different to this. Whatever the case, you can see that
several libraries have been installed along with genomer.

### Adding a genomer plugin
