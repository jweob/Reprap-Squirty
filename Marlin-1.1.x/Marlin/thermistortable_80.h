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


// 100k 0603 SMD Vishay NTCS0603E3104FXT (4.7k pullup) using RepRapPro formula
const short temptable_80[][2] PROGMEM = {
  {35*OVERSAMPLENR,    284},
  {211*OVERSAMPLENR,    165},
  {233*OVERSAMPLENR,    159},
  {261*OVERSAMPLENR,    153},
  {290*OVERSAMPLENR,    146},
  {328*OVERSAMPLENR,    139},
  {362*OVERSAMPLENR,    133},
  {406*OVERSAMPLENR,    125},
  {446*OVERSAMPLENR,    119},
  {496*OVERSAMPLENR,    112},
  {539*OVERSAMPLENR,    106},
  {585*OVERSAMPLENR,    100},
  {629*OVERSAMPLENR,     94},
  {675*OVERSAMPLENR,     87},
  {718*OVERSAMPLENR,     81},
  {758*OVERSAMPLENR,     76},
  {793*OVERSAMPLENR,     70},
  {822*OVERSAMPLENR,     65},
  {841*OVERSAMPLENR,     62},
  {875*OVERSAMPLENR,     55},
  {899*OVERSAMPLENR,     50},
  {926*OVERSAMPLENR,     43},
  {946*OVERSAMPLENR,     37},
  {962*OVERSAMPLENR,     32},
  {977*OVERSAMPLENR,     25},
  {987*OVERSAMPLENR,     20},
  {995*OVERSAMPLENR,     14},
  {1001*OVERSAMPLENR,     10},
  {1010*OVERSAMPLENR,      0},
  {1023*OVERSAMPLENR,    0}
};


