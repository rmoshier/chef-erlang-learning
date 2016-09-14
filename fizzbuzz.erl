-module(fizzbuzz).
-compile(export_all).

% to compile: c(fizzbuzz).
% to run:
% FizzBuzz = fizzbuzz:start_fizzbuzz().
% fizzbuzz:question(FizzBuzz, is_fb, 3).
% clear variables in erlang shell: f().

start_fizzbuzz() ->
  spawn(?MODULE, fizzbuzz, []).

question(Pid, is_fb, Number) ->
  Pid! {self(), {is_fb, Number}},
  receive
    {Answer, Number} ->
      Answer
  end.

fizzbuzz() ->
  receive
    {From, {is_fb, Number}} when Number rem 15 == 0 ->
      From ! {fizzbuzz, Number};
    {From, {is_fb, Number}} when Number rem 5 == 0 ->
      From ! {buzz, Number};
    {From, {is_fb, Number}} when Number rem 3 == 0 ->
      From ! {fizz, Number};
    {From, {_is_fb, Number}} ->
      From ! {none, Number}
  end,
  fizzbuzz().
