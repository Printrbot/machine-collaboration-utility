G28 X Y
; G-Code generated by Simplify3D(R) Version 3.0.2
; Feb 13, 2016 at 6:06:17 PM
; Settings Summary
;   processName,Process1
;   applyToModels,mid
;   profileName,MakerBot Replicator 2
;   profileVersion,2016-02-02 17:52:26
;   baseProfile,
;   printMaterial,PLA
;   printQuality,Fast
;   printExtruders,
;   extruderName,Primary Extruder
;   extruderToolheadNumber,0
;   extruderDiameter,0.4
;   extruderAutoWidth,0
;   extruderWidth,0.4
;   extrusionMultiplier,0.9
;   extruderUseRetract,1
;   extruderRetractionDistance,1
;   extruderExtraRestartDistance,0
;   extruderRetractionZLift,0
;   extruderRetractionSpeed,1200
;   extruderUseCoasting,0
;   extruderCoastingDistance,0.2
;   extruderUseWipe,0
;   extruderWipeDistance,5
;   primaryExtruder,0
;   layerHeight,0.2
;   topSolidLayers,3
;   bottomSolidLayers,3
;   perimeterOutlines,2
;   printPerimetersInsideOut,1
;   startPointOption,3
;   startPointOriginX,0
;   startPointOriginY,0
;   startPointOriginZ,0
;   sequentialIslands,0
;   spiralVaseMode,0
;   firstLayerHeightPercentage,90
;   firstLayerWidthPercentage,100
;   firstLayerUnderspeed,0.5
;   useRaft,0
;   raftExtruder,0
;   raftLayers,3
;   raftOffset,3
;   raftSeparationDistance,0.14
;   raftInfill,85
;   disableRaftBaseLayers,0
;   useSkirt,0
;   skirtExtruder,0
;   skirtLayers,1
;   skirtOutlines,6
;   skirtOffset,0
;   usePrimePillar,0
;   primePillarExtruder,999
;   primePillarWidth,12
;   primePillarLocation,7
;   primePillarSpeedMultiplier,1
;   useOozeShield,0
;   oozeShieldExtruder,999
;   oozeShieldOffset,2
;   oozeShieldOutlines,1
;   oozeShieldSidewallShape,1
;   oozeShieldSidewallAngle,30
;   oozeShieldSpeedMultiplier,1
;   infillExtruder,0
;   internalInfillPattern,Rectilinear
;   externalInfillPattern,Rectilinear
;   infillPercentage,15
;   outlineOverlapPercentage,20
;   infillExtrusionWidthPercentage,100
;   minInfillLength,5
;   infillLayerInterval,1
;   infillAngles,45
;   overlapInfillAngles,0
;   generateSupport,0
;   supportExtruder,0
;   supportInfillPercentage,25
;   supportExtraInflation,0
;   denseSupportLayers,0
;   denseSupportInfillPercentage,70
;   supportLayerInterval,1
;   supportHorizontalPartOffset,0.3
;   supportUpperSeparationLayers,1
;   supportLowerSeparationLayers,1
;   supportType,0
;   supportGridSpacing,4
;   maxOverhangAngle,45
;   supportAngles,0
;   temperatureName,Primary Extruder
;   temperatureNumber,0
;   temperatureSetpointCount,1
;   temperatureSetpointLayers,1
;   temperatureSetpointTemperatures,230
;   temperatureStabilizeAtStartup,0
;   temperatureHeatedBed,0
;   temperatureRelayBetweenLayers,0
;   temperatureRelayBetweenLoops,0
;   fanLayers,1,2
;   fanSpeeds,0,100
;   blipFanToFullPower,0
;   adjustSpeedForCooling,1
;   minSpeedLayerTime,15
;   minCoolingSpeedSlowdown,20
;   increaseFanForCooling,0
;   minFanLayerTime,45
;   maxCoolingFanSpeed,100
;   increaseFanForBridging,0
;   bridgingFanSpeed,100
;   use5D,1
;   relativeEdistances,1
;   allowEaxisZeroing,0
;   independentExtruderAxes,1
;   includeM10123,0
;   stickySupport,1
;   applyToolheadOffsets,0
;   gcodeXoffset,0
;   gcodeYoffset,0
;   gcodeZoffset,0
;   overrideMachineDefinition,1
;   machineTypeOverride,0
;   strokeXoverride,280
;   strokeYoverride,150
;   strokeZoverride,150
;   originOffsetXoverride,140
;   originOffsetYoverride,75
;   originOffsetZoverride,0
;   homeXdirOverride,1
;   homeYdirOverride,1
;   homeZdirOverride,-1
;   flipXoverride,1
;   flipYoverride,-1
;   flipZoverride,1
;   toolheadOffsets,0,0|0,0|0,0|0,0|0,0|0,0
;   overrideFirmwareConfiguration,1
;   firmwareTypeOverride,MakerBot/Sailfish Firmware
;   GPXconfigOverride,r2
;   baudRateOverride,115200
;   overridePrinterModels,1
;   printerModelsOverride,MakerBot_Replicator2.stl
;   startingGcode,; **** Replicator 2 start.gcode ****,M73 P0 ; enable build progress,G162 X Y F3000 ; home XY maximum,G161 Z F1200 ; home Z minimum,G92 Z-5 ; set Z to -5,G1 Z0 ; move Z to 0,G161 Z F100 ; home Z slowly,M132 X Y Z A B ; recall home offsets,G1 X-145 Y-75 Z30 F9000 ; move to wait position off table,G130 X20 Y20 Z20 A20 B20 ; lower stepper Vrefs while heating,M126 S[fan_speed_pwm],M104 S[extruder0_temperature] T0,M133 T0 ; stabilize extruder temperature,G130 X127 Y127 Z40 A127 B127 ; default stepper Vrefs,G92 A0 ; zero extruder,G1 Z0.4 ; position nozzle,G1 E25 F300 ; purge nozzle,G1 X-140 Y-70 Z0.15 F1200 ; slow wipe,G1 X-135 Y-65 Z0.5 F1200 ; lift,G92 A0 ; zero extruder,M73 P1 ;@body (notify GPX body has started),; **** end of start.gcode ****
;   layerChangeGcode,
;   retractionGcode,
;   toolChangeGcode,
;   endingGcode,; **** Replicator 2 end.gcode ****,M73 P100 ; end build progress,G1 Z155 F1000 ; send Z axis to bottom of machine,M104 S0 T0 ; cool down extruder,M127 ; stop blower fan,G162 X Y F3000 ; home XY maximum,M18 ; disable stepper,M72 P1 ; play Ta-Da song,; **** end of end.gcode ****
;   createX3G,1
;   celebration,0
;   celebrationSong,Random Song
;   createMB5G,0
;   postProcessing,
;   defaultSpeed,4800
;   outlineUnderspeed,0.5
;   solidInfillUnderspeed,0.8
;   supportUnderspeed,0.8
;   rapidXYspeed,9000
;   rapidZspeed,1200
;   minBridgingArea,50
;   bridgingExtraInflation,0
;   bridgingExtrusionMultiplier,1
;   bridgingSpeedMultiplier,0.8
;   filamentDiameter,1.75
;   filamentPricePerKg,46
;   filamentDensity,1.25
;   useMinPrintHeight,0
;   minPrintHeight,0
;   useMaxPrintHeight,0
;   maxPrintHeight,0
;   useDiaphragm,0
;   diaphragmLayerInterval,20
;   robustSlicing,1
;   mergeAllIntoSolid,0
;   onlyRetractWhenCrossingOutline,1
;   retractBetweenLayers,1
;   useRetractionMinTravel,0
;   retractionMinTravel,3
;   retractWhileWiping,0
;   onlyWipeOutlines,1
;   avoidCrossingOutline,0
;   maxMovementDetourFactor,3
;   toolChangeRetractionDistance,12
;   toolChangeExtraRestartDistance,-0.5
;   toolChangeRetractionSpeed,600
;   allowThinWallGapFill,1
;   thinWallAllowedOverlapPercentage,10
;   horizontalSizeCompensation,0
G90
M83
; **** Replicator 2 start.gcode ****
M73 P0 ; enable build progress
G162 X Y F3000 ; home XY maximum
G161 Z F1200 ; home Z minimum
G92 Z-5 ; set Z to -5
G1 Z0 ; move Z to 0
G161 Z F100 ; home Z slowly
M132 X Y Z A B ; recall home offsets
G1 X-145 Y-75 Z30 F9000 ; move to wait position off table
G130 X20 Y20 Z20 A20 B20 ; lower stepper Vrefs while heating
M127
M104 S230 T0
M133 T0 ; stabilize extruder temperature
G130 X127 Y127 Z40 A127 B127 ; default stepper Vrefs
G92 A0 ; zero extruder
G1 Z0.4 ; position nozzle
G1 E25 F300 ; purge nozzle
G1 X-140 Y-70 Z0.15 F1200 ; slow wipe
G1 X-135 Y-65 Z0.5 F1200 ; lift
G92 A0 ; zero extruder
M73 P1 ;@body (notify GPX body has started)
; **** end of start.gcode ****
G1 E-1.0000 F1200
G1 Z0.180 F1200
; layer 1, Z = 0.18
M135 T0
; tool H0.200 W0.400
; inner perimeter
G1 X-1.039 Y-49.483 F9000
G1 E1.0000 F360
G1 X1.039 Y-49.483 E0.0622 F1800
G1 X3.116 Y-49.453 E0.0622
G1 X5.191 Y-49.393 E0.0621
G1 X7.262 Y-49.303 E0.0621
G1 X9.330 Y-49.183 E0.0620
G1 X11.390 Y-49.033 E0.0618
G1 X14.472 Y-48.752 E0.0926
G1 X16.513 Y-48.528 E0.0615
G1 X18.544 Y-48.275 E0.0613
G1 X20.566 Y-47.992 E0.0611
G1 X22.574 Y-47.680 E0.0608
G1 X24.569 Y-47.339 E0.0606
G1 X26.547 Y-46.970 E0.0602
G28 X Y
G1 X29.487 Y-46.362 E0.0899
G1 X32.387 Y-45.691 E0.0891
G1 X34.294 Y-45.209 E0.0589
G1 X36.181 Y-44.700 E0.0585
G1 X38.046 Y-44.163 E0.0581
G1 X39.888 Y-43.600 E0.0577
G1 X41.707 Y-43.011 E0.0572
G1 X43.499 Y-42.395 E0.0567
G1 X45.265 Y-41.754 E0.0563
G1 X47.003 Y-41.087 E0.0557
G1 X48.714 Y-40.396 E0.0552
G1 X50.393 Y-39.681 E0.0546
G1 X52.858 Y-38.561 E0.0811
G1 X54.459 Y-37.787 E0.0532
G1 X56.028 Y-36.990 E0.0527
G1 X57.563 Y-36.170 E0.0521
G1 X59.063 Y-35.328 E0.0515
G1 X60.527 Y-34.466 E0.0509
G1 X61.954 Y-33.582 E0.0502
G1 X63.344 Y-32.679 E0.0496
G1 X64.694 Y-31.757 E0.0489
G1 X66.649 Y-30.335 E0.0724
G1 X67.899 Y-29.367 E0.0473
G1 X69.110 Y-28.380 E0.0467
G1 X70.278 Y-27.377 E0.0461
G1 X71.404 Y-26.357 E0.0455
G1 X72.486 Y-25.322 E0.0448
G1 X73.525 Y-24.272 E0.0442
G1 X74.520 Y-23.206 E0.0436
G1 X74.998 Y-22.672 E0.0214
G1 X75.925 Y-21.586 E0.0428
G1 X76.807 Y-20.487 E0.0422
G1 X77.227 Y-19.938 E0.0207
G1 X78.039 Y-18.822 E0.0413
G1 X78.802 Y-17.697 E0.0407
G1 X79.518 Y-16.562 E0.0402
G1 X80.186 Y-15.418 E0.0397
G1 X80.808 Y-14.262 E0.0393
G1 X81.097 Y-13.688 E0.0193
G1 X81.645 Y-12.521 E0.0386
G1 X82.143 Y-11.349 E0.0381
G1 X82.592 Y-10.171 E0.0377
G1 X82.992 Y-8.987 E0.0374
G1 X83.343 Y-7.796 E0.0372
G1 X83.497 Y-7.206 E0.0183
G1 X83.773 Y-6.008 E0.0368
G1 X83.999 Y-4.810 E0.0365
G1 X84.174 Y-3.610 E0.0363
G1 X84.300 Y-2.408 E0.0362
G1 X84.375 Y-1.204 E0.0361
G1 X84.400 Y0.000 E0.0361
G1 X84.375 Y1.208 E0.0362
G1 X84.344 Y1.803 E0.0179
G1 X84.243 Y3.009 E0.0362
G1 X84.093 Y4.210 E0.0362
G1 X83.892 Y5.410 E0.0364
G1 X83.642 Y6.606 E0.0366
G1 X83.342 Y7.799 E0.0368
G1 X82.991 Y8.990 E0.0372
G1 X82.799 Y9.577 E0.0185
G1 X82.374 Y10.760 E0.0377
G1 X81.900 Y11.935 E0.0379
G1 X81.378 Y13.104 E0.0383
G1 X80.806 Y14.265 E0.0387
G1 X80.186 Y15.418 E0.0392
G1 X79.518 Y16.562 E0.0397
G1 X78.802 Y17.697 E0.0402
G1 X78.039 Y18.822 E0.0407
G1 X77.228 Y19.937 E0.0412
G1 X76.371 Y21.039 E0.0418
G28 X Y
