EESchema Schematic File Version 4
LIBS:RPZ_SC_VNA-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Raspberry Pi Zero VNA Hat"
Date "2019-05-12"
Rev "Rev 1.0"
Comp "Walla Walla University"
Comment1 "Greg Birge"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L si5351a:SI5351A U1
U 1 1 5CDA03EF
P 2400 1550
F 0 "U1" H 2400 2115 50  0000 C CNN
F 1 "SI5351A" H 2400 2024 50  0000 C CNN
F 2 "EtherkitKicadLibrary:MSOP-10" H 2400 1550 50  0001 C CNN
F 3 "" H 2400 1550 50  0001 C CNN
	1    2400 1550
	1    0    0    -1  
$EndComp
$Comp
L lt6231:SMA_Female Output1
U 1 1 5CD9DBE9
P 5750 1150
F 0 "Output1" H 5851 1125 50  0000 L CNN
F 1 "P2" H 5851 1034 50  0000 L CNN
F 2 "SMA:SMA_EDGE" H 5750 1150 50  0001 C CNN
F 3 "" H 5750 1150 50  0000 C CNN
	1    5750 1150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5CDB082D
P 1200 850
F 0 "#PWR03" H 1200 600 50  0001 C CNN
F 1 "GND" H 1205 677 50  0000 C CNN
F 2 "" H 1200 850 50  0001 C CNN
F 3 "" H 1200 850 50  0001 C CNN
	1    1200 850 
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5CDB0EE8
P 1450 850
F 0 "C1" V 1702 850 50  0000 C CNN
F 1 "0.1uF" V 1611 850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1488 700 50  0001 C CNN
F 3 "~" H 1450 850 50  0001 C CNN
	1    1450 850 
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5CDB1E35
P 1400 1900
F 0 "R1" V 1300 1800 50  0000 C CNN
F 1 "4.7k" V 1400 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1330 1900 50  0001 C CNN
F 3 "~" H 1400 1900 50  0001 C CNN
	1    1400 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	1750 1350 1750 1250
Wire Wire Line
	1750 1350 1600 1350
Wire Wire Line
	1600 1350 1600 850 
Connection ~ 1750 1350
Wire Wire Line
	1300 850  1200 850 
Connection ~ 950  1350
Wire Wire Line
	850  1350 850  1750
Wire Wire Line
	950  1100 950  1350
Wire Wire Line
	1050 1100 950  1100
$Comp
L power:GND #PWR01
U 1 1 5CDBE266
P 1050 1100
F 0 "#PWR01" H 1050 850 50  0001 C CNN
F 1 "GND" H 1055 927 50  0000 C CNN
F 2 "" H 1050 1100 50  0001 C CNN
F 3 "" H 1050 1100 50  0001 C CNN
	1    1050 1100
	1    0    0    -1  
$EndComp
$Comp
L cx3225:CX3225 Y1
U 1 1 5CDB13BC
P 1050 1550
F 0 "Y1" H 1100 1900 50  0000 R CNN
F 1 "CX3225" H 1200 1800 50  0000 R CNN
F 2 "SMA:CX3225" H 1050 1550 50  0001 C CNN
F 3 "" H 1050 1550 50  0001 C CNN
	1    1050 1550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	850  1350 950  1350
Wire Wire Line
	950  1750 850  1750
Wire Wire Line
	1750 1450 1450 1450
Wire Wire Line
	1450 1450 1450 1400
Wire Wire Line
	1450 1400 1050 1400
Wire Wire Line
	1050 1700 1250 1700
Wire Wire Line
	1250 1700 1250 1550
Wire Wire Line
	1250 1550 1750 1550
$Comp
L Device:R R2
U 1 1 5CDC5FE6
P 1400 2000
F 0 "R2" V 1500 2100 50  0000 C CNN
F 1 "4.7k" V 1400 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1330 2000 50  0001 C CNN
F 3 "~" H 1400 2000 50  0001 C CNN
	1    1400 2000
	0    1    1    0   
$EndComp
Wire Wire Line
	1250 1900 1250 2000
Wire Wire Line
	1550 1900 1550 1650
Wire Wire Line
	1550 1650 1750 1650
Wire Wire Line
	1750 1750 1600 1750
Wire Wire Line
	1600 1750 1600 2000
Wire Wire Line
	1600 2000 1550 2000
Wire Wire Line
	1250 2000 1050 2000
Connection ~ 1250 2000
Text Label 1600 1650 0    50   ~ 0
SCL
Text Label 1600 1750 0    50   ~ 0
SDA
$Comp
L power:+3V3 #PWR05
U 1 1 5CDCAF92
P 1750 1250
F 0 "#PWR05" H 1750 1100 50  0001 C CNN
F 1 "+3V3" H 1765 1423 50  0000 C CNN
F 2 "" H 1750 1250 50  0001 C CNN
F 3 "" H 1750 1250 50  0001 C CNN
	1    1750 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR02
U 1 1 5CDCB1BE
P 1050 2000
F 0 "#PWR02" H 1050 1850 50  0001 C CNN
F 1 "+3V3" H 1065 2173 50  0000 C CNN
F 2 "" H 1050 2000 50  0001 C CNN
F 3 "" H 1050 2000 50  0001 C CNN
	1    1050 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5CDCD3A8
