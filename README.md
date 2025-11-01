# Smart-water-level-system-verilog
This is a smart water level management system which has 3 sensors in it namely BOTTOM, HALF and TOP. This implementation is done using IVerilog
# Smart Water Level Controller using FSM

A mini–project implementing a **Smart Water Level Controller** using **Finite State Machine (FSM)** in **Verilog HDL**.  
The system controls a pump based on tank water level sensed through three binary sensors.

## Project Overview
The controller:
- Turns pump **ON** when tank is empty or below mid-level.
- Turns pump **OFF** when water reaches the top/high level.
- Responds automatically as level falls.
- Uses synchronous FSM with asynchronous reset.

## Team Members
| Name | USN |
|------|------|
| Abdul Muheeth K | PES1UG24CS550 |
| Anirudh M | PES1UG24CS556 |
| Praveen | PES1UG25CS832 |

## Problem Statement
Design a digital controller to automatically manage a water pump to maintain proper water level using three binary sensors:  
S0 → Low/Empty  
S1 → Mid  
S2 → High  

### Requirements
- Pump turns **ON** when level < full.
- Pump turns **OFF** when full.
- Uses FSM with asynchronous reset.
- Optional features: manual override, alarm, debouncing.

## FSM Design
### State Encoding
| State | CS1 CS0 | Meaning |
|-------|---------|---------|
| EMPTY | 00 | Tank near empty |
| HALF  | 01 | Tank partially filled |
| FULL  | 10 | Tank full |

Pump is ON except in FULL state.

### How to work with the files SmartWaterLevelController.v and tb_SmartWaterLevelController.v
1. Download verilog module as well as gtkwave module from the browser
2. Add these files into the bin folder of the verilog folder
3. Enter these commands in the command prompt
   cd \
   cd iverilog
   cd bin
   iverilog -o test SmartWaterLevelController.v tb_SmartWaterLevelController.v
   vvp test // to get the vvp output(similar to the truth table)
   gtkwave SmartWaterLevel.vcd //gets the gtkwave output
