EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L teensy:Teensy3.6 U1
U 1 1 5C635DB1
P 9000 3450
F 0 "U1" H 9000 5837 60  0000 C CNN
F 1 "Teensy3.6" H 9000 5731 60  0000 C CNN
F 2 "teensy:Teensy35_36" H 9000 3450 60  0001 C CNN
F 3 "" H 9000 3450 60  0000 C CNN
	1    9000 3450
	1    0    0    -1  
$EndComp
$Comp
L BNO055:BNO055 IMU1
U 1 1 5C635E4D
P 2950 5650
F 0 "IMU1" H 2950 6417 50  0000 C CNN
F 1 "BNO055" H 2950 6326 50  0000 C CNN
F 2 "BNO055:LGA28R50P4X10_380X520X100" H 2950 5650 50  0001 L BNN
F 3 "Unavailable" H 2950 5650 50  0001 L BNN
F 4 "LGA-28 Bosch" H 2950 5650 50  0001 L BNN "Field4"
F 5 "None" H 2950 5650 50  0001 L BNN "Field5"
F 6 "BNO055" H 2950 5650 50  0001 L BNN "Field6"
F 7 "BNO055 9-axis Absolute Orientation Sensor _ SiP _ w/Sensors and Sensor Fusion" H 2950 5650 50  0001 L BNN "Field7"
F 8 "Bosch" H 2950 5650 50  0001 L BNN "Field8"
	1    2950 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED PWR1
U 1 1 5C635F55
P 2350 1200
F 0 "PWR1" H 2342 945 50  0000 C CNN
F 1 "LED" H 2342 1036 50  0000 C CNN
F 2 "LEDs:LED_1206_HandSoldering" H 2350 1200 50  0001 C CNN
F 3 "~" H 2350 1200 50  0001 C CNN
	1    2350 1200
	-1   0    0    1   
$EndComp
$Comp
L Device:R R1
U 1 1 5C635FD8
P 850 5150
F 0 "R1" H 780 5104 50  0000 R CNN
F 1 "10k" H 780 5195 50  0000 R CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 780 5150 50  0001 C CNN
F 3 "~" H 850 5150 50  0001 C CNN
	1    850  5150
	-1   0    0    1   
$EndComp
$Comp
L Device:C C6
U 1 1 5C636018
P 2600 2000
F 0 "C6" H 2715 2046 50  0000 L CNN
F 1 "1u" H 2715 1955 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2638 1850 50  0001 C CNN
F 3 "~" H 2600 2000 50  0001 C CNN
	1    2600 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal OSC1
U 1 1 5C63607B
P 2900 6900
F 0 "OSC1" H 2900 7168 50  0000 C CNN
F 1 "32.768kHz" H 2900 7077 50  0000 C CNN
F 2 "Crystals:Crystal_SMD_2012-2pin_2.0x1.2mm" H 2900 6900 50  0001 C CNN
F 3 "~" H 2900 6900 50  0001 C CNN
	1    2900 6900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 POWER1
U 1 1 5C63610D
P 1150 1150
F 0 "POWER1" H 1230 1142 50  0000 L CNN
F 1 "Conn_01x02" H 1230 1051 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1150 1150 50  0001 C CNN
F 3 "~" H 1150 1150 50  0001 C CNN
	1    1150 1150
	1    0    0    -1  
$EndComp
$Comp
L LDL1117S50R:LDL1117S50R IC1
U 1 1 5C6361C0
P 1000 1700
F 0 "IC1" H 1650 1965 50  0000 C CNN
F 1 "LDL1117S50R" H 1650 1874 50  0000 C CNN
F 2 "LDL1117S50R:SOT230P700X180-4N" H 2150 1800 50  0001 L CNN
F 3 "http://www.farnell.com/datasheets/2259188.pdf" H 2150 1700 50  0001 L CNN
F 4 "STMICROELECTRONICS - LDL1117S50R - LDO, FIXED, 5V, 1.2A, SOT-223-3" H 2150 1600 50  0001 L CNN "Description"
F 5 "1.8" H 2150 1500 50  0001 L CNN "Height"
F 6 "STMicroelectronics" H 2150 1400 50  0001 L CNN "Manufacturer_Name"
F 7 "LDL1117S50R" H 2150 1300 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 2150 1200 50  0001 L CNN "RS Part Number"
F 9 "" H 2150 1100 50  0001 L CNN "RS Price/Stock"
F 10 "511-LDL1117S50R" H 2150 1000 50  0001 L CNN "Mouser Part Number"
F 11 "https://www.mouser.com/Search/Refine.aspx?Keyword=511-LDL1117S50R" H 2150 900 50  0001 L CNN "Mouser Price/Stock"
	1    1000 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5C63626D