P 3950 1150
F 0 "C6" V 3698 1150 50  0000 C CNN
F 1 "1.0uF" V 3789 1150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3988 1000 50  0001 C CNN
F 3 "~" H 3950 1150 50  0001 C CNN
	1    3950 1150
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5CDCDA89
P 4800 1150
F 0 "R4" V 4700 1150 50  0000 C CNN
F 1 "R" V 4800 1150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4730 1150 50  0001 C CNN
F 3 "~" H 4800 1150 50  0001 C CNN
	1    4800 1150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR027
U 1 1 5CDCE991
P 5750 1350
F 0 "#PWR027" H 5750 1100 50  0001 C CNN
F 1 "GND" H 5755 1177 50  0000 C CNN
F 2 "" H 5750 1350 50  0001 C CNN
F 3 "" H 5750 1350 50  0001 C CNN
	1    5750 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1350 3050 1150
Wire Wire Line
	3050 1150 3800 1150
Wire Wire Line
	4100 1150 4650 1150
Wire Wire Line
	4950 1150 5050 1150
Wire Wire Line
	5050 1150 5050 1200
Wire Wire Line
	5050 1150 5600 1150
Connection ~ 5050 1150
Text Notes 5800 1000 0    157  ~ 0
Output Port
Text Notes 1950 800  0    157  ~ 0
Oscillator
$Comp
L power:GND #PWR013
U 1 1 5CE3CE60
P 3450 6150
F 0 "#PWR013" H 3450 5900 50  0001 C CNN
F 1 "GND" H 3455 5977 50  0000 C CNN
F 2 "" H 3450 6150 50  0001 C CNN
F 3 "" H 3450 6150 50  0001 C CNN
	1    3450 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 5850 3450 5850
$Comp
L Device:C C4
U 1 1 5CE2E88F
P 3450 6000
F 0 "C4" H 3300 5950 50  0000 C CNN
F 1 ".005uF" H 3250 6100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3488 5850 50  0001 C CNN
F 3 "~" H 3450 6000 50  0001 C CNN
	1    3450 6000
	-1   0    0    1   
$EndComp
Text Label 2550 5650 2    50   ~ 0
LO_I
Text Label 1950 4750 2    50   ~ 0
LO_I
Connection ~ 2250 4350
Wire Wire Line
	2250 4400 2250 4350
$Comp
L power:+3V3 #PWR06
U 1 1 5CE0E3E2
P 2250 4350
F 0 "#PWR06" H 2250 4200 50  0001 C CNN
F 1 "+3V3" H 2350 4500 50  0000 C CNN
F 2 "" H 2250 4350 50  0001 C CNN
F 3 "" H 2250 4350 50  0001 C CNN
	1    2250 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR09
U 1 1 5CE0D0E7
P 2850 5300
F 0 "#PWR09" H 2850 5150 50  0001 C CNN
F 1 "+3V3" H 2865 5473 50  0000 C CNN
F 2 "" H 2850 5300 50  0001 C CNN
F 3 "" H 2850 5300 50  0001 C CNN
	1    2850 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5CE0780A
P 2100 4350
F 0 "C2" V 1848 4350 50  0000 C CNN
F 1 "0.1uF" V 1939 4350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2138 4200 50  0001 C CNN
F 3 "~" H 2100 4350 50  0001 C CNN
	1    2100 4350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5CE0531A
P 1950 4350
F 0 "#PWR04" H 1950 4100 50  0001 C CNN
F 1 "GND" H 1850 4350 50  0000 C CNN
F 2 "" H 1950 4350 50  0001 C CNN
F 3 "" H 1950 4350 50  0001 C CNN
	1    1950 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5CE043E7
P 2850 6200
F 0 "#PWR010" H 2850 5950 50  0001 C CNN
F 1 "GND" H 2855 6027 50  0000 C CNN
F 2 "" H 2850 6200 50  0001 C CNN
F 3 "" H 2850 6200 50  0001 C CNN
	1    2850 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5CE03A37
P 2250 5300
F 0 "#PWR07" H 2250 5050 50  0001 C CNN
F 1 "GND" H 2255 5127 50  0000 C CNN
F 2 "" H 2250 5300 50  0001 C CNN
F 3 "" H 2250 5300 50  0001 C CNN
	1    2250 5300
	1    0    0    -1  
$EndComp
$Comp
L lt6231:SMA_Female Input1
U 1 1 5CDAFCCC
P 900 5800
F 0 "Input1" H 854 6038 50  0000 C CNN
F 1 "P1" H 854 5947 50  0000 C CNN
F 2 "SMA:SMA_EDGE" H 900 5800 50  0001 C CNN
F 3 "" H 900 5800 50  0000 C CNN
	1    900  5800
	-1   0    0    -1  
$EndComp
$Comp
L nl7w66:NL7WB66 U2
U 2 1 5CDAB485
P 2950 5750
F 0 "U2" H 2950 6200 50  0000 L CNN
F 1 "NL7WB66" H 2900 6100 50  0000 L CNN
F 2 "SMA:VFSOP-8" H 3100 5400 50  0001 L CNN
F 3 "" H 2950 5750 50  0001 C CNN
	2    2950 5750
	1    0    0    -1  
