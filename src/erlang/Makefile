NAME=tchoupi
REBAR=`which rebar || ./rebar`

all: deps compile

compile:
	./rebar compile

test:
	./rebar skip_deps=true eunit

deps:
	./rebar get-deps

app:
	./rebar compile skip_deps=true

clean:
	./rebar clean

start: app
	erl -pa ebin deps/*/ebin -s ${NAME}