P 950 1250
F 0 "#PWR05" H 950 1000 50  0001 C CNN
F 1 "GND" V 955 1122 50  0000 R CNN
F 2 "" H 950 1250 50  0001 C CNN
F 3 "" H 950 1250 50  0001 C CNN
	1    950  1250
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR04
U 1 1 5C6362C9
P 950 1150
F 0 "#PWR04" H 950 1000 50  0001 C CNN
F 1 "VCC" V 968 1277 50  0000 L CNN
F 2 "" H 950 1150 50  0001 C CNN
F 3 "" H 950 1150 50  0001 C CNN
	1    950  1150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5C636687
P 1000 1700
F 0 "#PWR06" H 1000 1450 50  0001 C CNN
F 1 "GND" V 1005 1572 50  0000 R CNN
F 2 "" H 1000 1700 50  0001 C CNN
F 3 "" H 1000 1700 50  0001 C CNN
	1    1000 1700
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR020
U 1 1 5C6366A2
P 2650 1700
F 0 "#PWR020" H 2650 1550 50  0001 C CNN
F 1 "VCC" V 2667 1828 50  0000 L CNN
F 2 "" H 2650 1700 50  0001 C CNN
F 3 "" H 2650 1700 50  0001 C CNN
	1    2650 1700
	0    1    1    0   
$EndComp
Wire Wire Line
	2650 1700 2600 1700
$Comp
L Device:C C3
U 1 1 5C6367C1
P 1650 2200
F 0 "C3" H 1765 2246 50  0000 L CNN
F 1 "4.7u" H 1765 2155 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1688 2050 50  0001 C CNN
F 3 "~" H 1650 2200 50  0001 C CNN
	1    1650 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 1850 2600 1700
Connection ~ 2600 1700
Wire Wire Line
	2600 1700 2300 1700
$Comp
L power:GND #PWR019
U 1 1 5C63684F
P 2600 2150
F 0 "#PWR019" H 2600 1900 50  0001 C CNN
F 1 "GND" H 2605 1977 50  0000 C CNN
F 2 "" H 2600 2150 50  0001 C CNN
F 3 "" H 2600 2150 50  0001 C CNN
	1    2600 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 1800 2300 2050
Wire Wire Line
	2300 2050 1650 2050
Wire Wire Line
	1000 2050 1000 1800
Connection ~ 1650 2050
Wire Wire Line
	1650 2050 1000 2050
$Comp
L power:GND #PWR011
U 1 1 5C6368EE
P 1650 2350
F 0 "#PWR011" H 1650 2100 50  0001 C CNN
F 1 "GND" H 1655 2177 50  0000 C CNN
F 2 "" H 1650 2350 50  0001 C CNN
F 3 "" H 1650 2350 50  0001 C CNN
	1    1650 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5C636961
P 1000 1800
F 0 "#PWR07" H 1000 1650 50  0001 C CNN
F 1 "+5V" V 1015 1928 50  0000 L CNN
F 2 "" H 1000 1800 50  0001 C CNN
F 3 "" H 1000 1800 50  0001 C CNN
	1    1000 1800
	0    -1   -1   0   
$EndComp
Connection ~ 1000 1800
Text Notes 600  850  0    197  ~ 0
POWER
$Comp
L Device:R R3
U 1 1 5C636F8B
P 2650 1200
F 0 "R3" V 2443 1200 50  0000 C CNN
F 1 "1k" V 2534 1200 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2580 1200 50  0001 C CNN
F 3 "~" H 2650 1200 50  0001 C CNN
	1    2650 1200
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 5C63705E
P 2200 1200
F 0 "#PWR017" H 2200 1050 50  0001 C CNN
F 1 "+5V" V 2215 1328 50  0000 L CNN
F 2 "" H 2200 1200 50  0001 C CNN
F 3 "" H 2200 1200 50  0001 C CNN
	1    2200 1200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5C6370A5
P 2800 1200
F 0 "#PWR021" H 2800 950 50  0001 C CNN
F 1 "GND" V 2805 1072 50  0000 R CNN
F 2 "" H 2800 1200 50  0001 C CNN
F 3 "" H 2800 1200 50  0001 C CNN
	1    2800 1200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR043