$EndComp
$Comp
L nl7w66:NL7WB66 U2
U 1 1 5CDAB47F
P 2350 4850
F 0 "U2" H 2350 5300 50  0000 L CNN
F 1 "NL7WB66" H 2300 5200 50  0000 L CNN
F 2 "SMA:VFSOP-8" H 2500 4500 50  0001 L CNN
F 3 "" H 2350 4850 50  0001 C CNN
	1    2350 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 4950 3450 4950
Wire Wire Line
	3450 4950 3450 5850
Connection ~ 3450 5850
Text Label 3350 1750 0    50   ~ 0
LO_I
$Comp
L power:GND #PWR017
U 1 1 5CF74ABE
P 3650 1550
F 0 "#PWR017" H 3650 1300 50  0001 C CNN
F 1 "GND" H 3655 1377 50  0000 C CNN
F 2 "" H 3650 1550 50  0001 C CNN
F 3 "" H 3650 1550 50  0001 C CNN
	1    3650 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR014
U 1 1 5CF74FED
P 3350 1650
F 0 "#PWR014" H 3350 1500 50  0001 C CNN
F 1 "+3V3" H 3200 1700 50  0000 C CNN
F 2 "" H 3350 1650 50  0001 C CNN
F 3 "" H 3350 1650 50  0001 C CNN
	1    3350 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1650 3350 1650
Wire Wire Line
	3050 1550 3100 1550
Wire Wire Line
	3100 1550 3100 1500
Wire Wire Line
	3650 1500 3650 1550
Wire Wire Line
	3100 1500 3650 1500
$Comp
L Device:L L1
U 1 1 5D064E6E
P 4550 5850
F 0 "L1" V 4740 5850 50  0000 C CNN
F 1 "100uH" V 4649 5850 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" H 4550 5850 50  0001 C CNN
F 3 "~" H 4550 5850 50  0001 C CNN
	1    4550 5850
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C5
U 1 1 5D064E74
P 4700 6000
F 0 "C5" H 4600 5900 50  0000 L CNN
F 1 "680nF" H 4815 5955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4738 5850 50  0001 C CNN
F 3 "~" H 4700 6000 50  0001 C CNN
	1    4700 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5D064E7A
P 5100 5850
F 0 "R3" V 5000 5850 50  0000 C CNN
F 1 "10k" V 5100 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5030 5850 50  0001 C CNN
F 3 "~" H 5100 5850 50  0001 C CNN
	1    5100 5850
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5D064E80
P 6000 5850
F 0 "R8" V 6100 5800 50  0000 L CNN
F 1 "51k" V 6000 5800 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5930 5850 50  0001 C CNN
F 3 "~" H 6000 5850 50  0001 C CNN
	1    6000 5850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R10
U 1 1 5D064E86
P 6550 5850
F 0 "R10" V 6650 5850 50  0000 C CNN
F 1 "1M" V 6550 5850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6480 5850 50  0001 C CNN
F 3 "~" H 6550 5850 50  0001 C CNN
	1    6550 5850
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C12
U 1 1 5D064E8C
P 6750 6000
F 0 "C12" H 6865 6046 50  0000 L CNN
F 1 "1nF" H 6865 5955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6788 5850 50  0001 C CNN
F 3 "~" H 6750 6000 50  0001 C CNN
	1    6750 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C11
U 1 1 5D064E92
P 6200 6000
F 0 "C11" H 6315 6046 50  0000 L CNN
F 1 "1nF" H 6315 5955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6238 5850 50  0001 C CNN
F 3 "~" H 6200 6000 50  0001 C CNN
	1    6200 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5D064E98
P 5300 6150
F 0 "#PWR020" H 5300 5900 50  0001 C CNN
F 1 "GND" H 5305 5977 50  0000 C CNN
F 2 "" H 5300 6150 50  0001 C CNN
F 3 "" H 5300 6150 50  0001 C CNN
	1    5300 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5D064E9E
P 4700 6150
F 0 "#PWR018" H 4700 5900 50  0001 C CNN
F 1 "GND" H 4705 5977 50  0000 C CNN
F 2 "" H 4700 6150 50  0001 C CNN
F 3 "" H 4700 6150 50  0001 C CNN
	1    4700 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5D064EA4
P 6200 6150
F 0 "#PWR025" H 6200 5900 50  0001 C CNN
F 1 "GND" H 6205 5977 50  0000 C CNN
F 2 "" H 6200 6150 50  0001 C CNN
F 3 "" H 6200 6150 50  0001 C CNN
	1    6200 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5D064EAA
P 5300 6000
F 0 "C8" H 5200 5900 50  0000 L CNN
F 1 "10nF" H 5400 6000 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5338 5850 50  0001 C CNN
F 3 "~" H 5300 6000 50  0001 C CNN
	1    5300 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5D064EB0
P 6750 6150
F 0 "#PWR028" H 6750 5900 50  0001 C CNN
F 1 "GND" H 6755 5977 50  0000 C CNN
F 2 "" H 6750 6150 50  0001 C CNN
F 3 "" H 6750 6150 50  0001 C CNN
	1    6750 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 5850 5300 5850
Connection ~ 5300 5850
Wire Wire Line
	6150 5850 6200 5850
Connection ~ 6200 5850
Wire Wire Line
	6700 5850 6750 5850
