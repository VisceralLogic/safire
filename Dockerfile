FROM ubuntu:16.04

#packages necessary for building SBCL
RUN apt-get update -qq && apt-get install -y \
	emacs-nox \
	sbcl \
	slime \
	wget \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /root

#load quicklisp/gendl
RUN wget https://beta.quicklisp.org/quicklisp.lisp \
	&&  sbcl --load /root/quicklisp.lisp --eval "(quicklisp-quickstart:install)" --eval "(ql:quickload :gendl)" \

#COPY src/ safire/

#starting command
#CMD sbcl --load /root/quicklisp/setup.lisp --eval "(ql:quickload :gendl)" --eval "(gendl:start-gendl!)"