U 1 1 5C637684
P 8000 1350
F 0 "#PWR043" H 8000 1100 50  0001 C CNN
F 1 "GND" V 8005 1222 50  0000 R CNN
F 2 "" H 8000 1350 50  0001 C CNN
F 3 "" H 8000 1350 50  0001 C CNN
	1    8000 1350
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR049
U 1 1 5C6377A7
P 10000 4650
F 0 "#PWR049" H 10000 4500 50  0001 C CNN
F 1 "+5V" V 10015 4778 50  0000 L CNN
F 2 "" H 10000 4650 50  0001 C CNN
F 3 "" H 10000 4650 50  0001 C CNN
	1    10000 4650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR046
U 1 1 5C637884
P 10000 2550
F 0 "#PWR046" H 10000 2300 50  0001 C CNN
F 1 "GND" V 10005 2422 50  0000 R CNN
F 2 "" H 10000 2550 50  0001 C CNN
F 3 "" H 10000 2550 50  0001 C CNN
	1    10000 2550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR047
U 1 1 5C637939
P 10000 3750
F 0 "#PWR047" H 10000 3500 50  0001 C CNN
F 1 "GND" V 10005 3622 50  0000 R CNN
F 2 "" H 10000 3750 50  0001 C CNN
F 3 "" H 10000 3750 50  0001 C CNN
	1    10000 3750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR048
U 1 1 5C637958
P 10000 3850
F 0 "#PWR048" H 10000 3600 50  0001 C CNN
F 1 "GND" V 10005 3722 50  0000 R CNN
F 2 "" H 10000 3850 50  0001 C CNN
F 3 "" H 10000 3850 50  0001 C CNN
	1    10000 3850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR050
U 1 1 5C637A17
P 10000 4750
F 0 "#PWR050" H 10000 4500 50  0001 C CNN
F 1 "GND" V 10005 4622 50  0000 R CNN
F 2 "" H 10000 4750 50  0001 C CNN
F 3 "" H 10000 4750 50  0001 C CNN
	1    10000 4750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR045
U 1 1 5C637A36
P 8000 5150
F 0 "#PWR045" H 8000 4900 50  0001 C CNN
F 1 "GND" V 8005 5022 50  0000 R CNN
F 2 "" H 8000 5150 50  0001 C CNN
F 3 "" H 8000 5150 50  0001 C CNN
	1    8000 5150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR044
U 1 1 5C637AEB
P 8000 3950
F 0 "#PWR044" H 8000 3700 50  0001 C CNN
F 1 "GND" V 8005 3822 50  0000 R CNN
F 2 "" H 8000 3950 50  0001 C CNN
F 3 "" H 8000 3950 50  0001 C CNN
	1    8000 3950
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR051
U 1 1 5C637DB9
P 10000 4850
F 0 "#PWR051" H 10000 4700 50  0001 C CNN
F 1 "+3.3V" V 10015 4978 50  0000 L CNN
F 2 "" H 10000 4850 50  0001 C CNN
F 3 "" H 10000 4850 50  0001 C CNN
	1    10000 4850
	0    1    1    0   