$Comp
L power:GND #PWR022
U 1 1 5D064EBB
P 5700 6150
F 0 "#PWR022" H 5700 5900 50  0001 C CNN
F 1 "GND" H 5705 5977 50  0000 C CNN
F 2 "" H 5700 6150 50  0001 C CNN
F 3 "" H 5700 6150 50  0001 C CNN
	1    5700 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5D064EC1
P 5700 6000
F 0 "R5" H 5770 6046 50  0000 L CNN
F 1 "30k" V 5700 5950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5630 6000 50  0001 C CNN
F 3 "~" H 5700 6000 50  0001 C CNN
	1    5700 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 5850 4950 5850
Connection ~ 4700 5850
Wire Wire Line
	6200 5850 6400 5850
Wire Wire Line
	6750 5850 7400 5850
Connection ~ 6750 5850
Connection ~ 5700 5850
Wire Wire Line
	5700 5850 5850 5850
Wire Wire Line
	5300 5850 5700 5850
Wire Wire Line
	7300 6050 7400 6050
Wire Wire Line
	7300 6400 7300 6050
Wire Wire Line
	8000 6400 7300 6400
Wire Wire Line
	8000 5950 8000 6400
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J1
U 1 1 5CD97501
P 9750 2150
F 0 "J1" H 9750 3200 50  0000 L CNN
F 1 "GPIO Header" H 9550 3300 50  0000 L CNN
F 2 "SMA:Raspberry_Pi_Zero_Socketed_THT_FaceDown_MountingHoles" H 8700 3400 50  0000 L CNN
F 3 "~" H 9750 2150 50  0001 C CNN
	1    9750 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4000 5700 4000
Wire Wire Line
	5700 4000 5850 4000
Connection ~ 5700 4000
Connection ~ 6750 4000
Wire Wire Line
	6750 4000 7400 4000
Wire Wire Line
	6200 4000 6400 4000
Connection ~ 4700 4000
Wire Wire Line
	4700 4000 4950 4000
$Comp
L Device:R R9
U 1 1 5CFA4DF6
P 5700 4150
F 0 "R9" H 5770 4196 50  0000 L CNN
F 1 "30k" V 5700 4100 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5630 4150 50  0001 C CNN
F 3 "~" H 5700 4150 50  0001 C CNN
	1    5700 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5CFAB44B
P 5700 4300
F 0 "#PWR026" H 5700 4050 50  0001 C CNN
F 1 "GND" H 5705 4127 50  0000 C CNN
F 2 "" H 5700 4300 50  0001 C CNN
F 3 "" H 5700 4300 50  0001 C CNN
	1    5700 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 4000 6750 4000
Connection ~ 6200 4000
Wire Wire Line
	6150 4000 6200 4000
Connection ~ 5300 4000
Wire Wire Line
	5250 4000 5300 4000
$Comp
L power:GND #PWR030
U 1 1 5CFEB214
P 6750 4300
F 0 "#PWR030" H 6750 4050 50  0001 C CNN
F 1 "GND" H 6755 4127 50  0000 C CNN
F 2 "" H 6750 4300 50  0001 C CNN
F 3 "" H 6750 4300 50  0001 C CNN
	1    6750 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C10
U 1 1 5CFA46E0
P 5300 4150
F 0 "C10" H 5200 4050 50  0000 L CNN
F 1 "10nF" H 5400 4150 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5338 4000 50  0001 C CNN
F 3 "~" H 5300 4150 50  0001 C CNN
	1    5300 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR029
U 1 1 5CFAA177
P 6200 4300
F 0 "#PWR029" H 6200 4050 50  0001 C CNN
F 1 "GND" H 6205 4127 50  0000 C CNN
F 2 "" H 6200 4300 50  0001 C CNN
F 3 "" H 6200 4300 50  0001 C CNN
	1    6200 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5CFA8E5F
P 4700 4300
F 0 "#PWR021" H 4700 4050 50  0001 C CNN
F 1 "GND" H 4705 4127 50  0000 C CNN
F 2 "" H 4700 4300 50  0001 C CNN
F 3 "" H 4700 4300 50  0001 C CNN
	1    4700 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5CFA78D9
P 5300 4300
F 0 "#PWR024" H 5300 4050 50  0001 C CNN
F 1 "GND" H 5305 4127 50  0000 C CNN
F 2 "" H 5300 4300 50  0001 C CNN
F 3 "" H 5300 4300 50  0001 C CNN
	1    5300 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 5CFA701B
P 6200 4150
F 0 "C13" H 6315 4196 50  0000 L CNN
F 1 "1nF" H 6315 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6238 4000 50  0001 C CNN
F 3 "~" H 6200 4150 50  0001 C CNN
	1    6200 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 5CFA66B7
P 6750 4150
F 0 "C14" H 6865 4196 50  0000 L CNN
F 1 "1nF" H 6865 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6788 4000 50  0001 C CNN
F 3 "~" H 6750 4150 50  0001 C CNN
	1    6750 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5CFA5DA8
P 6550 4000
F 0 "R12" V 6650 4000 50  0000 C CNN
F 1 "1M" V 6550 4000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6480 4000 50  0001 C CNN
F 3 "~" H 6550 4000 50  0001 C CNN
	1    6550 4000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R11
