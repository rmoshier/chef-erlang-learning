-module(strings_tests).
-compile([export_all]).
-include_lib("eunit/include/eunit.hrl").

string_concat_test() ->
  First = "con",
  Second = "cat",

  Result = strings:string_concat(First, Second),

  ?assertEqual("concat", Result).

atom_concat_test() ->
  First = con,
  Second = cat,

  Result = strings:string_concat(First, Second),

  ?assertEqual("concat", Result).

cat_atom_test() ->
  First = "con",
  Second = cat,

  Result = strings:string_concat(First, Second),

  ?assertEqual("concat", Result).

con_atom_test() ->
  First = con,
  Second = "cat",

  Result = strings:string_concat(First, Second),

  ?assertEqual("concat", Result).

first_single_tuple_test() ->
  First = {con},
  Second = cat,

  Result = strings:string_concat(First, Second),

  ?assertEqual("concat", Result).

second_single_tuple_test() ->
  First = con,
  Second = {cat},

  Result = strings:string_concat(First, Second),

  ?assertEqual("concat", Result).

% first_double_tuple_test() ->
%   First = {c, on},
%   Second = cat,
%
%   Result = strings:string_concat(First, Second),
%
%   ?assertEqual("concat", Result).