$EndComp
Text Label 8000 1650 2    39   ~ 0
D1
Text Label 8000 1750 2    39   ~ 0
D2
Text Label 8000 1850 2    39   ~ 0
D3
Text Label 8000 1950 2    39   ~ 0
D4
Text Label 8000 5450 2    39   ~ 0
A1
Text Label 8000 5550 2    39   ~ 0
A2
Text Label 10000 5550 0    39   ~ 0
A3
Text Label 8000 5350 2    39   ~ 0
A0
Text Label 10000 5450 0    39   ~ 0
I2C_SDA
Text Label 10000 5350 0    39   ~ 0
I2C_SCL
Text Label 8000 1450 2    39   ~ 0
UART1_RX
Text Label 8000 1550 2    39   ~ 0
UART1_TX
Text Label 8000 2350 2    39   ~ 0
UART2_RX
Text Label 8000 2450 2    39   ~ 0
UART2_TX
Text Label 8000 2150 2    39   ~ 0
UART3_RX
Text Label 8000 2250 2    39   ~ 0
UART3_TX
NoConn ~ 8000 2050
NoConn ~ 8000 2550
NoConn ~ 8000 2650
NoConn ~ 8000 2750
NoConn ~ 8000 3250
NoConn ~ 8000 3350
NoConn ~ 8000 3450
NoConn ~ 8000 3550
NoConn ~ 8000 3650
NoConn ~ 8000 3750
NoConn ~ 8000 3850
NoConn ~ 8000 4050
NoConn ~ 8000 4150
NoConn ~ 8000 4250
NoConn ~ 8000 4350
NoConn ~ 8000 4450
NoConn ~ 8000 4550
NoConn ~ 8000 4650
NoConn ~ 8000 4750
NoConn ~ 8000 4850
NoConn ~ 8000 4950
NoConn ~ 8000 5050
NoConn ~ 8000 5250
NoConn ~ 10000 5250
NoConn ~ 10000 5150
NoConn ~ 10000 5050
NoConn ~ 10000 4950
NoConn ~ 10000 4550
NoConn ~ 10000 4450
NoConn ~ 10000 4350
NoConn ~ 10000 4250
NoConn ~ 10000 4150
NoConn ~ 10000 4050
NoConn ~ 10000 3950
NoConn ~ 10000 3650
NoConn ~ 10000 3550
NoConn ~ 10000 3450
NoConn ~ 10000 3350
NoConn ~ 10000 3250
NoConn ~ 10000 3150
NoConn ~ 10000 3050
NoConn ~ 10000 2950
NoConn ~ 10000 2850
NoConn ~ 10000 2750
NoConn ~ 10000 2650
NoConn ~ 10000 2450
NoConn ~ 10000 2350
NoConn ~ 10000 2250
NoConn ~ 10000 2150
NoConn ~ 10000 2050
NoConn ~ 10000 1950
NoConn ~ 10000 1850
NoConn ~ 10000 1750
NoConn ~ 10000 1650
NoConn ~ 10000 1550
NoConn ~ 10000 1450
NoConn ~ 10000 1350
Text Notes 7450 850  0    197  ~ 0
TEENSY
$Comp
L Connector_Generic:Conn_02x03_Counter_Clockwise 3V3
U 1 1 5C63B28A
P 5100 1350
F 0 "3V3" H 5150 1667 50  0000 C CNN
F 1 "Conn_02x03_Counter_Clockwise" H 5150 1576 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_2x03_Pitch2.54mm" H 5100 1350 50  0001 C CNN
F 3 "~" H 5100 1350 50  0001 C CNN
	1    5100 1350
	1    0    0    -1  
$EndComp
Text Notes 4150 850  0    197  ~ 0
CONN
$Comp
L power:+3.3V #PWR029
U 1 1 5C63B415
P 4900 1250
F 0 "#PWR029" H 4900 1100 50  0001 C CNN
F 1 "+3.3V" V 4915 1378 50  0000 L CNN
F 2 "" H 4900 1250 50  0001 C CNN
F 3 "" H 4900 1250 50  0001 C CNN
	1    4900 1250
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR030
U 1 1 5C63B4AE
P 4900 1350
F 0 "#PWR030" H 4900 1200 50  0001 C CNN
F 1 "+3.3V" V 4915 1478 50  0000 L CNN
F 2 "" H 4900 1350 50  0001 C CNN
F 3 "" H 4900 1350 50  0001 C CNN
	1    4900 1350
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR031
U 1 1 5C63B4CF
P 4900 1450
F 0 "#PWR031" H 4900 1300 50  0001 C CNN
F 1 "+3.3V" V 4915 1578 50  0000 L CNN
F 2 "" H 4900 1450 50  0001 C CNN
F 3 "" H 4900 1450 50  0001 C CNN
	1    4900 1450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR035
U 1 1 5C63B4F0
P 5400 1250
F 0 "#PWR035" H 5400 1000 50  0001 C CNN
F 1 "GND" V 5405 1122 50  0000 R CNN
F 2 "" H 5400 1250 50  0001 C CNN
F 3 "" H 5400 1250 50  0001 C CNN
	1    5400 1250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR036
U 1 1 5C63B511
P 5400 1350
F 0 "#PWR036" H 5400 1100 50  0001 C CNN
F 1 "GND" V 5405 1222 50  0000 R CNN
F 2 "" H 5400 1350 50  0001 C CNN
F 3 "" H 5400 1350 50  0001 C CNN
	1    5400 1350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR037
U 1 1 5C63B532
P 5400 1450
F 0 "#PWR037" H 5400 1200 50  0001 C CNN
F 1 "GND" V 5405 1322 50  0000 R CNN
F 2 "" H 5400 1450 50  0001 C CNN
F 3 "" H 5400 1450 50  0001 C CNN
	1    5400 1450
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 UART1
U 1 1 5C63B8A2
P 5150 1850
F 0 "UART1" H 5230 1892 50  0000 L CNN
F 1 "Conn_01x03" H 5230 1801 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5150 1850 50  0001 C CNN
F 3 "~" H 5150 1850 50  0001 C CNN
	1    5150 1850
	1    0    0    -1  
