# Ruby on Rails Tutorial: sample application

This is the sample application for
[*Ruby on Rails Tutorial: Learn Rails by Example*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/).

# Debugging Rails

Sometimes your application goes wrong. Fortunately there are a lot of tools that
will help you debug it and get it back on the rails.

First area to check is the application log files. Have `tail -f` commands
running on the server.log and development.log. Rails will automatically display
debugging and runtime information to these files. Debugging info will also be
shown in the browser on requests from 127.0.0.1.

You can also log your own messages directly into the log file from your code
using the Ruby logger class from inside your controllers. Example:

    class WeblogController < ActionController::Base
      def destroy
        @weblog = Weblog.find(params[:id])
        @weblog.destroy
        logger.info("#{Time.now} Destroyed Weblog ID ##{@weblog.id}!")
      end
    end

The result will be a message in your log file along the lines of:

    Mon Oct 08 14:22:29 +1000 2007 Destroyed Weblog ID #1!

[More information on how to use the logger is at http://www.ruby-doc.org/core/](http://www.ruby-doc.org/core/)


# Debugger

Debugger support is available through the debugger command when you start your
Mongrel or WEBrick server with --debugger. This means that you can break out of
execution at any point in the code, investigate and change the model, and then,
resume execution! You need to install ruby-debug to run the server in debugging
mode. With gems, use <tt>sudo gem install ruby-debug</tt>. Example:

    class WeblogController < ActionController::Base
      def index
        @posts = Post.all
        debugger
      end
    end

So the controller will accept the action, run the first line, then present you
with a IRB prompt in the server window. Here you can do things like:

    >> @posts.inspect
    => "[#<Post:0x14a6be8
            @attributes={"title"=>nil, "body"=>nil, "id"=>"1"}>,
         #<Post:0x14a6620
            @attributes={"title"=>"Rails", "body"=>"Only ten..", "id"=>"2"}>]"
    >> @posts.first.title = "hello from a debugger"
    => "hello from a debugger"

...and even better, you can examine how your runtime objects actually work:

    >> f = @posts.first
    => #<Post:0x13630c4 @attributes={"title"=>nil, "body"=>nil, "id"=>"1"}>
    >> f.
    Display all 152 possibilities? (y or n)

Finally, when you're ready to resume execution, you can enter `cont`.


# Console

The console is a Ruby shell, which allows you to interact with your
application's domain model. Here you'll have all parts of the application
configured, just like it is when the application is running. You can inspect
domain models, change values, and save to the database. Starting the script
without arguments will launch it in the development environment.

To start the console, run <tt>rails console</tt> from the application
directory.

Options:

* Passing the <tt>-s, --sandbox</tt> argument will rollback any modifications
  made to the database.
* Passing an environment name as an argument will load the corresponding
  environment. Example: <tt>rails console production</tt>.

To reload your controllers and models after launching the console run
<tt>reload!</tt>

More information about irb can be found at:
[http://www.rubycentral.org/pickaxe/irb.html](http://www.rubycentral.org/pickaxe/irb.html)


# dbconsole

You can go to the command line of your database directly through <tt>rails
dbconsole</tt>. You would be connected to the database with the credentials
defined in database.yml. Starting the script without arguments will connect you
to the development database. Passing an argument will connect you to a different
database, like <tt>rails dbconsole production</tt>. Currently works for MySQL,
PostgreSQL and SQLite 3.

