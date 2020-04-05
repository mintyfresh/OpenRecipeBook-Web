OpenRecipeBook-Web
==================
A lightweight, browser based UI for the OpenRecipeBook project.

# Installation
These instructions assume you already have Ruby and Bundler installed. The first is to install the bundle:

    $ bundle install
    
If you don't have Ruby, you can find installation instructions on the [Ruby website](https://www.ruby-lang.org/en/downloads/).

# Starting the Web UI
To use the web UI, the local web server must be running. Start is using:

    $ bin/server

This will begin listening for connections from localhost on port 4567 (by default).
Once the server is running, the UI is available from http://localhost:4567/recipes.

## Changing the Server Port
To change the port the server listens on, the `PORT` environment variable may be used.

    $ env PORT=5000 bin/server

The example above will listen for connections on port 5000.