$EndComp
Text Label 4950 1750 2    39   ~ 0
UART1_RX
Text Label 4950 1850 2    39   ~ 0
UART1_TX
$Comp
L power:GND #PWR032
U 1 1 5C63B91E
P 4950 1950
F 0 "#PWR032" H 4950 1700 50  0001 C CNN
F 1 "GND" V 4955 1822 50  0000 R CNN
F 2 "" H 4950 1950 50  0001 C CNN
F 3 "" H 4950 1950 50  0001 C CNN
	1    4950 1950
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x03 UART2
U 1 1 5C63B941
P 5150 2200
F 0 "UART2" H 5230 2242 50  0000 L CNN
F 1 "Conn_01x03" H 5230 2151 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5150 2200 50  0001 C CNN
F 3 "~" H 5150 2200 50  0001 C CNN
	1    5150 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 UART3
U 1 1 5C63B973
P 5150 2550
F 0 "UART3" H 5230 2592 50  0000 L CNN
F 1 "Conn_01x03" H 5230 2501 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5150 2550 50  0001 C CNN
F 3 "~" H 5150 2550 50  0001 C CNN
	1    5150 2550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR033
U 1 1 5C63B9AD
P 4950 2300
F 0 "#PWR033" H 4950 2050 50  0001 C CNN
F 1 "GND" V 4955 2172 50  0000 R CNN
F 2 "" H 4950 2300 50  0001 C CNN
F 3 "" H 4950 2300 50  0001 C CNN
	1    4950 2300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR034
U 1 1 5C63B9D4
P 4950 2650
F 0 "#PWR034" H 4950 2400 50  0001 C CNN
F 1 "GND" V 4955 2522 50  0000 R CNN
F 2 "" H 4950 2650 50  0001 C CNN
F 3 "" H 4950 2650 50  0001 C CNN
	1    4950 2650
	0    1    1    0   
$EndComp
Text Label 4950 2200 2    39   ~ 0
UART2_TX
Text Label 4950 2100 2    39   ~ 0
UART2_RX
Text Label 4950 2550 2    39   ~ 0
UART3_TX
Text Label 4950 2450 2    39   ~ 0
UART3_RX
$Comp
L Connector_Generic:Conn_01x04 DIGITAL1
U 1 1 5C63BDE5
P 5150 3050
F 0 "DIGITAL1" H 5230 3042 50  0000 L CNN
F 1 "Conn_01x04" H 5230 2951 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 5150 3050 50  0001 C CNN
F 3 "~" H 5150 3050 50  0001 C CNN
	1    5150 3050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 ANALOG1
U 1 1 5C63BE80
P 5150 3500
F 0 "ANALOG1" H 5230 3492 50  0000 L CNN
F 1 "Conn_01x04" H 5230 3401 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 5150 3500 50  0001 C CNN
F 3 "~" H 5150 3500 50  0001 C CNN
	1    5150 3500
	1    0    0    -1  
$EndComp
Text Label 4950 2950 2    39   ~ 0
D1
Text Label 4950 3050 2    39   ~ 0
D2
Text Label 4950 3150 2    39   ~ 0
D3
Text Label 4950 3250 2    39   ~ 0
D4
Text Label 4950 3400 2    39   ~ 0
A0
Text Label 4950 3500 2    39   ~ 0
A1
Text Label 4950 3600 2    39   ~ 0
A2
Text Label 4950 3700 2    39   ~ 0
A3
$Comp
L Connector_Generic:Conn_01x03 I2C1
U 1 1 5C63C170
P 6250 2200
F 0 "I2C1" H 6330 2242 50  0000 L CNN
F 1 "Conn_01x03" H 6330 2151 50  0000 L CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6250 2200 50  0001 C CNN
F 3 "~" H 6250 2200 50  0001 C CNN
	1    6250 2200
	1    0    0    -1  
$EndComp
Text Label 6050 2100 2    39   ~ 0
I2C_SDA
Text Label 6050 2200 2    39   ~ 0
I2C_SCL
$Comp
L power:GND #PWR038
U 1 1 5C63C283
P 6050 2300
F 0 "#PWR038" H 6050 2050 50  0001 C CNN
F 1 "GND" V 6055 2172 50  0000 R CNN
F 2 "" H 6050 2300 50  0001 C CNN
F 3 "" H 6050 2300 50  0001 C CNN
	1    6050 2300
	0    1    1    0   
