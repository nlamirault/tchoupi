NAME=tchoupi
REBAR=./rebar

all: deps compile

compile:
	$(REBAR) compile

test: clean compile
#	$(REBAR) eunit skip_deps=true
	$(REBAR) ct skip_deps=true

deps:
	$(REBAR) get-deps

app:
	$(REBAR) compile skip_deps=true

clean:
	$(REBAR) clean
	rm -fr erl_crash.dump log

start: compile
	erl -pa ebin deps/*/ebin -s ${NAME}
