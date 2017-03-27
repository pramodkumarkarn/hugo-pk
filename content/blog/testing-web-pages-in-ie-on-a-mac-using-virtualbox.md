---
title: Testing Web Pages in IE on a Mac using VirtualBox
author: p3trk

date: 2013-02-06
cover: virtualbox.png
xurl: /blog/testing-web-pages-in-ie-on-a-mac-using-virtualbox
categories:
  - Blog
---
<p class="lead">
  Mostly for my own future reference, here&#8217;s a quick low-down on how I like to test apps and web-pages in IE from my Mac.
</p>

Recently, I was building a <a href="http://carolkappus.com" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','http://carolkappus.com']);">website for my mom</a> While I&#8217;ve convinced her to use Chrome or Firefox, many of her friends (and much of the world) are still on IE8 or IE9 where things are a little different. Here&#8217;s a way I&#8217;ve found to do real-time development on a Windows box with IE:

### Setup

Download <a href="https://www.virtualbox.org" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','http://www.virtualbox.org']);" target="_blank">VirtualBox</a> and use the <a href="https://github.com/xdissent/ievms" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','http://github.com']);" target="_blank">nicely packaged Windows/IE images</a>.

### Accessing a locally hosted app

If you&#8217;re serving your app from your host machine, use http://10.0.2.2:[PORT] to access it.

### Using Static HTML?

If you&#8217;re developing static HTML pages (maybe using something clever like <a href="http://stasis.me" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','http://stasis.me']);" target="_blank">Stasis</a>) you would think you could share a folder from your host machine to your virtual machine. Alas, this <a href="https://www.virtualbox.org/ticket/7160" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','http://www.virtualbox.org']);" target="_blank">doesn&#8217;t work.</a>. Instead, you can use the cool <a href="http://stackoverflow.com/questions/530787/simple-http-web-server" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','http://stackoverflow.com']);">Python built-in web server</a> like so:

> `python -m SimpleHTTPServer [port]`



Then use the URL &#038; Port above to access the files from your virtual machine.

Enjoy!
