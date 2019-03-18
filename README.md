## ProxyMan-Reloaded

### Configuring proxy made simple on Linux
This is a fork from the original [ProxyMan] (https://github.com/himanshub16/ProxyMan) written by [Himanshu Shekhar] (https://github.com/himanshub16). The main changes are:

* Added an option to set up the proxy configuration file that would be set by the OS GUI. This is needed by some programs (e.g., Google Chrome) to work properly behind a proxy.
* Added bash completition.
* Given the choice not to set a proxy for HTTPS or FTP connections
* Corrected some minor bugs.


## How to use it
[![asciicast](https://asciinema.org/a/CVha4PPMdjkU7a1XihD9PItrz.png)](https://asciinema.org/a/CVha4PPMdjkU7a1XihD9PItrz)
(video refers to the original [ProxyMan] (https://github.com/himanshub16/ProxyMan))

* Install with single-step process.
```./install```

Proxyman is now available in your path. 
Open a new terminal window and start playing.

* Set proxy
```proxyman set```

* Save your settings for later use.
* View your saved configs
```proxyman configs```
* Load your previously saved config - say you saved it by the name *point4*. 
```proxyman load point4```

### DISCLAIMER
Please don't save your passwords on public machines. Instead use proxyman without providing password and log-in from the browser.
