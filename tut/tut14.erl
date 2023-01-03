%% 并发编程，事实上更像是并行编程，每个进程不共享数据
-module(tut14).
-compile(export_all).
say_something(_What,0)->
    %% 不需要的变量可以用_前置
    done;
say_something(What, Times)->
    io:format("~p~n",[What]),
    say_something(What, Times-1).
start()->
    %% 开启两个进程 使用spawn函数开启, spawn 翻译：产生
    %% @paralist 
    %% -模块名 -函数名 -函数参数，用列表装载
    spawn(tut14,say_something,[hello,3]),
    spawn(tut14,say_something,[goodbye,3]).

%% c(tut14).
%% tut14:say_something(hello,3).
%% tut14:start().
%% self(). 函数是看本进程的pid，返回本进程的pid？？