U 1 1 5CFA5522
P 6000 4000
F 0 "R11" V 6100 3950 50  0000 L CNN
F 1 "51k" V 6000 3950 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5930 4000 50  0001 C CNN
F 3 "~" H 6000 4000 50  0001 C CNN
	1    6000 4000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 5CFA3EDB
P 5100 4000
F 0 "R7" V 5000 4000 50  0000 C CNN
F 1 "10k" V 5100 4000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5030 4000 50  0001 C CNN
F 3 "~" H 5100 4000 50  0001 C CNN
	1    5100 4000
	0    1    1    0   
$EndComp
$Comp
L Device:C C9
U 1 1 5CFA3751
P 4700 4150
F 0 "C9" H 4600 4050 50  0000 L CNN
F 1 "680nF" H 4815 4105 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4738 4000 50  0001 C CNN
F 3 "~" H 4700 4150 50  0001 C CNN
	1    4700 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:L L2
U 1 1 5CFA2F1F
P 4550 4000
F 0 "L2" V 4740 4000 50  0000 C CNN
F 1 "100uH" V 4649 4000 50  0000 C CNN
F 2 "Inductor_SMD:L_0805_2012Metric" H 4550 4000 50  0001 C CNN
F 3 "~" H 4550 4000 50  0001 C CNN
	1    4550 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2550 3100 2150 3100
Wire Wire Line
	2150 2100 2150 3100
Wire Wire Line
	3250 3100 4050 3100
Wire Wire Line
	7300 4200 7400 4200
Wire Wire Line
	7300 4550 7300 4200
Wire Wire Line
	8000 4550 7300 4550
Wire Wire Line
	8000 4100 8000 4550
Connection ~ 4050 4000
Wire Wire Line
	4050 4000 4050 3100
Wire Wire Line
	3850 4000 4050 4000
$Comp
L Device:C C7
U 1 1 5CE2E18B
P 4050 4150
F 0 "C7" H 4200 4250 50  0000 C CNN
F 1 ".005uF" H 3800 4250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4088 4000 50  0001 C CNN
F 3 "~" H 4050 4150 50  0001 C CNN
	1    4050 4150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5CE3D493
P 4050 4300
F 0 "#PWR019" H 4050 4050 50  0001 C CNN
F 1 "GND" H 4055 4127 50  0000 C CNN
F 2 "" H 4050 4300 50  0001 C CNN
F 3 "" H 4050 4300 50  0001 C CNN
	1    4050 4300
	1    0    0    -1  
$EndComp
$Comp
L nl7w66:NL7WB66 U3
U 2 1 5CDA7011
P 3550 3900
F 0 "U3" H 3550 4350 50  0000 L CNN
F 1 "NL7WB66" H 3500 4250 50  0000 L CNN
F 2 "SMA:VFSOP-8" H 3700 3550 50  0001 L CNN
F 3 "" H 3550 3900 50  0001 C CNN
	2    3550 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5CE03500
P 3450 4350
F 0 "#PWR016" H 3450 4100 50  0001 C CNN
F 1 "GND" H 3455 4177 50  0000 C CNN
F 2 "" H 3450 4350 50  0001 C CNN
F 3 "" H 3450 4350 50  0001 C CNN
	1    3450 4350
	1    0    0    -1  
$EndComp
Text Label 2550 2900 2    50   ~ 0
LO_I
Text Label 3150 3800 2    50   ~ 0
LO_I
Connection ~ 2850 2500
Wire Wire Line
	2850 2550 2850 2500
$Comp
L power:+3V3 #PWR011
U 1 1 5CE0F72B
P 2850 2500
F 0 "#PWR011" H 2850 2350 50  0001 C CNN
F 1 "+3V3" H 2950 2650 50  0000 C CNN
F 2 "" H 2850 2500 50  0001 C CNN
F 3 "" H 2850 2500 50  0001 C CNN
	1    2850 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR015
U 1 1 5CE0E9A8
P 3450 3450
F 0 "#PWR015" H 3450 3300 50  0001 C CNN
F 1 "+3V3" H 3465 3623 50  0000 C CNN
F 2 "" H 3450 3450 50  0001 C CNN
F 3 "" H 3450 3450 50  0001 C CNN
	1    3450 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5CE06BAE
P 2700 2500
F 0 "C3" V 2448 2500 50  0000 C CNN
F 1 "0.1uF" V 2539 2500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2738 2350 50  0001 C CNN
F 3 "~" H 2700 2500 50  0001 C CNN
	1    2700 2500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5CE04E3C
P 2550 2500
F 0 "#PWR08" H 2550 2250 50  0001 C CNN
F 1 "GND" H 2450 2500 50  0000 C CNN
F 2 "" H 2550 2500 50  0001 C CNN
F 3 "" H 2550 2500 50  0001 C CNN
	1    2550 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5CE01CAD
P 2850 3450
F 0 "#PWR012" H 2850 3200 50  0001 C CNN
F 1 "GND" H 2855 3277 50  0000 C CNN
F 2 "" H 2850 3450 50  0001 C CNN
F 3 "" H 2850 3450 50  0001 C CNN
	1    2850 3450
	1    0    0    -1  
