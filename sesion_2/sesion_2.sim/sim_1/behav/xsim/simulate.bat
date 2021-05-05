@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Tue May 04 18:22:04 -0400 2021
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim counter_test_behav -key {Behavioral:sim_1:Functional:counter_test} -tclbatch counter_test.tcl -view C:/Users/juanp/Documents/USM/2021-1/ELO212 Lab.Digitales/Proyectos/sesion_2/counter_test_behav.wcfg -log simulate.log"
call xsim  counter_test_behav -key {Behavioral:sim_1:Functional:counter_test} -tclbatch counter_test.tcl -view C:/Users/juanp/Documents/USM/2021-1/ELO212 Lab.Digitales/Proyectos/sesion_2/counter_test_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
