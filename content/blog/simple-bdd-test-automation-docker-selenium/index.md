---
title: Start doing BDD and Test Automation in 5 minutes with Docker and Selenium
date: 2018-09-10T11:38:21Z
categories: blog  
resources:
  - name: cover
    src: shane-aldendorff-587930-unsplash.jpg
    params:
      credit: Photo by Shane Aldendorff on Unsplash
      link: https://unsplash.com/photos/mQHEgroKw2k
  - name: cover2
    src: erik-jan-leusink-326914-unsplash.jpg
    params:
      credit: Photo by Erik-Jan Leusink on Unsplash
      link: https://unsplash.com/photos/UbeuY3rPTJs

---

[Behaviour Driven Development (or BDD)](https://en.wikipedia.org/wiki/Behavior-driven_development) ensures everyone has the same understanding of how a feature should work and keeps your efforts focused. Moreover, test-automation dramatically speeds up acceptance and regression testing.

Unfortunately, getting started can be tough. You need a browser, a testing framework like [cucumber](https://cucumber.io/), a web driver like [Selenium](https://www.seleniumhq.org/), and something like [capybara](https://github.com/teamcapybara/capybara) to glue it all together (which, of course, requires [ruby](https://www.ruby-lang.org/en/)).

There are other more sophisticated Java-based frameworks like [Serenity](http://www.thucydides.info/#/) which uses the popular [Screenplay Pattern](http://thucydides.info/docs/articles/screenplay-tutorial.html) to let you do really fancy things but sometimes you just need to get started.

## Get started in 5 minutes
Here's a simple way to set up a BDD environment in about 5 minutes using Docker and Selenium. In the video below we create a browser container, connect to it with VNC so we can see what's happening, then create another container to run ruby/capybara and then we test Google to make sure that we see the word "dog" when we search for "puppies". Check it out below!

{{< youtube xjwdaE36oIY >}}

<br>
## Step by step
Here's a text-basd summary of what just happened in the video. It assumes you have [docker](https://www.docker.com/) installed, you've [logged in](https://docs.docker.com/engine/reference/commandline/login/) to [docker hub](https://hub.docker.com/) at least once and you have a basic knowledge of BDD.

To begin clone [this repository](https://github.com/peterkappus/selenium-cucumber-docker) into a folder which you can do from a terminal like so:

```
git clone git@github.com:peterkappus/selenium-cucumber-docker.git
```

Now move into the director you just cloned...
```
cd selenium-cucumber-docker
```

Start the selenium chrome container in the background (the first time you do this, it might take a few minutes).

```
docker run -d -p 4444:4444 -p 5900:5900 selenium/standalone-chrome-debug
```

Now you can see into the container by using VNC to connect:
```
open vnc://:secret@0.0.0.0:5900
```
This should open a VNC viewer and show you an empty ubuntu desktop.

Now build a container to hold your ruby gems and run cucumber:

```
docker build . -t ruby_test
```

Start it up. Notice how we're mapping the current working folder to the `/app` directory. We're also starting a `bash` session so we can run cucumber interactively.

```
docker run -v "$(PWD)":/app -it ruby_test bash
```
Once we're inside, we can start cucumber.

```
cucumber
```

If all goes to plan, we should see some tests running in our VNC session.

We can now write tests in our "feature" folder and step definitions in our "features/step_definitions" folder. The repo above includes a few generic step definitions for seeing things and clicking on things. You'll no doubt want to write your own but this will get you started.

I hope this helps you start exploring test automation and BDD and saves you some hassle.

[Let me know](/contact) how you do it!