$EndComp
$Comp
L Device:LED D1
U 1 1 5C63C780
P 7200 2850
F 0 "D1" H 7192 2595 50  0000 C CNN
F 1 "LED" H 7192 2686 50  0000 C CNN
F 2 "LEDs:LED_1206_HandSoldering" H 7200 2850 50  0001 C CNN
F 3 "~" H 7200 2850 50  0001 C CNN
	1    7200 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5C63C787
P 6900 2850
F 0 "R5" V 7107 2850 50  0000 C CNN
F 1 "1k" V 7016 2850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6830 2850 50  0001 C CNN
F 3 "~" H 6900 2850 50  0001 C CNN
	1    6900 2850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR039
U 1 1 5C63C794
P 6750 2850
F 0 "#PWR039" H 6750 2600 50  0001 C CNN
F 1 "GND" V 6755 2722 50  0000 R CNN
F 2 "" H 6750 2850 50  0001 C CNN
F 3 "" H 6750 2850 50  0001 C CNN
	1    6750 2850
	0    1    1    0   
$EndComp
$Comp
L Device:LED D2
U 1 1 5C63CA1A
P 7200 3300
F 0 "D2" H 7192 3045 50  0000 C CNN
F 1 "LED" H 7192 3136 50  0000 C CNN
F 2 "LEDs:LED_1206_HandSoldering" H 7200 3300 50  0001 C CNN
F 3 "~" H 7200 3300 50  0001 C CNN
	1    7200 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5C63CA21
P 6900 3300
F 0 "R6" V 7107 3300 50  0000 C CNN
F 1 "1k" V 7016 3300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6830 3300 50  0001 C CNN
F 3 "~" H 6900 3300 50  0001 C CNN
	1    6900 3300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR040
U 1 1 5C63CA28
P 6750 3300
F 0 "#PWR040" H 6750 3050 50  0001 C CNN
F 1 "GND" V 6755 3172 50  0000 R CNN
F 2 "" H 6750 3300 50  0001 C CNN
F 3 "" H 6750 3300 50  0001 C CNN
	1    6750 3300
	0    1    1    0   
$EndComp
Wire Wire Line
	7350 2850 8000 2850
Wire Wire Line
	7350 3300 7500 3300
Wire Wire Line
	7500 3300 7500 2950
Wire Wire Line
	7500 2950 8000 2950
Text Notes 600  4600 0    197  ~ 0
IMU
$Comp
L Device:C C5
U 1 1 5C63DDFD
P 2550 7150
F 0 "C5" H 2665 7196 50  0000 L CNN
F 1 "22p" H 2665 7105 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2588 7000 50  0001 C CNN
F 3 "~" H 2550 7150 50  0001 C CNN
	1    2550 7150
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5C63DE9B
P 3250 7200
F 0 "C7" H 3365 7246 50  0000 L CNN
F 1 "22p" H 3365 7155 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3288 7050 50  0001 C CNN
F 3 "~" H 3250 7200 50  0001 C CNN
	1    3250 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5C63DEF5
P 1950 6450
F 0 "C4" H 2065 6496 50  0000 L CNN
F 1 "0.1u" H 2065 6405 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1988 6300 50  0001 C CNN
F 3 "~" H 1950 6450 50  0001 C CNN
	1    1950 6450
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5C63DF7F
P 900 7050
F 0 "C1" H 1015 7096 50  0000 L CNN
F 1 "0.1u" H 1015 7005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 938 6900 50  0001 C CNN
F 3 "~" H 900 7050 50  0001 C CNN
	1    900  7050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5C63DFF9
P 1300 7050
F 0 "C2" H 1415 7096 50  0000 L CNN
F 1 "0.1u" H 1415 7005 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1338 6900 50  0001 C CNN
F 3 "~" H 1300 7050 50  0001 C CNN
	1    1300 7050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5C63E053
P 1200 5150
F 0 "R2" H 1130 5104 50  0000 R CNN
F 1 "10k" H 1130 5195 50  0000 R CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1130 5150 50  0001 C CNN
F 3 "~" H 1200 5150 50  0001 C CNN
	1    1200 5150
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 5C63E397
P 6750 4350
F 0 "R4" H 6680 4304 50  0000 R CNN
F 1 "4.7k" H 6680 4395 50  0000 R CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6680 4350 50  0001 C CNN
F 3 "~" H 6750 4350 50  0001 C CNN
	1    6750 4350
	-1   0    0    1   
