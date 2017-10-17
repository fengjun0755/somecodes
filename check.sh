#!/bin/bash
#set -x
#PROGRAM=greeter_server
PROGRAM=tensorflow_model_server
#INSTALL_PATH=/root/grpc/examples/cpp/helloworld
INSTALL_PATH=`pwd`

PORT=9371

check_program_running() {
  running=0
  pids=`ps -eaf|grep $PROGRAM|awk '{ print $2 }'`
  for pid in $pids
  do
    #echo pid=$pid
    exe=`ls -l /proc/$pid/ 2> /dev/null |grep " exe -> "|awk '{ print $11 }'`
    #echo exe=$exe
    if [ "x"$exe = "x"$1/$2 ]
    then
      running=1
      echo $1/$2 already running as process $pid
    fi
  done
  if [ $running -eq 0 ]
  then
    return 1
  else
    return 0
  fi
}

check_program_listening_on_port() {
  running=0
  pids=`lsof -i:9371|grep LISTEN|awk '{ print $2 }'`
  for pid in $pids
  do
    #echo pid=$pid
    exe=`ls -l /proc/$pid/ 2> /dev/null |grep " exe -> "|awk '{ print $11 }'`
    #echo exe=$exe
    if [ "x"$exe = "x"$1/$2 ]
    then
      running=1
      echo $1/$2 already running as process $pid listening at $3
    fi
  done
  if [ $running -eq 0 ]
  then
    return 1
  else
    return 0
  fi
}

check_program_running $INSTALL_PATH $PROGRAM
if [ $? -eq 0 ]
then
  echo "process $INSTALL_PATH/$PROGRAM is running"
else
  echo "process $INSTALL_PATH/$PROGRAM not running"
fi

check_program_listening_on_port $INSTALL_PATH $PROGRAM $PORT
if [ $? -eq 0 ]
then
  echo "process $INSTALL_PATH/$PROGRAM is listening at port $PORT"
else
  echo "process $INSTALL_PATH/$PROGRAM not listening at port $PORT"
fi


