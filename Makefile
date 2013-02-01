SDKVER?=6.0

CSNAME="iPhone Developer"

DEVELOPER=/Applications/Xcode.app/Contents/Developer
PLATFORM=$(DEVELOPER)/Platforms/iPhoneOS.platform/Developer
SDK=$(PLATFORM)/SDKs/iPhoneOS$(SDKVER).sdk
THEOS=/Users/peterfillmore/dev/theos/include

CC=$(PLATFORM)/usr/bin/arm-apple-darwin10-llvm-gcc-4.2 
LD=$(PLATFORM)/usr/bin/ld

CFLAGS= -Wall -isysroot $(SDK) -framework Foundation -framework UIKit -lobjc -fPIC -I../include  
LDFLAGS=-dylib -lsystem -lobjc -framework Foundation -framework UIKit -syslibroot $(SDK)

MACOSX=$(DEVELOPER)/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.7.sdk/System/Library/Frameworks

PROGS=touchHook.dylib

all: $(PROGS) 

touchHook.o: touchHook.m
	$(CC) $(CFLAGS) -c -o $@ $^

touchHook.dylib: touchHook.o 
	$(LD) $(LDFLAGS) -o $@ $^
	codesign -f -s $(CSNAME) --entitlements entitlements.xcent $@

clean:
	rm -rf *.o *.dSYM $(PROGS)