$EndComp
$Comp
L Device:R R7
U 1 1 5C63E447
P 7100 4350
F 0 "R7" H 7030 4304 50  0000 R CNN
F 1 "4.7k" H 7030 4395 50  0000 R CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7030 4350 50  0001 C CNN
F 3 "~" H 7100 4350 50  0001 C CNN
	1    7100 4350
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR042
U 1 1 5C63E912
P 7100 4200
F 0 "#PWR042" H 7100 4050 50  0001 C CNN
F 1 "+3.3V" H 7115 4373 50  0000 C CNN
F 2 "" H 7100 4200 50  0001 C CNN
F 3 "" H 7100 4200 50  0001 C CNN
	1    7100 4200
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR041
U 1 1 5C63EA0F
P 6750 4200
F 0 "#PWR041" H 6750 4050 50  0001 C CNN
F 1 "+3.3V" H 6765 4373 50  0000 C CNN
F 2 "" H 6750 4200 50  0001 C CNN
F 3 "" H 6750 4200 50  0001 C CNN
	1    6750 4200
	1    0    0    -1  
$EndComp
Text Label 7100 4500 3    39   ~ 0
I2C_SCL
Text Label 6750 4500 3    39   ~ 0
I2C_SDA
$Comp
L power:GND #PWR013
U 1 1 5C63EF38
P 2150 5150
F 0 "#PWR013" H 2150 4900 50  0001 C CNN
F 1 "GND" V 2155 5022 50  0000 R CNN
F 2 "" H 2150 5150 50  0001 C CNN
F 3 "" H 2150 5150 50  0001 C CNN
	1    2150 5150
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR023
U 1 1 5C63EF7D
P 3750 5150
F 0 "#PWR023" H 3750 5000 50  0001 C CNN
F 1 "+3.3V" V 3765 5278 50  0000 L CNN
F 2 "" H 3750 5150 50  0001 C CNN
F 3 "" H 3750 5150 50  0001 C CNN
	1    3750 5150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5C63F0D1
P 2150 5250
F 0 "#PWR014" H 2150 5000 50  0001 C CNN
F 1 "GND" V 2155 5122 50  0000 R CNN
F 2 "" H 2150 5250 50  0001 C CNN
F 3 "" H 2150 5250 50  0001 C CNN
	1    2150 5250
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR024
U 1 1 5C63F242
P 3750 5250
F 0 "#PWR024" H 3750 5100 50  0001 C CNN
F 1 "+3.3V" V 3765 5378 50  0000 L CNN
F 2 "" H 3750 5250 50  0001 C CNN
F 3 "" H 3750 5250 50  0001 C CNN
	1    3750 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	1200 5300 1200 5450
Wire Wire Line
	1200 5450 2150 5450
$Comp
L power:+3.3V #PWR08
U 1 1 5C63F56C
P 1200 5000
F 0 "#PWR08" H 1200 4850 50  0001 C CNN
F 1 "+3.3V" H 1215 5173 50  0000 C CNN
F 2 "" H 1200 5000 50  0001 C CNN
F 3 "" H 1200 5000 50  0001 C CNN
	1    1200 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  5300 850  5650
Wire Wire Line
	850  5650 2150 5650
$Comp
L power:+3.3V #PWR01
U 1 1 5C63F84C
P 850 5000
F 0 "#PWR01" H 850 4850 50  0001 C CNN
F 1 "+3.3V" H 865 5173 50  0000 C CNN
F 2 "" H 850 5000 50  0001 C CNN
F 3 "" H 850 5000 50  0001 C CNN
	1    850  5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 6300 1950 6250
Wire Wire Line
	1950 6250 2150 6250
$Comp
L power:GND #PWR012
U 1 1 5C63FC22
P 1950 6600
F 0 "#PWR012" H 1950 6350 50  0001 C CNN
F 1 "GND" H 1955 6427 50  0000 C CNN
F 2 "" H 1950 6600 50  0001 C CNN
F 3 "" H 1950 6600 50  0001 C CNN
	1    1950 6600
	1    0    0    -1  
$EndComp
Text Label 2150 5750 2    39   ~ 0
I2C_SDA
Text Label 2150 5850 2    39   ~ 0
I2C_SCL
$Comp
L power:GND #PWR015
U 1 1 5C63FFD2
P 2150 5950
F 0 "#PWR015" H 2150 5700 50  0001 C CNN
F 1 "GND" V 2155 5822 50  0000 R CNN
F 2 "" H 2150 5950 50  0001 C CNN
F 3 "" H 2150 5950 50  0001 C CNN
	1    2150 5950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5C640017
P 2150 6050
F 0 "#PWR016" H 2150 5800 50  0001 C CNN
F 1 "GND" V 2155 5922 50  0000 R CNN
F 2 "" H 2150 6050 50  0001 C CNN
F 3 "" H 2150 6050 50  0001 C CNN
	1    2150 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	2550 7000 2550 6900
