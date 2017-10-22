/**
 * Marlin 3D Printer Firmware
 * Copyright (C) 2016 MarlinFirmware [https://github.com/MarlinFirmware/Marlin]
 *
 * Based on Sprinter and grbl.
 * Copyright (C) 2011 Camiel Gubbels / Erik van der Zalm
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */


// Extruder thermistor: Digikey 480-3137-ND - All Huxleys shipped after 25/2/14 using RepRapProFormula
const short temptable_81[][2] PROGMEM = {
  {23*OVERSAMPLENR,    341},
  {25*OVERSAMPLENR,    333},
  {27*OVERSAMPLENR,    325},
  {28*OVERSAMPLENR,    322},
  {31*OVERSAMPLENR,    313},
  {33*OVERSAMPLENR,    307},
  {35*OVERSAMPLENR,    302},
  {38*OVERSAMPLENR,    295},
  {41*OVERSAMPLENR,    288},
  {44*OVERSAMPLENR,    282},
  {48*OVERSAMPLENR,    275},
  {52*OVERSAMPLENR,    269},
  {56*OVERSAMPLENR,    264},
  {61*OVERSAMPLENR,    257},
  {66*OVERSAMPLENR,    251},
  {71*OVERSAMPLENR,    246},
  {78*OVERSAMPLENR,    239},
  {84*OVERSAMPLENR,    233},
  {92*OVERSAMPLENR,    227},
  {100*OVERSAMPLENR,    221},
  {109*OVERSAMPLENR,    216},
  {120*OVERSAMPLENR,    209},
  {131*OVERSAMPLENR,    203},
  {143*OVERSAMPLENR,    198},
  {156*OVERSAMPLENR,    192},
  {171*OVERSAMPLENR,    186},
  {187*OVERSAMPLENR,    180},
  {205*OVERSAMPLENR,    174},
  {224*OVERSAMPLENR,    169},
  {245*OVERSAMPLENR,    163},
  {268*OVERSAMPLENR,    157},
  {293*OVERSAMPLENR,    152},
  {320*OVERSAMPLENR,    146},
  {348*OVERSAMPLENR,    141},
  {379*OVERSAMPLENR,    135},
  {411*OVERSAMPLENR,    129},
  {445*OVERSAMPLENR,    124},
  {480*OVERSAMPLENR,    118},
  {516*OVERSAMPLENR,    113},
  {553*OVERSAMPLENR,    108},
  {591*OVERSAMPLENR,    102},
  {628*OVERSAMPLENR,     97},
  {665*OVERSAMPLENR,     92},
  {702*OVERSAMPLENR,     86},
  {737*OVERSAMPLENR,     81},
  {770*OVERSAMPLENR,     76},
  {801*OVERSAMPLENR,     71},
  {830*OVERSAMPLENR,     65},
  {857*OVERSAMPLENR,     60},
  {881*OVERSAMPLENR,     55},
  {903*OVERSAMPLENR,     50},
  {922*OVERSAMPLENR,     45},
  {939*OVERSAMPLENR,     40},
  {954*OVERSAMPLENR,     35},
  {966*OVERSAMPLENR,     30},
  {977*OVERSAMPLENR,     25},
  {985*OVERSAMPLENR,     21},
  {993*OVERSAMPLENR,     16},
  {999*OVERSAMPLENR,     11},
  {1004*OVERSAMPLENR,      6},
  {1008*OVERSAMPLENR,      0}
};