$EndComp
$Comp
L nl7w66:NL7WB66 U3
U 1 1 5CDA61D0
P 2950 3000
F 0 "U3" H 2950 3450 50  0000 L CNN
F 1 "NL7WB66" H 2900 3350 50  0000 L CNN
F 2 "SMA:VFSOP-8" H 3100 2650 50  0001 L CNN
F 3 "" H 2950 3000 50  0001 C CNN
	1    2950 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 1450 3800 2100
Wire Wire Line
	3800 2100 2150 2100
Text Notes 9000 750  0    157  ~ 0
RPi-Zero GPIO
$Comp
L Connector_edit:AudioJack3 J2
U 1 1 5D154F76
P 9350 4200
F 0 "J2" H 9070 4133 50  0000 R CNN
F 1 "Signal_Out" H 9070 4224 50  0000 R CNN
F 2 "SMA:Tayda_3.5mm_stereo_TRS_jack_A-853" H 9350 4200 50  0001 C CNN
F 3 "~" H 9350 4200 50  0001 C CNN
	1    9350 4200
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 5D164434
P 8900 4050
F 0 "#PWR036" H 8900 3800 50  0001 C CNN
F 1 "GND" H 8750 4000 50  0000 C CNN
F 2 "" H 8900 4050 50  0001 C CNN
F 3 "" H 8900 4050 50  0001 C CNN
	1    8900 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR032
U 1 1 5D16FC14
P 8950 5900
F 0 "#PWR032" H 8950 5650 50  0001 C CNN
F 1 "GND" H 9050 5900 50  0000 C CNN
F 2 "" H 8950 5900 50  0001 C CNN
F 3 "" H 8950 5900 50  0001 C CNN
	1    8950 5900
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5D1891B5
P 9150 1250
F 0 "#FLG01" H 9150 1325 50  0001 C CNN
F 1 "PWR_FLAG" H 9150 1423 50  0000 C CNN
F 2 "" H 9150 1250 50  0001 C CNN
F 3 "~" H 9150 1250 50  0001 C CNN
	1    9150 1250
	-1   0    0    1   
$EndComp
Text Label 9550 1450 2    50   ~ 0
SCL
Text Label 9550 1350 2    50   ~ 0
SDA
Wire Wire Line
	9150 1250 9550 1250
$Comp
L power:+3V3 #PWR035
U 1 1 5D1A4DE9
P 9150 1250
F 0 "#PWR035" H 9150 1100 50  0001 C CNN
F 1 "+3V3" H 9165 1423 50  0000 C CNN
F 2 "" H 9150 1250 50  0001 C CNN
F 3 "" H 9150 1250 50  0001 C CNN
	1    9150 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR038
U 1 1 5D1A733D
P 9350 2050
F 0 "#PWR038" H 9350 1900 50  0001 C CNN
F 1 "+3V3" H 9365 2223 50  0000 C CNN
F 2 "" H 9350 2050 50  0001 C CNN
F 3 "" H 9350 2050 50  0001 C CNN
	1    9350 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 2050 9550 2050
$Comp
L power:GND #PWR037
U 1 1 5D1AC243
P 9200 1650
F 0 "#PWR037" H 9200 1400 50  0001 C CNN
F 1 "GND" H 9205 1477 50  0000 C CNN
F 2 "" H 9200 1650 50  0001 C CNN
F 3 "" H 9200 1650 50  0001 C CNN
	1    9200 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 1650 9550 1650
NoConn ~ 9550 1550
NoConn ~ 10050 1550
NoConn ~ 10050 1650
NoConn ~ 10050 1750
NoConn ~ 10050 1850
NoConn ~ 10050 1950
NoConn ~ 10050 2050
NoConn ~ 10050 2150
NoConn ~ 10050 2250
NoConn ~ 10050 2350
NoConn ~ 10050 2450
NoConn ~ 10050 2550
NoConn ~ 10050 2650
NoConn ~ 10050 2750
NoConn ~ 10050 2850
NoConn ~ 10050 3150
NoConn ~ 10050 3050
NoConn ~ 10050 2950
NoConn ~ 9550 3150
NoConn ~ 9550 3050
NoConn ~ 9550 2950
NoConn ~ 9550 2850
NoConn ~ 9550 2750
NoConn ~ 9550 2650
NoConn ~ 9550 2550
NoConn ~ 9550 2450
NoConn ~ 9550 2350
NoConn ~ 9550 2250
NoConn ~ 9550 2150
NoConn ~ 9550 1950
NoConn ~ 9550 1850
NoConn ~ 9550 1750
$Comp
L power:GND #PWR039
U 1 1 5D18E6DE
P 10800 1550
F 0 "#PWR039" H 10800 1300 50  0001 C CNN
F 1 "GND" H 10805 1377 50  0000 C CNN
F 2 "" H 10800 1550 50  0001 C CNN
F 3 "" H 10800 1550 50  0001 C CNN
	1    10800 1550
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5D1FA915
P 10800 1550
F 0 "#FLG0101" H 10800 1625 50  0001 C CNN
F 1 "PWR_FLAG" H 10800 1723 50  0000 C CNN
F 2 "" H 10800 1550 50  0001 C CNN
F 3 "~" H 10800 1550 50  0001 C CNN
	1    10800 1550
	1    0    0    -1  
