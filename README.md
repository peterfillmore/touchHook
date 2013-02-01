touchHook
=========
This code is an example of implementing an objective-c hook on the touchesBegan method of the UIResponder class. This utilises the [Captain Hook](https://github.com/rpetrich/CaptainHook) created by [Ryan Petrich](http://rpetri.ch/)


Building
========
A Makefile is included with the default locations for SDK and tools. I recommend installing the latest version of xCode and associated iOS SDK for it to compile. Also required is the "codesign" tool which i think also comes with xCode, a signing certificate is included in the bundle.

type "make" to compile

Usage
=====
Copy the compiled dynamic library using ftp or scp e.g:
    desktop $ scp ./touchHook.dylib root@<IP address of phone>:/usr/lib/touchHook.dylib

send the following command using ssh to the device e.g:
    desktop $ ssh root@<IP address of phone> 
Register the environmental value:
    iDevice# launchctl setenv DYLD_INSERT_LIBRARIES "/usr/lib/touchHook.dylib"

Run an application and start touching the screen, the status bar at the top should change color or move (may require a few touches for it to work)

I recommend disabling the hook library after use:
    iDevice# launchctl setenv DYLD_INSERT_LIBRARIES ""


