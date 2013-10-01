NAME=tchoupi
REBAR=./rebar

all: deps compile

compile:
	$(REBAR) compile

test:
	$(REBAR) skip_deps=true eunit

deps:
	$(REBAR) get-deps

app:
	$(REBAR) compile skip_deps=true

clean:
	$(REBAR) clean

start: app
	erl -pa ebin deps/*/ebin -s ${NAME}