$EndComp
Connection ~ 10800 1550
$Comp
L power:GND #PWR0101
U 1 1 5D1FB929
P 900 6000
F 0 "#PWR0101" H 900 5750 50  0001 C CNN
F 1 "GND" H 905 5827 50  0000 C CNN
F 2 "" H 900 6000 50  0001 C CNN
F 3 "" H 900 6000 50  0001 C CNN
	1    900  6000
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5D227FA2
P 3200 1750
F 0 "TP3" H 3350 1850 50  0000 R CNN
F 1 "LO_I" H 3142 1867 50  0000 R CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 3400 1750 50  0001 C CNN
F 3 "~" H 3400 1750 50  0001 C CNN
	1    3200 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	3050 1750 3200 1750
Wire Wire Line
	3200 1750 3350 1750
Connection ~ 3200 1750
$Comp
L Connector:TestPoint TP2
U 1 1 5D224FFE
P 3150 1450
F 0 "TP2" H 3150 1650 50  0000 L CNN
F 1 "REF" H 3200 1550 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 3350 1450 50  0001 C CNN
F 3 "~" H 3350 1450 50  0001 C CNN
	1    3150 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 5D2473F3
P 1700 6200
F 0 "R14" V 1800 6200 50  0000 C CNN
F 1 "220k" V 1700 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1630 6200 50  0001 C CNN
F 3 "~" H 1700 6200 50  0001 C CNN
	1    1700 6200
	0    1    1    0   
$EndComp
$Comp
L Device:R R13
U 1 1 5D247D15
P 1200 5950
F 0 "R13" H 1270 5996 50  0000 L CNN
F 1 "56" V 1200 5900 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1130 5950 50  0001 C CNN
F 3 "~" H 1200 5950 50  0001 C CNN
	1    1200 5950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5D248E40
P 2100 6200
F 0 "R15" V 2200 6200 50  0000 C CNN
F 1 "39k" V 2100 6200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2030 6200 50  0001 C CNN
F 3 "~" H 2100 6200 50  0001 C CNN
	1    2100 6200
	0    -1   1    0   
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5D24B467
P 1900 6200
F 0 "TP1" H 2050 6400 50  0000 R CNN
F 1 "Test_IN" H 1950 6500 50  0000 R CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 2100 6200 50  0001 C CNN
F 3 "~" H 2100 6200 50  0001 C CNN
	1    1900 6200
	-1   0    0    1   
$EndComp
$Comp
L Device:C C15
U 1 1 5D250F10
P 1550 5800
F 0 "C15" V 1298 5800 50  0000 C CNN
F 1 "1.0uF" V 1389 5800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1588 5650 50  0001 C CNN
F 3 "~" H 1550 5800 50  0001 C CNN
	1    1550 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 5800 1200 5800
Wire Wire Line
	1200 5800 1400 5800
Connection ~ 1200 5800
Wire Wire Line
	1900 5800 1900 6200
Wire Wire Line
	1700 5800 1900 5800
Wire Wire Line
	1850 6200 1900 6200
Wire Wire Line
	1900 6200 1950 6200
Connection ~ 1900 6200
$Comp
L power:GND #PWR041
U 1 1 5D29BD42
P 1550 6250
F 0 "#PWR041" H 1550 6000 50  0001 C CNN
F 1 "GND" H 1555 6077 50  0000 C CNN
F 2 "" H 1550 6250 50  0001 C CNN
F 3 "" H 1550 6250 50  0001 C CNN
	1    1550 6250
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR042
U 1 1 5D29F278
P 2250 6200
F 0 "#PWR042" H 2250 6050 50  0001 C CNN
F 1 "+3V3" H 2265 6373 50  0000 C CNN
F 2 "" H 2250 6200 50  0001 C CNN
F 3 "" H 2250 6200 50  0001 C CNN
	1    2250 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 6250 1550 6200
Wire Wire Line
	1900 5800 1900 4950
Connection ~ 1900 5800
Wire Wire Line
	1900 4950 1950 4950
Wire Wire Line
	1900 5800 2150 5800
Wire Wire Line
	2150 5800 2150 5850
Wire Wire Line
	2150 5850 2550 5850
$Comp
L power:GND #PWR040
U 1 1 5D2AB818
P 1200 6100
F 0 "#PWR040" H 1200 5850 50  0001 C CNN
F 1 "GND" H 1205 5927 50  0000 C CNN
F 2 "" H 1200 6100 50  0001 C CNN
F 3 "" H 1200 6100 50  0001 C CNN
	1    1200 6100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5CDCE61E
P 5050 1500
F 0 "#PWR023" H 5050 1250 50  0001 C CNN
F 1 "GND" H 5055 1327 50  0000 C CNN
F 2 "" H 5050 1500 50  0001 C CNN
F 3 "" H 5050 1500 50  0001 C CNN
	1    5050 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5CDCE1E3
P 5050 1350
F 0 "R6" H 5120 1396 50  0000 L CNN
F 1 "R" H 5150 1300 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4980 1350 50  0001 C CNN
F 3 "~" H 5050 1350 50  0001 C CNN
	1    5050 1350
	1    0    0    -1  
