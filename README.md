touchHook
=========
This code is an example of implementing an objective-c hook on the touchesBegan method of the UIResponder class. This utilises the [Captain Hook](https://github.com/rpetrich/CaptainHook) created by [Ryan Petrich](http://rpetri.ch/)


Building
========
A Makefile is included with the default locations for SDK and tools. I recommend installing the latest version of xCode and associated iOS SDK for it to compile. Also required is the "codesign" tool which i think also comes with xCode, a signing certificate is included in the bundle.

type "make" to compile

Usage
=====
This example uses the "Stocks.app" that comes with iOS.
copy the compiled dynamic library using scp:
desktop $ scp ./touchHook.dylib root@<IP address of phone>:/Applications/Stocks.app/touchHook.dylib

Insert the library:
 desktop $ ssh root@<IP address of phone> export DYLD_INSERT_LIBRARIES=/Applications/Stocks.app/touchHook.dylib

Run the App

