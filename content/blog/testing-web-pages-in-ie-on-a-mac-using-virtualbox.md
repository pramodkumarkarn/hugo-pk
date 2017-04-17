---
title: Testing Web Pages in IE on a Mac using VirtualBox
author: p3trk

date: 2013-02-06
cover: virtualbox.png
xurl: /blog/testing-web-pages-in-ie-on-a-mac-using-virtualbox
categories:
  - Blog
---
_Mostly for my own future reference, here&#8217;s a quick low-down on how I like to test apps and web-pages in IE from my Mac._
<br>
<br>

Recently, I was building my mom a {{% a_blank "website" "http://carolkappus.com" %}} and, while I&#8217;ve convinced her to use Chrome or Firefox, many of her friends (and much of the world) are still on IE8 or IE9 where things are a little different. 

Here&#8217;s a way I&#8217;ve found to do real-time development on a Windows box with IE:

## Getting started

Download {{% a_blank "VirtualBox" "http://www.virtualbox.org" %}} and use the <a href="https://github.com/xdissent/ievms" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','http://github.com']);" target="_blank">nicely packaged Windows/IE images</a>.

## Accessing a locally hosted app

If you&#8217;re serving your app from your host machine, use http://10.0.2.2:[PORT] to access it.

## Tips for using static HTML

If you&#8217;re developing static HTML pages (maybe using something clever like <a href="http://stasis.me" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','http://stasis.me']);" target="_blank">Stasis</a>) you would think you could share a folder from your host machine to your virtual machine. Alas, this <a href="https://www.virtualbox.org/ticket/7160" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','http://www.virtualbox.org']);" target="_blank">doesn&#8217;t work.</a>. Instead, you can use the cool <a href="http://stackoverflow.com/questions/530787/simple-http-web-server" onclick="javascript:_gaq.push(['_trackEvent','outbound-article','http://stackoverflow.com']);">Python built-in web server</a> like so:

> `python -m SimpleHTTPServer [port]`



Then use the URL &#038; Port above to access the files from your virtual machine.

Enjoy!
