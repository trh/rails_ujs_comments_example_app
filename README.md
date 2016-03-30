# Comments on a single Page

We see it each and every day.  A page with comments.  You can read the comments.  You can add a comment.  And 9 times out of 10, adding your comment doesn't change the page you're on, it just quietly adds it to the existing list.  But you're new to rails, and UJS isn't your bag yet.  This tiny sample application will change that.

Building blocks used in this app

  - Rails 4.2
  - Kaminari to show page pagination
  - Nested routes, comments inside of post
  - Ajax comment form
  - UJS handling of new comment to render in-place


### Installation 

Like most example apps, you'll be up and running within a few minutes.  Fetch the code, cd into the newly created directory and run the rails magic tools, like so:
```sh
$ git clone [https://github.com/trh/rails_ujs_comments_example_app.git]
ujs_comments_app
$ cd  ujs_comments_app
$ bundle install
$ bundle exec rake db:migrate db:seed
$ rails s 
```

### Testing
There is very little testing done, because the application does so very little.

> Note first that all work was done in OSX originally so the js testing for Capybara is using webkit.  If  you'd like to use selenium instead, simply uncomment the gem in the Gemfile and change the javascript driver to selenium webdriver.

The  tests only cover the most basic of functionality of the 2 controllers: 
- the ability to create a post
- comment on a post
- make the post visible on teh same page.

### Browser view
Navigate in a browser to <http://lvh.me> or <http://localhost>

----

#### Help from the heavens
* [StartBootstarp Clean Blog Theme](http://startbootstrap.com/template-overviews/clean-blog/)
* [FontAwesome Icon Pack](https://github.com/FortAwesome/Font-Awesome/)
* [Kaminari Pagination](https://github.com/amatsuda/kaminari)