Wire Wire Line
	2550 6900 2750 6900
Wire Wire Line
	3250 7050 3250 6900
$Comp
L power:GND #PWR018
U 1 1 5C6405FA
P 2550 7300
F 0 "#PWR018" H 2550 7050 50  0001 C CNN
F 1 "GND" H 2555 7127 50  0000 C CNN
F 2 "" H 2550 7300 50  0001 C CNN
F 3 "" H 2550 7300 50  0001 C CNN
	1    2550 7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5C64063F
P 3250 7350
F 0 "#PWR022" H 3250 7100 50  0001 C CNN
F 1 "GND" H 3255 7177 50  0000 C CNN
F 2 "" H 3250 7350 50  0001 C CNN
F 3 "" H 3250 7350 50  0001 C CNN
	1    3250 7350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR02
U 1 1 5C64076B
P 900 6900
F 0 "#PWR02" H 900 6750 50  0001 C CNN
F 1 "+3.3V" H 915 7073 50  0000 C CNN
F 2 "" H 900 6900 50  0001 C CNN
F 3 "" H 900 6900 50  0001 C CNN
	1    900  6900
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR09
U 1 1 5C640807
P 1300 6900
F 0 "#PWR09" H 1300 6750 50  0001 C CNN
F 1 "+3.3V" H 1315 7073 50  0000 C CNN
F 2 "" H 1300 6900 50  0001 C CNN
F 3 "" H 1300 6900 50  0001 C CNN
	1    1300 6900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5C64084C
P 900 7200
F 0 "#PWR03" H 900 6950 50  0001 C CNN
F 1 "GND" H 905 7027 50  0000 C CNN
F 2 "" H 900 7200 50  0001 C CNN
F 3 "" H 900 7200 50  0001 C CNN
	1    900  7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5C640891
P 1300 7200
F 0 "#PWR010" H 1300 6950 50  0001 C CNN
F 1 "GND" H 1305 7027 50  0000 C CNN
F 2 "" H 1300 7200 50  0001 C CNN
F 3 "" H 1300 7200 50  0001 C CNN
	1    1300 7200
	1    0    0    -1  
$EndComp
NoConn ~ 3750 5850
$Comp
L power:GND #PWR025
U 1 1 5C640F47
P 3750 5950
F 0 "#PWR025" H 3750 5700 50  0001 C CNN
F 1 "GND" V 3755 5822 50  0000 R CNN
F 2 "" H 3750 5950 50  0001 C CNN
F 3 "" H 3750 5950 50  0001 C CNN
	1    3750 5950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR026
U 1 1 5C64103A
P 3750 6050
F 0 "#PWR026" H 3750 5800 50  0001 C CNN
F 1 "GND" V 3755 5922 50  0000 R CNN
F 2 "" H 3750 6050 50  0001 C CNN
F 3 "" H 3750 6050 50  0001 C CNN
	1    3750 6050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR027
U 1 1 5C64107F
P 3750 6150
F 0 "#PWR027" H 3750 5900 50  0001 C CNN
F 1 "GND" V 3755 6022 50  0000 R CNN
F 2 "" H 3750 6150 50  0001 C CNN
F 3 "" H 3750 6150 50  0001 C CNN
	1    3750 6150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR028
U 1 1 5C6410C4
P 3750 6250
F 0 "#PWR028" H 3750 6000 50  0001 C CNN
F 1 "GND" V 3755 6122 50  0000 R CNN
F 2 "" H 3750 6250 50  0001 C CNN
F 3 "" H 3750 6250 50  0001 C CNN
	1    3750 6250
	0    -1   -1   0   
$EndComp
Text Label 2150 5350 2    39   ~ 0
XIN32
Text Label 2450 6900 2    39   ~ 0
XIN32
Wire Wire Line
	2450 6900 2550 6900
Connection ~ 2550 6900
Text Label 3750 5450 0    39   ~ 0
XOUT32
Text Label 3350 6900 0    39   ~ 0
XOUT32
Wire Wire Line
	3050 6900 3250 6900
Wire Wire Line
	3250 6900 3350 6900
Connection ~ 3250 6900
Text Label 1200 5450 2    39   ~ 0
IMU_RESET
Text Label 3750 5550 0    39   ~ 0
IMU_INT
Text Label 8000 3050 2    39   ~ 0
IMU_RESET
Text Label 8000 3150 2    39   ~ 0
IMU_INT
$EndSCHEMATC
