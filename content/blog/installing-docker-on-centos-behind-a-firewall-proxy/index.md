---
date: 2018-05-13
title: Installing Docker on a Centos7 VM behind a corporate firewall
draft: false
categories:
  - Blog
  - Tech
resources:
  - name: cover
    src: cover.jpg
    params:
      credit: Ben Watkin
      link: https://www.flickr.com/photos/falcifer/542251701/in/photolist-PVbxg-4xjtAG-88e6qv-YBBKy-akFb78-43FX28-6tjvVE-dWkUmx-7uk4rJ-6N5CeB-DkfvJ-4uLw5G-nZ77yj-7K9dUo-89DfiC-5SmMuN-qoyaNe-bu2EBf-6goydB-6AsL2w-8FDfdS-5ShsEi-5SmMUL-b1mmqM-hbPAx-uJhbw-99aRUA-6QYxG7-e7XJ8D-4yqK19-a8mqdX-73Rtq5-7uKbYx-QVpJ5-4SiSiD-77nmEc-6vgs84-41DxvP-adE4Qr-5fVaf9-5sYq17-fj2L3k-2FGBAU-9gc1xM-6QceDJ-e5yFUM-7DYFwV-dVjTmv-btMUoR-7E3vRy
---

I've been helping a team to improve its [Continuous Delivery](https://en.wikipedia.org/wiki/Continuous_delivery) pipeline and as part of this work, we're introducing BDD-style test automation using [Serenity](http://www.thucydides.info). 

While there are some great cloud-based cross-browser testing tools out there, this team is building an internal app locked away behind the corporate firewall and every one of our [virtual machines (VMs)](https://en.wikipedia.org/wiki/Virtual_machine) uses a proxy to access the big scary internet and we couldn't get the company's preferred cloud-based tool to access our test environment.

One advantage of building an internal app is that we can support a small number of browsers (in this case Chrome). So we decided to setup a stand-alone [Docker](https://www.docker.com/) image of [Selenium Chrome](https://hub.docker.com/r/selenium/standalone-chrome/) that we could use to run our tests as part of our CD pipeline. 

Setting up Docker on a [Centos](https://www.centos.org/) VM behind the corporate firewall and using a proxy to access the internet has proven to be trickier than we expected.

Last week I finally dug in (and read the [docs](https://docs.docker.com/config/daemon/systemd/#httphttps-proxy)) and I wanted to share how I ultimately got it working (mostly for when I have to do this again). If you're reading this after May 2018, be sure to check the version numbers and do [let me know](/contact) if I need to update this or if you've spotted an improvement.

The code below is a gist on [github](https://gist.github.com/peterkappus/b85930304354678c95b26cc5db6e47bc). It's **not quite a bash script** so please read it carefully and don't just copy/paste every line into your terminal. :tv:

{{< gist peterkappus b85930304354678c95b26cc5db6e47bc >}}

DISCLAIMER: This code is provided in the hope that it will be useful but with no warranty expressed or implied. I can't be held liable for any errors or omissions or any havoc it may wreak. :joy:
