
�
�No debug cores found in the current design.
Before running the implement_debug_core command, either use the Set Up Debug wizard (GUI mode)
or use the create_debug_core and connect_debug_core Tcl commands to insert debug cores into the design.
154*	chipscopeZ16-241h px� 
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px� 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
22default:defaultZ30-611h px� 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0402default:default2
1122.4962default:default2
0.0002default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0502default:default2
1122.4962default:default2
0.0002default:defaultZ17-268h px� 
�

Phase %s%s
101*constraints2
1.1 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2
1.1.1 2default:default22
ParallelPlaceIOClockAndInitTop2default:defaultZ18-101h px� 
v

Phase %s%s
101*constraints2
1.1.1.1 2default:default2#
Pre-Place Cells2default:defaultZ18-101h px� 
H
3Phase 1.1.1.1 Pre-Place Cells | Checksum: 82b92040
*commonh px� 
�

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.390 . Memory (MB): peak = 1122.496 ; gain = 0.0002default:defaulth px� 
�

Phase %s%s
101*constraints2
1.1.1.2 2default:default2/
Constructing HAPIClkRuleMgr2default:defaultZ18-101h px� 
T
?Phase 1.1.1.2 Constructing HAPIClkRuleMgr | Checksum: 82b92040
*commonh px� 
�

%s
*constraints2o
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:01 . Memory (MB): peak = 1122.496 ; gain = 0.0002default:defaulth px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
z

Phase %s%s
101*constraints2
1.1.1.3 2default:default2'
IO and Clk Clean Up2default:defaultZ18-101h px� 
�

Phase %s%s
101*constraints2

1.1.1.3.1 2default:default2/
Constructing HAPIClkRuleMgr2default:defaultZ18-101h px� 
V
APhase 1.1.1.3.1 Constructing HAPIClkRuleMgr | Checksum: 82b92040
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 1134.332 ; gain = 11.8362default:defaulth px� 
L
7Phase 1.1.1.3 IO and Clk Clean Up | Checksum: 82b92040
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 1134.332 ; gain = 11.8362default:defaulth px� 
�

Phase %s%s
101*constraints2
1.1.1.4 2default:default2>
*Implementation Feasibility check On IDelay2default:defaultZ18-101h px� 
c
NPhase 1.1.1.4 Implementation Feasibility check On IDelay | Checksum: 82b92040
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 1134.332 ; gain = 11.8362default:defaulth px� 
z

Phase %s%s
101*constraints2
1.1.1.5 2default:default2'
Commit IO Placement2default:defaultZ18-101h px� 
L
7Phase 1.1.1.5 Commit IO Placement | Checksum: 8284f821
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:16 ; elapsed = 00:00:16 . Memory (MB): peak = 1134.332 ; gain = 11.8362default:defaulth px� 
U
@Phase 1.1.1 ParallelPlaceIOClockAndInitTop | Checksum: 8284f821
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:17 ; elapsed = 00:00:16 . Memory (MB): peak = 1134.332 ; gain = 11.8362default:defaulth px� 
g
RPhase 1.1 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 9c78b50c
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:17 ; elapsed = 00:00:16 . Memory (MB): peak = 1134.332 ; gain = 11.8362default:defaulth px� 
}

Phase %s%s
101*constraints2
1.2 2default:default2.
Build Placer Netlist Model2default:defaultZ18-101h px� 
v

Phase %s%s
101*constraints2
1.2.1 2default:default2%
Place Init Design2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
1.2.1.1 2default:default2
Make Others2default:defaultZ18-101h px� 
E
0Phase 1.2.1.1 Make Others | Checksum: 136761766
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:18 ; elapsed = 00:00:18 . Memory (MB): peak = 1134.332 ; gain = 11.8362default:defaulth px� 
~

Phase %s%s
101*constraints2
1.2.1.2 2default:default2+
Init Lut Pin Assignment2default:defaultZ18-101h px� 
Q
<Phase 1.2.1.2 Init Lut Pin Assignment | Checksum: 136761766
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:20 ; elapsed = 00:00:20 . Memory (MB): peak = 1246.191 ; gain = 123.6952default:defaulth px� 
I
4Phase 1.2.1 Place Init Design | Checksum: 12035d382
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:51 ; elapsed = 00:00:40 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
P
;Phase 1.2 Build Placer Netlist Model | Checksum: 12035d382
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:51 ; elapsed = 00:00:40 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
z

Phase %s%s
101*constraints2
1.3 2default:default2+
Constrain Clocks/Macros2default:defaultZ18-101h px� 
M
8Phase 1.3 Constrain Clocks/Macros | Checksum: 12035d382
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:51 ; elapsed = 00:00:40 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
I
4Phase 1 Placer Initialization | Checksum: 12035d382
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:51 ; elapsed = 00:00:40 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
q

Phase %s%s
101*constraints2
2 2default:default2$
Global Placement2default:defaultZ18-101h px� 
D
/Phase 2 Global Placement | Checksum: 1e8b2bd70
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:03:16 ; elapsed = 00:02:24 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
q

Phase %s%s
101*constraints2
3 2default:default2$
Detail Placement2default:defaultZ18-101h px� 
}

Phase %s%s
101*constraints2
3.1 2default:default2.
Commit Multi Column Macros2default:defaultZ18-101h px� 
P
;Phase 3.1 Commit Multi Column Macros | Checksum: 1e8b2bd70
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:03:17 ; elapsed = 00:02:24 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 


Phase %s%s
101*constraints2
3.2 2default:default20
Commit Most Macros & LUTRAMs2default:defaultZ18-101h px� 
Q
<Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 76e0dd7c
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:04:11 ; elapsed = 00:03:00 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
y

Phase %s%s
101*constraints2
3.3 2default:default2*
Area Swap Optimization2default:defaultZ18-101h px� 
K
6Phase 3.3 Area Swap Optimization | Checksum: 7ec95e01
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:04:14 ; elapsed = 00:03:03 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
x

Phase %s%s
101*constraints2
3.4 2default:default2)
updateClock Trees: DP2default:defaultZ18-101h px� 
J
5Phase 3.4 updateClock Trees: DP | Checksum: 7ec95e01
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:04:14 ; elapsed = 00:03:03 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
x

Phase %s%s
101*constraints2
3.5 2default:default2)
Timing Path Optimizer2default:defaultZ18-101h px� 
J
5Phase 3.5 Timing Path Optimizer | Checksum: ffb0141d
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:04:27 ; elapsed = 00:03:12 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
t

Phase %s%s
101*constraints2
3.6 2default:default2%
Fast Optimization2default:defaultZ18-101h px� 
F
1Phase 3.6 Fast Optimization | Checksum: ffb0141d
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:04:28 ; elapsed = 00:03:12 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 


Phase %s%s
101*constraints2
3.7 2default:default20
Small Shape Detail Placement2default:defaultZ18-101h px� 
Q
<Phase 3.7 Small Shape Detail Placement | Checksum: d0d5ee6e
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:05:11 ; elapsed = 00:03:58 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
u

Phase %s%s
101*constraints2
3.8 2default:default2&
Re-assign LUT pins2default:defaultZ18-101h px� 
G
2Phase 3.8 Re-assign LUT pins | Checksum: 723e7e87
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:05:13 ; elapsed = 00:04:01 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
�

Phase %s%s
101*constraints2
3.9 2default:default22
Pipeline Register Optimization2default:defaultZ18-101h px� 
S
>Phase 3.9 Pipeline Register Optimization | Checksum: 723e7e87
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:05:14 ; elapsed = 00:04:01 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
u

Phase %s%s
101*constraints2
3.10 2default:default2%
Fast Optimization2default:defaultZ18-101h px� 
G
2Phase 3.10 Fast Optimization | Checksum: 723e7e87
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:05:42 ; elapsed = 00:04:17 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
C
.Phase 3 Detail Placement | Checksum: 723e7e87
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:05:44 ; elapsed = 00:04:19 . Memory (MB): peak = 1336.582 ; gain = 214.0862default:defaulth px� 
�

