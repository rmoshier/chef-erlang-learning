-module(strings).
-export([string_concat/2]).

% In /server run:
  % `./rebar compile` to compile code
  % `./rebar eunit apps=strings skip_deps=true` to run tests

% TODO: Add tuple handling
% TODO: Add array handing

string_concat({First}, Second) ->
    string_concat(First, Second);
string_concat(First, {Second}) ->
    string_concat(First, Second);
% Why doesn't this work?
% string_concat({First}, {Second}) ->
%     string_concat(First, Second);
string_concat(First, Second) when is_atom(First) ->
    string_concat(atom_to_list(First), Second);
string_concat(First, Second) when is_atom(Second) ->
    string_concat(First, atom_to_list(Second));
string_concat(First, Second) ->
    First ++ Second.