$EndComp
Text Notes 9400 4850 0    157  ~ 0
Out to\nSoundcard
Text Notes 8200 5000 2    157  ~ 0
Low Pass Filter and Buffer Amps
Text Notes 6950 5200 2    79   ~ 0
LPF has cutoff frequency of 500 Hz
Text Notes 2050 3950 2    157  ~ 0
Sampling\nDown\nConverters
Text Notes 1700 5400 2    157  ~ 0
Input Port
Wire Wire Line
	2150 3100 2150 3550
Wire Wire Line
	2150 3550 2600 3550
Wire Wire Line
	2600 3550 2600 4000
Wire Wire Line
	2600 4000 3150 4000
Connection ~ 2150 3100
Wire Wire Line
	3450 5850 4400 5850
Wire Wire Line
	4050 4000 4400 4000
Wire Wire Line
	8450 5950 8000 5950
$Comp
L Connector:TestPoint TP5
U 1 1 5D36C93A
P 10250 5800
F 0 "TP5" H 10400 6000 50  0000 R CNN
F 1 "GND2" H 10300 6100 50  0000 R CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 10450 5800 50  0001 C CNN
F 3 "~" H 10450 5800 50  0001 C CNN
	1    10250 5800
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5D36F7A6
P 9800 5800
F 0 "TP4" H 9950 6000 50  0000 R CNN
F 1 "GND1" H 9850 6100 50  0000 R CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 10000 5800 50  0001 C CNN
F 3 "~" H 10000 5800 50  0001 C CNN
	1    9800 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR043
U 1 1 5D373618
P 9800 5800
F 0 "#PWR043" H 9800 5550 50  0001 C CNN
F 1 "GND" H 9900 5800 50  0000 C CNN
F 2 "" H 9800 5800 50  0001 C CNN
F 3 "" H 9800 5800 50  0001 C CNN
	1    9800 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR044
U 1 1 5D3764A1
P 10250 5800
F 0 "#PWR044" H 10250 5550 50  0001 C CNN
F 1 "GND" H 10350 5800 50  0000 C CNN
F 2 "" H 10250 5800 50  0001 C CNN
F 3 "" H 10250 5800 50  0001 C CNN
	1    10250 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1450 3150 1450
Connection ~ 3150 1450
Wire Wire Line
	3150 1450 3800 1450
Wire Wire Line
	8450 4300 9150 4300
Wire Wire Line
	8450 4300 8450 5950
Wire Wire Line
	9150 4200 8450 4200
Wire Wire Line
	8450 4200 8450 4100
Wire Wire Line
	8450 4100 8000 4100
Wire Wire Line
	8900 4050 9150 4050
Wire Wire Line
	9150 4050 9150 4100
$Comp
L power:+5V #PWR045
U 1 1 5CDDE1F7
P 10200 1250
F 0 "#PWR045" H 10200 1100 50  0001 C CNN
F 1 "+5V" H 10215 1423 50  0000 C CNN
F 2 "" H 10200 1250 50  0001 C CNN
F 3 "" H 10200 1250 50  0001 C CNN
	1    10200 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 1350 10200 1350
Wire Wire Line
	10200 1350 10200 1250
Wire Wire Line
	10200 1250 10050 1250
Connection ~ 10200 1250
$Comp
L power:PWR_FLAG #FLG02
U 1 1 5CDE8352
P 10550 1250
F 0 "#FLG02" H 10550 1325 50  0001 C CNN
F 1 "PWR_FLAG" H 10550 1423 50  0000 C CNN
F 2 "" H 10550 1250 50  0001 C CNN
F 3 "~" H 10550 1250 50  0001 C CNN
	1    10550 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 1250 10550 1250
Wire Wire Line
	10200 1550 10200 1450
Wire Wire Line
	10200 1450 10050 1450
Wire Wire Line
	10200 1550 10800 1550
$Comp
L power:+5V #PWR033
U 1 1 5CDFAB83
P 8950 5300
F 0 "#PWR033" H 8950 5150 50  0001 C CNN
F 1 "+5V" H 8965 5473 50  0000 C CNN
F 2 "" H 8950 5300 50  0001 C CNN
F 3 "" H 8950 5300 50  0001 C CNN
	1    8950 5300
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM2904 U4
U 1 1 5CDD2347
P 7700 4100
F 0 "U4" H 7700 4467 50  0000 C CNN
F 1 "LM2904" H 7700 4376 50  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 7700 4100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm358.pdf" H 7700 4100 50  0001 C CNN
	1    7700 4100
	1    0    0    -1  
$EndComp
Connection ~ 8000 4100
$Comp
L Amplifier_Operational:LM2904 U4
U 2 1 5CDD3FB2
P 7700 5950
F 0 "U4" H 7700 6317 50  0000 C CNN
F 1 "LM2904" H 7700 6226 50  0000 C CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 7700 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm358.pdf" H 7700 5950 50  0001 C CNN
	2    7700 5950
	1    0    0    -1  
$EndComp
Connection ~ 8000 5950
$Comp
L Amplifier_Operational:LM2904 U4
U 3 1 5CDD5862
P 9050 5600
F 0 "U4" H 9008 5646 50  0000 L CNN
F 1 "LM2904" H 9008 5555 50  0000 L CNN
F 2 "Package_SO:SO-8_3.9x4.9mm_P1.27mm" H 9050 5600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm358.pdf" H 9050 5600 50  0001 C CNN
	3    9050 5600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