Phase %s%s
101*constraints2
4 2default:default2<
(Post Placement Optimization and Clean-Up2default:defaultZ18-101h px� 
{

Phase %s%s
101*constraints2
4.1 2default:default2,
Post Commit Optimization2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
}

Phase %s%s
101*constraints2
4.1.1 2default:default2,
updateClock Trees: PCOPT2default:defaultZ18-101h px� 
O
:Phase 4.1.1 updateClock Trees: PCOPT | Checksum: d73162a1
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:06:32 ; elapsed = 00:04:47 . Memory (MB): peak = 1381.258 ; gain = 258.7622default:defaulth px� 
�

Phase %s%s
101*constraints2
4.1.2 2default:default2/
Post Placement Optimization2default:defaultZ18-101h px� 
�
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
2.2562default:defaultZ30-746h px� 
R
=Phase 4.1.2 Post Placement Optimization | Checksum: 7bc72921
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:06:33 ; elapsed = 00:04:47 . Memory (MB): peak = 1381.258 ; gain = 258.7622default:defaulth px� 
M
8Phase 4.1 Post Commit Optimization | Checksum: 7bc72921
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:06:34 ; elapsed = 00:04:48 . Memory (MB): peak = 1381.258 ; gain = 258.7622default:defaulth px� 
�

Phase %s%s
101*constraints2
4.2 2default:default25
!Sweep Clock Roots: Post-Placement2default:defaultZ18-101h px� 
V
APhase 4.2 Sweep Clock Roots: Post-Placement | Checksum: 7bc72921
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:06:34 ; elapsed = 00:04:48 . Memory (MB): peak = 1381.258 ; gain = 258.7622default:defaulth px� 
�

Phase %s%s
101*constraints2
4.3 2default:default27
#Uram Pipeline Register Optimization2default:defaultZ18-101h px� 
X
CPhase 4.3 Uram Pipeline Register Optimization | Checksum: 7bc72921
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:06:34 ; elapsed = 00:04:48 . Memory (MB): peak = 1381.258 ; gain = 258.7622default:defaulth px� 
y

Phase %s%s
101*constraints2
4.4 2default:default2*
Post Placement Cleanup2default:defaultZ18-101h px� 
K
6Phase 4.4 Post Placement Cleanup | Checksum: 7bc72921
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:06:35 ; elapsed = 00:04:49 . Memory (MB): peak = 1381.258 ; gain = 258.7622default:defaulth px� 
s

Phase %s%s
101*constraints2
4.5 2default:default2$
Placer Reporting2default:defaultZ18-101h px� 
E
0Phase 4.5 Placer Reporting | Checksum: 7bc72921
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:06:35 ; elapsed = 00:04:49 . Memory (MB): peak = 1381.258 ; gain = 258.7622default:defaulth px� 
z

Phase %s%s
101*constraints2
4.6 2default:default2+
Final Placement Cleanup2default:defaultZ18-101h px� 
M
8Phase 4.6 Final Placement Cleanup | Checksum: 13ecfee6f
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:06:36 ; elapsed = 00:04:50 . Memory (MB): peak = 1381.258 ; gain = 258.7622default:defaulth px� 
\
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 13ecfee6f
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:06:36 ; elapsed = 00:04:50 . Memory (MB): peak = 1381.258 ; gain = 258.7622default:defaulth px� 
>
)Ending Placer Task | Checksum: 10f657f3c
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:06:36 ; elapsed = 00:04:50 . Memory (MB): peak = 1381.258 ; gain = 258.7622default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
422default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
place_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
place_design: 2default:default2
00:06:472default:default2
00:04:572default:default2
1381.2582default:default2
258.7622default:defaultZ17-268h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:302default:default2
00:00:122default:default2
1381.2582default:default2
0.0002default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:322default:default2
00:00:132default:default2
1381.2582default:default2
0.0002default:defaultZ17-268h px� 
�
kreport_io: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.040 . Memory (MB): peak = 1381.258 ; gain = 0.000
*commonh px� 
�
treport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.490 . Memory (MB): peak = 1381.258 ; gain = 0.000
*commonh px� 
�
ureport_control_sets: Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.240 . Memory (MB): peak = 1381.258 ; gain = 0.000
*commonh px� 


End Record