
.PHONY: clean tag release

VERSION=7

clean:
	rm -f *~

tag: clean
	cvs tag OpenAllBags-$(VERSION)

release: clean
	( cd ..;							\
		rm -f OpenAllBags-$(VERSION).zip;			\
		find OpenAllBags					\
				-name CVS -prune -o			\
				-name .svn -prune -o			\
				-name Makefile -prune -o		\
				-name '.*.swp' -prune -o		\
				-print					\
		| zip -@ OpenAllBags-$(VERSION).zip;			\
	)	
