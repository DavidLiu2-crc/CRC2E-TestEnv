/******************************************************************************
 *                                                                         
 * Copyright  Keysight Technologies 2011-2019
 *
 *****************************************************************************/

#ifndef __AGXSAN_HEADER
#define __AGXSAN_HEADER

#include <ivivisatype.h>

#if defined(__cplusplus) || defined(__cplusplus__)
extern "C" {
#endif

/**************************************************************************** 
 *---------------------------- Attribute Defines ---------------------------* 
 ****************************************************************************/
#ifndef IVI_ATTR_BASE
#define IVI_ATTR_BASE                 1000000
#endif

#ifndef IVI_INHERENT_ATTR_BASE		        
#define IVI_INHERENT_ATTR_BASE        (IVI_ATTR_BASE +  50000)   /* base for inherent capability attributes */
#endif

#ifndef IVI_CLASS_ATTR_BASE           
#define IVI_CLASS_ATTR_BASE           (IVI_ATTR_BASE + 250000)   /* base for IVI-defined class attributes */
#endif

#ifndef IVI_LXISYNC_ATTR_BASE         
#define IVI_LXISYNC_ATTR_BASE         (IVI_ATTR_BASE + 950000)   /* base for IviLxiSync attributes */
#endif

#ifndef IVI_SPECIFIC_ATTR_BASE        
#define IVI_SPECIFIC_ATTR_BASE        (IVI_ATTR_BASE + 150000)   /* base for attributes of specific drivers */
#endif


/*===== IVI Inherent Instrument Attributes ==============================*/    

/*- Driver Identification */

#define AGXSAN_ATTR_SPECIFIC_DRIVER_DESCRIPTION              (IVI_INHERENT_ATTR_BASE + 514L)  /* ViString, read-only */
#define AGXSAN_ATTR_SPECIFIC_DRIVER_PREFIX                   (IVI_INHERENT_ATTR_BASE + 302L)  /* ViString, read-only */
#define AGXSAN_ATTR_SPECIFIC_DRIVER_VENDOR                   (IVI_INHERENT_ATTR_BASE + 513L)  /* ViString, read-only */
#define AGXSAN_ATTR_SPECIFIC_DRIVER_REVISION                 (IVI_INHERENT_ATTR_BASE + 551L)  /* ViString, read-only */
#define AGXSAN_ATTR_SPECIFIC_DRIVER_CLASS_SPEC_MAJOR_VERSION (IVI_INHERENT_ATTR_BASE + 515L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SPECIFIC_DRIVER_CLASS_SPEC_MINOR_VERSION (IVI_INHERENT_ATTR_BASE + 516L)  /* ViInt32, read-only */

/*- User Options */

#define AGXSAN_ATTR_RANGE_CHECK                             (IVI_INHERENT_ATTR_BASE + 2L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_QUERY_INSTRUMENT_STATUS                 (IVI_INHERENT_ATTR_BASE + 3L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_CACHE                                   (IVI_INHERENT_ATTR_BASE + 4L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SIMULATE                                (IVI_INHERENT_ATTR_BASE + 5L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_RECORD_COERCIONS                        (IVI_INHERENT_ATTR_BASE + 6L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_INTERCHANGE_CHECK                       (IVI_INHERENT_ATTR_BASE + 21L)  /* ViBoolean, read-write */

/*- Advanced Session Information */

#define AGXSAN_ATTR_LOGICAL_NAME                            (IVI_INHERENT_ATTR_BASE + 305L)  /* ViString, read-only */
#define AGXSAN_ATTR_IO_RESOURCE_DESCRIPTOR                  (IVI_INHERENT_ATTR_BASE + 304L)  /* ViString, read-only */
#define AGXSAN_ATTR_DRIVER_SETUP                            (IVI_INHERENT_ATTR_BASE + 7L)  /* ViString, read-only */

/*- Driver Capabilities */

#define AGXSAN_ATTR_GROUP_CAPABILITIES                      (IVI_INHERENT_ATTR_BASE + 401L)  /* ViString, read-only */
#define AGXSAN_ATTR_SUPPORTED_INSTRUMENT_MODELS             (IVI_INHERENT_ATTR_BASE + 327L)  /* ViString, read-only */

/*- Instrument Identification */

#define AGXSAN_ATTR_INSTRUMENT_FIRMWARE_REVISION            (IVI_INHERENT_ATTR_BASE + 510L)  /* ViString, read-only */
#define AGXSAN_ATTR_INSTRUMENT_MANUFACTURER                 (IVI_INHERENT_ATTR_BASE + 511L)  /* ViString, read-only */
#define AGXSAN_ATTR_INSTRUMENT_MODEL                        (IVI_INHERENT_ATTR_BASE + 512L)  /* ViString, read-only */


/*===== Instrument-Specific Attributes =====================================*/

/*- AgXSAn */

#define AGXSAN_ATTR_TEXT                                        (IVI_SPECIFIC_ATTR_BASE + 431L)  /* ViString, read-write */
#define AGXSAN_ATTR_SA_SPURIOUS_EMISSION_DISPLAY_VIEW_SELECTION (IVI_SPECIFIC_ATTR_BASE + 821L)  /* ViInt32, read-write */

/*- Basic Operation */

#define AGXSAN_ATTR_DETECTOR_TYPE                           (IVI_CLASS_ATTR_BASE + 4L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_DETECTOR_TYPE_AUTO                      (IVI_CLASS_ATTR_BASE + 5L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_NUMBER_OF_SWEEPS                        (IVI_CLASS_ATTR_BASE + 10L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SWEEP_MODE_CONTINUOUS                   (IVI_CLASS_ATTR_BASE + 15L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_VERTICAL_SCALE                          (IVI_CLASS_ATTR_BASE + 21L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_FREQUENCY_OFFSET                        (IVI_CLASS_ATTR_BASE + 8L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_FREQUENCY_START                         (IVI_CLASS_ATTR_BASE + 6L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_FREQUENCY_STOP                          (IVI_CLASS_ATTR_BASE + 7L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_AMPLITUDE_UNITS                         (IVI_CLASS_ATTR_BASE + 1L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_ATTENUATION                             (IVI_CLASS_ATTR_BASE + 2L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_ATTENUATION_AUTO                        (IVI_CLASS_ATTR_BASE + 3L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_INPUT_IMPEDANCE                         (IVI_CLASS_ATTR_BASE + 9L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_REFERENCE_LEVEL                         (IVI_CLASS_ATTR_BASE + 11L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_REFERENCE_LEVEL_OFFSET                  (IVI_CLASS_ATTR_BASE + 12L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_MARKER_TYPE                             (IVI_CLASS_ATTR_BASE + 701L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_RESOLUTION_BANDWIDTH                    (IVI_CLASS_ATTR_BASE + 13L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_RESOLUTION_BANDWIDTH_AUTO               (IVI_CLASS_ATTR_BASE + 14L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SWEEP_TIME                              (IVI_CLASS_ATTR_BASE + 16L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SWEEP_TIME_AUTO                         (IVI_CLASS_ATTR_BASE + 17L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_VIDEO_BANDWIDTH                         (IVI_CLASS_ATTR_BASE + 22L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_VIDEO_BANDWIDTH_AUTO                    (IVI_CLASS_ATTR_BASE + 23L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_TRACE_SIZE                              (IVI_CLASS_ATTR_BASE + 19L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_TRACE_TYPE                              (IVI_CLASS_ATTR_BASE + 20L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_TRACE_COUNT                             (IVI_CLASS_ATTR_BASE + 18L)  /* ViInt32, read-only */

/*- Display Control */

#define AGXSAN_ATTR_NUMBER_OF_DIVISIONS                     (IVI_CLASS_ATTR_BASE + 602L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_UNITS_PER_DIVISION                      (IVI_CLASS_ATTR_BASE + 601L)  /* ViReal64, read-write */

/*- External Mixing */

#define AGXSAN_ATTR_EXTERNAL_MIXER_AVERAGE_CONVERSION_LOSS       (IVI_CLASS_ATTR_BASE + 901L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_EXTERNAL_MIXER_ENABLED                       (IVI_CLASS_ATTR_BASE + 906L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_EXTERNAL_MIXER_HARMONIC                      (IVI_CLASS_ATTR_BASE + 907L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_EXTERNAL_MIXER_NUMBER_OF_PORTS               (IVI_CLASS_ATTR_BASE + 908L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_EXTERNAL_MIXER_BIAS_ENABLED                  (IVI_CLASS_ATTR_BASE + 903L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_EXTERNAL_MIXER_BIAS                          (IVI_CLASS_ATTR_BASE + 902L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_EXTERNAL_MIXER_BIAS_LIMIT                    (IVI_CLASS_ATTR_BASE + 904L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_EXTERNAL_MIXER_CONVERSION_LOSS_TABLE_ENABLED (IVI_CLASS_ATTR_BASE + 905L)  /* ViBoolean, read-write */

/*- Markers */

#define AGXSAN_ATTR_ACTIVE_MARKER                           (IVI_CLASS_ATTR_BASE + 201L)  /* ViString, read-write */
#define AGXSAN_ATTR_MARKER_AMPLITUDE                        (IVI_CLASS_ATTR_BASE + 202L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_MARKER_COUNT                            (IVI_CLASS_ATTR_BASE + 203L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_MARKER_ENABLED                          (IVI_CLASS_ATTR_BASE + 204L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_PEAK_EXCURSION                          (IVI_CLASS_ATTR_BASE + 210L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_MARKER_POSITION                         (IVI_CLASS_ATTR_BASE + 207L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SIGNAL_TRACK_ENABLED                    (IVI_CLASS_ATTR_BASE + 211L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_MARKER_THRESHOLD                        (IVI_CLASS_ATTR_BASE + 208L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_MARKER_TRACE                            (IVI_CLASS_ATTR_BASE + 209L)  /* ViString, read-write */
#define AGXSAN_ATTR_MARKER_FREQUENCY_COUNTER_ENABLED        (IVI_CLASS_ATTR_BASE + 205L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_MARKER_FREQUENCY_COUNTER_RESOLUTION     (IVI_CLASS_ATTR_BASE + 206L)  /* ViReal64, read-write */

/*- Delta Marker */

#define AGXSAN_ATTR_REFERENCE_MARKER_AMPLITUDE              (IVI_CLASS_ATTR_BASE + 801L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_REFERENCE_MARKER_POSITION               (IVI_CLASS_ATTR_BASE + 802L)  /* ViReal64, read-only */

/*- Trigger */

#define AGXSAN_ATTR_TRIGGER_SOURCE                          (IVI_CLASS_ATTR_BASE + 301L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_EXTERNAL_TRIGGER_LEVEL                  (IVI_CLASS_ATTR_BASE + 401L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_EXTERNAL_TRIGGER_SLOPE                  (IVI_CLASS_ATTR_BASE + 402L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_COUNT                (IVI_LXISYNC_ATTR_BASE + 21L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_SOURCE               (IVI_LXISYNC_ATTR_BASE + 22L)  /* ViString, read-write */

/*- Alarm */

#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_ALARM_ENABLED        (IVI_LXISYNC_ATTR_BASE + 16L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_ALARM_PERIOD         (IVI_LXISYNC_ATTR_BASE + 17L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_ALARM_REPEAT_COUNT   (IVI_LXISYNC_ATTR_BASE + 18L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_ALARM_TIME_FRACTION  (IVI_LXISYNC_ATTR_BASE + 19L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_ALARM_TIME_SECONDS   (IVI_LXISYNC_ATTR_BASE + 20L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_ALARM_COUNT          (IVI_LXISYNC_ATTR_BASE + 15L)  /* ViInt32, read-only */

/*- Source */

#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_SOURCE_DELAY         (IVI_LXISYNC_ATTR_BASE + 24L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_SOURCE_DETECTION     (IVI_LXISYNC_ATTR_BASE + 25L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_SOURCE_EVENTID       (IVI_LXISYNC_ATTR_BASE + 26L)  /* ViString, read-write */
#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_SOURCE_FILTER        (IVI_LXISYNC_ATTR_BASE + 27L)  /* ViString, read-write */
#define AGXSAN_ATTR_IVILXISYNC_TRIGGER_SOURCE_COUNT         (IVI_LXISYNC_ATTR_BASE + 23L)  /* ViInt32, read-only */

/*- External */

#define AGXSAN_ATTR_TRIGGER_EXTERNAL_DELAY                                (IVI_SPECIFIC_ATTR_BASE + 668L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_EXTERNAL_LEVEL                                (IVI_SPECIFIC_ATTR_BASE + 802L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_EXTERNAL_SLOPE                                (IVI_SPECIFIC_ATTR_BASE + 803L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_TRIGGER_EXTERNAL_ZERO_SPAN_DELAY_COMPENSATION_ENABLED (IVI_SPECIFIC_ATTR_BASE + 807L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_TRIGGER_EXTERNAL_DELAY_ENABLED                        (IVI_SPECIFIC_ATTR_BASE + 835L)  /* ViBoolean, read-write */

/*- External2 */

#define AGXSAN_ATTR_TRIGGER_EXTERNAL2_DELAY                                (IVI_SPECIFIC_ATTR_BASE + 669L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_EXTERNAL2_LEVEL                                (IVI_SPECIFIC_ATTR_BASE + 670L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_EXTERNAL2_SLOPE                                (IVI_SPECIFIC_ATTR_BASE + 671L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_TRIGGER_EXTERNAL2_ZERO_SPAN_DELAY_COMPENSATION_ENABLED (IVI_SPECIFIC_ATTR_BASE + 808L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_TRIGGER_EXTERNAL2_DELAY_ENABLED                        (IVI_SPECIFIC_ATTR_BASE + 834L)  /* ViBoolean, read-write */

/*- Video */

#define AGXSAN_ATTR_TRIGGER_VIDEO_DELAY                     (IVI_SPECIFIC_ATTR_BASE + 672L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_VIDEO_LEVEL                     (IVI_SPECIFIC_ATTR_BASE + 805L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_VIDEO_SLOPE                     (IVI_SPECIFIC_ATTR_BASE + 806L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_TRIGGER_VIDEO_DELAY_ENABLED             (IVI_SPECIFIC_ATTR_BASE + 833L)  /* ViBoolean, read-write */

/*- RFBurst */

#define AGXSAN_ATTR_TRIGGER_RFBURST_TRIGGER_RFBURST_LEVEL_ABSOLUTE (IVI_SPECIFIC_ATTR_BASE + 828L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_RFBURST_LEVEL_RELATIVE                 (IVI_SPECIFIC_ATTR_BASE + 829L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_RFBURST_SLOPE                          (IVI_SPECIFIC_ATTR_BASE + 830L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_TRIGGER_RFBURST_DELAY                          (IVI_SPECIFIC_ATTR_BASE + 831L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_RFBURST_DELAY_ENABLED                  (IVI_SPECIFIC_ATTR_BASE + 832L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_ZERO_SPAN_DELAY_COMPENSATION_ENABLED           (IVI_SPECIFIC_ATTR_BASE + 849L)  /* ViBoolean, read-write */

/*- Line */

#define AGXSAN_ATTR_TRIGGER_LINE_DELAY_SLOPE                (IVI_SPECIFIC_ATTR_BASE + 836L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_TRIGGER_LINE_DELAY                      (IVI_SPECIFIC_ATTR_BASE + 837L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_LINE_DELAY_ENABLED              (IVI_SPECIFIC_ATTR_BASE + 838L)  /* ViBoolean, read-write */

/*- Frame */

#define AGXSAN_ATTR_TRIGGER_FRAME_PERIOD                    (IVI_SPECIFIC_ATTR_BASE + 839L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_FRAME_OFFSET                    (IVI_SPECIFIC_ATTR_BASE + 840L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_FRAME_SYNC_SOURCE               (IVI_SPECIFIC_ATTR_BASE + 841L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_TRIGGER_FRAME_DELAY                     (IVI_SPECIFIC_ATTR_BASE + 842L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_FRAME_DELAY_ENABLED             (IVI_SPECIFIC_ATTR_BASE + 843L)  /* ViBoolean, read-write */

/*- ATrigger */

#define AGXSAN_ATTR_TRIGGER_AUTO_TIME                       (IVI_SPECIFIC_ATTR_BASE + 844L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_AUTO__ENABLED                   (IVI_SPECIFIC_ATTR_BASE + 845L)  /* ViBoolean, read-write */

/*- HoldOff */

#define AGXSAN_ATTR_TRIGGER_HOLD_OFF_TIME                   (IVI_SPECIFIC_ATTR_BASE + 847L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_TRIGGER_HOLD_OFF_ENABLED                (IVI_SPECIFIC_ATTR_BASE + 848L)  /* ViBoolean, read-write */

/*- Video Trigger */

#define AGXSAN_ATTR_VIDEO_TRIGGER_LEVEL                     (IVI_CLASS_ATTR_BASE + 501L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_VIDEO_TRIGGER_SLOPE                     (IVI_CLASS_ATTR_BASE + 502L)  /* ViInt32, read-write */

/*- Event Log */

#define AGXSAN_ATTR_IVILXISYNC_EVENT_LOG_ENABLED            (IVI_LXISYNC_ATTR_BASE + 34L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_IVILXISYNC_EVENT_LOG_ENTRY_COUNT        (IVI_LXISYNC_ATTR_BASE + 35L)  /* ViInt32, read-only */

/*- Time */

#define AGXSAN_ATTR_IVILXISYNC_IS_TIME_MASTER               (IVI_LXISYNC_ATTR_BASE + 36L)  /* ViBoolean, read-only */
#define AGXSAN_ATTR_IVILXISYNC_IS_TIME_SYNCHRONIZED         (IVI_LXISYNC_ATTR_BASE + 37L)  /* ViBoolean, read-only */

/*- Arm */

#define AGXSAN_ATTR_IVILXISYNC_ARM_COUNT                    (IVI_LXISYNC_ATTR_BASE + 7L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_IVILXISYNC_ARM_DELAY                    (IVI_LXISYNC_ATTR_BASE + 8L)  /* ViReal64, read-write */

/*- Alarm */

#define AGXSAN_ATTR_IVILXISYNC_ARM_ALARM_ENABLED            (IVI_LXISYNC_ATTR_BASE + 2L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_IVILXISYNC_ARM_ALARM_PERIOD             (IVI_LXISYNC_ATTR_BASE + 3L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_IVILXISYNC_ARM_ALARM_REPEAT_COUNT       (IVI_LXISYNC_ATTR_BASE + 4L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_IVILXISYNC_ARM_ALARM_TIME_FRACTION      (IVI_LXISYNC_ATTR_BASE + 5L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_IVILXISYNC_ARM_ALARM_TIME_SECONDS       (IVI_LXISYNC_ATTR_BASE + 6L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_IVILXISYNC_ARM_ALARM_COUNT              (IVI_LXISYNC_ATTR_BASE + 1L)  /* ViInt32, read-only */

/*- Source */

#define AGXSAN_ATTR_IVILXISYNC_ARM_SOURCE_ENABLED           (IVI_LXISYNC_ATTR_BASE + 11L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_IVILXISYNC_ARM_SOURCE_DETECTION         (IVI_LXISYNC_ATTR_BASE + 10L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_IVILXISYNC_ARM_SOURCE_EVENTID           (IVI_LXISYNC_ATTR_BASE + 12L)  /* ViString, read-write */
#define AGXSAN_ATTR_IVILXISYNC_ARM_SOURCE_FILTER            (IVI_LXISYNC_ATTR_BASE + 13L)  /* ViString, read-write */
#define AGXSAN_ATTR_IVILXISYNC_ARM_SOURCE_COUNT             (IVI_LXISYNC_ATTR_BASE + 9L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_IVILXISYNC_ARM_SOURCE_OR_ENABLED        (IVI_LXISYNC_ATTR_BASE + 14L)  /* ViBoolean, read-write */

/*- Event */

#define AGXSAN_ATTR_IVILXISYNC_EVENT_DESTINATION_PATH       (IVI_LXISYNC_ATTR_BASE + 29L)  /* ViString, read-write */
#define AGXSAN_ATTR_IVILXISYNC_EVENT_DRIVE_MODE             (IVI_LXISYNC_ATTR_BASE + 30L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_IVILXISYNC_EVENT_SLOPE                  (IVI_LXISYNC_ATTR_BASE + 31L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_IVILXISYNC_EVENT_SOURCE                 (IVI_LXISYNC_ATTR_BASE + 32L)  /* ViString, read-write */
#define AGXSAN_ATTR_IVILXISYNC_EVENT_COUNT                  (IVI_LXISYNC_ATTR_BASE + 28L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_IVILXISYNC_EVENT_WIRED_OR_BIAS_MODE     (IVI_LXISYNC_ATTR_BASE + 33L)  /* ViInt32, read-write */

/*- Frequency */

#define AGXSAN_ATTR_FREQUENCY_CENTER                                          (IVI_SPECIFIC_ATTR_BASE + 540L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_FREQUENCY_CENTER_STEP_INCREMENT                           (IVI_SPECIFIC_ATTR_BASE + 541L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_FREQUENCY_SPAN                                            (IVI_SPECIFIC_ATTR_BASE + 542L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_FREQUENCY_SYNTHESIS                                       (IVI_SPECIFIC_ATTR_BASE + 543L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_FREQUENCY_CENTER_STEP_AUTO_ENABLED                        (IVI_SPECIFIC_ATTR_BASE + 544L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_FREQUENCY_SYNTHESIS_AUTO_ENABLED                          (IVI_SPECIFIC_ATTR_BASE + 545L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_FREQUENCY_SPAN_TO_RESOLUTION_BANDWIDTH_RATIO              (IVI_SPECIFIC_ATTR_BASE + 552L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_FREQUENCY_SPAN_TO_RESOLUTION_BANDWIDTH_RATIO_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 553L)  /* ViBoolean, read-write */

/*- Global */

#define AGXSAN_ATTR_FREQUENCY_GLOBAL_CENTER_ENABLED          (IVI_SPECIFIC_ATTR_BASE + 809L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_FREQUENCY_GLOBAL_EXTEND_LOW_BAND_ENABLED (IVI_SPECIFIC_ATTR_BASE + 810L)  /* ViBoolean, read-write */

/*- ZoomSpan */

#define AGXSAN_ATTR_FREQUENCY_ZONE_SPAN_CENTRE              (IVI_SPECIFIC_ATTR_BASE + 853L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_FREQUENCY_ZONE_SPAN_SPAN                (IVI_SPECIFIC_ATTR_BASE + 868L)  /* ViReal64, read-write */

/*- TraceZoom */

#define AGXSAN_ATTR_FREQUENCY_TRACE_ZOOM_CENTRE             (IVI_SPECIFIC_ATTR_BASE + 854L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_FREQUENCY_TRACE_ZOOM_SPAN               (IVI_SPECIFIC_ATTR_BASE + 855L)  /* ViReal64, read-write */

/*- Level */

#define AGXSAN_ATTR_LEVEL_ATTENUATION_OPTIMIZE              (IVI_SPECIFIC_ATTR_BASE + 12L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_LEVEL_ATTENUATION_STEP_INCREMENT        (IVI_SPECIFIC_ATTR_BASE + 13L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_LEVEL_ELECTRONIC_ATTENUATION            (IVI_SPECIFIC_ATTR_BASE + 578L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_LEVEL_ELECTRONIC_ATTENUATION_ENABLED    (IVI_SPECIFIC_ATTR_BASE + 583L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_LEVEL_MIXER_OFFSET                      (IVI_SPECIFIC_ATTR_BASE + 874L)  /* ViReal64, read-write */

/*- Acquisition */

#define AGXSAN_ATTR_ACQUISITION_CONTINUOUS_SWEEP_MODE_ENABLED (IVI_SPECIFIC_ATTR_BASE + 879L)  /* ViBoolean, read-write */

/*- ADC */

#define AGXSAN_ATTR_ACQUISITION_ADC_DITHER_AUTO_ENABLED     (IVI_SPECIFIC_ATTR_BASE + 179L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_ACQUISITION_ADC_DITHER_ENABLED          (IVI_SPECIFIC_ATTR_BASE + 180L)  /* ViBoolean, read-write */

/*- Display */

#define AGXSAN_ATTR_DISPLAY_ENABLED                         (IVI_SPECIFIC_ATTR_BASE + 117L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_DISPLAY_FULL_SCREEN_ENABLED             (IVI_SPECIFIC_ATTR_BASE + 118L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_DISPLAY_TEXT                            (IVI_SPECIFIC_ATTR_BASE + 119L)  /* ViString, read-write */
#define AGXSAN_ATTR_DISPLAY_THEME                           (IVI_SPECIFIC_ATTR_BASE + 155L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_DISPLAY_WINDOW                          (IVI_SPECIFIC_ATTR_BASE + 181L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_DISPLAY_MENU_ENABLED                    (IVI_SPECIFIC_ATTR_BASE + 183L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_DISPLAY_NORMALIZED_REFERENCE            (IVI_SPECIFIC_ATTR_BASE + 184L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_DISPLAY_REFERENCE                       (IVI_SPECIFIC_ATTR_BASE + 185L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_DISPLAY_REFERENCE_OFFSET                (IVI_SPECIFIC_ATTR_BASE + 186L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_DISPLAY_Y_SCALE                         (IVI_SPECIFIC_ATTR_BASE + 187L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_DISPLAY_NORMALIZED_POSITION             (IVI_SPECIFIC_ATTR_BASE + 188L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_DISPLAY_LINE_ENABLED                    (IVI_SPECIFIC_ATTR_BASE + 190L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_DISPLAY_LINE                            (IVI_SPECIFIC_ATTR_BASE + 191L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_DISPLAY_OPERATION_PRIORITY              (IVI_SPECIFIC_ATTR_BASE + 742L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_DISPLAY_VIEW                            (IVI_SPECIFIC_ATTR_BASE + 743L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SCALE_TYPE                              (IVI_SPECIFIC_ATTR_BASE + 811L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_DISPLAY_FREQUENCY_LINE                  (IVI_SPECIFIC_ATTR_BASE + 812L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_DISPLAY_FREQUENCY_LINE_ENABLED          (IVI_SPECIFIC_ATTR_BASE + 813L)  /* ViBoolean, read-write */

/*- Annotation */

#define AGXSAN_ATTR_DISPLAY_ANNOTATION_ACTIVE_FUNCTION_ENABLED (IVI_SPECIFIC_ATTR_BASE + 201L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_DISPLAY_ANNOTATION_MEAS_BAR_ENABLED        (IVI_SPECIFIC_ATTR_BASE + 200L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_DISPLAY_ANNOTATION_SCREEN_ENABLED          (IVI_SPECIFIC_ATTR_BASE + 202L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_DISPLAY_ANNOTATION_TRACE_ENABLED           (IVI_SPECIFIC_ATTR_BASE + 203L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_DISPLAY_ANNOTATION_ENABLED                 (IVI_SPECIFIC_ATTR_BASE + 182L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_DISPLAY_ANNOTATION_GRATICULE_ENABLED       (IVI_SPECIFIC_ATTR_BASE + 189L)  /* ViBoolean, read-write */

/*- Trace */

#define AGXSAN_ATTR_TRACE_UPDATE_ENABLED                    (IVI_SPECIFIC_ATTR_BASE + 757L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_TRACE_DISPLAY_ENABLED                   (IVI_SPECIFIC_ATTR_BASE + 758L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_TRACE_DETECTOR_TYPE                     (IVI_SPECIFIC_ATTR_BASE + 782L)  /* ViInt32, read-write */

/*- Preselector */

#define AGXSAN_ATTR_PRESELECTOR_ADJUST                      (IVI_SPECIFIC_ATTR_BASE + 584L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_PRESELECTOR_MW_ENABLED                  (IVI_SPECIFIC_ATTR_BASE + 586L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_PRESELECTOR_MW_PATH                     (IVI_SPECIFIC_ATTR_BASE + 585L)  /* ViInt32, read-write */

/*- ACP */

#define AGXSAN_ATTR_SA_ACP_LIMIT_TEST_ENABLED               (IVI_SPECIFIC_ATTR_BASE + 120L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_ACP_LIMIT_TEST_FAIL_STATE            (IVI_SPECIFIC_ATTR_BASE + 121L)  /* ViBoolean, read-only */
#define AGXSAN_ATTR_SA_ACP_NOISE_CORRECTION_ENABLED         (IVI_SPECIFIC_ATTR_BASE + 122L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_ACP_DETECTOR_TYPE                    (IVI_SPECIFIC_ATTR_BASE + 123L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_DETECTOR_TYPE_AUTO_ENABLED       (IVI_SPECIFIC_ATTR_BASE + 124L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_ACP_MEASUREMENT_METHOD               (IVI_SPECIFIC_ATTR_BASE + 125L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_MEASUREMENT_TYPE                 (IVI_SPECIFIC_ATTR_BASE + 126L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_TRIGGER_SOURCE                   (IVI_SPECIFIC_ATTR_BASE + 127L)  /* ViInt32, read-write */

/*- Trace */

#define AGXSAN_ATTR_SA_ACP_TRACE_TYPE                       (IVI_SPECIFIC_ATTR_BASE + 776L)  /* ViInt32, read-write */

/*- Average */

#define AGXSAN_ATTR_SA_ACP_AVERAGE_COUNT                    (IVI_SPECIFIC_ATTR_BASE + 128L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_AVERAGE_ENABLED                  (IVI_SPECIFIC_ATTR_BASE + 129L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_ACP_AVERAGE_MODE                     (IVI_SPECIFIC_ATTR_BASE + 130L)  /* ViInt32, read-write */

/*- Carrier */

#define AGXSAN_ATTR_SA_ACP_CARRIER_COUNT                            (IVI_SPECIFIC_ATTR_BASE + 138L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_CARRIER_CPSD                             (IVI_SPECIFIC_ATTR_BASE + 139L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_ACP_CARRIER_REFERENCE_FREQUENCY              (IVI_SPECIFIC_ATTR_BASE + 140L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_ACP_CARRIER_REFERENCE_FREQUENCY_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 141L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_ACP_CARRIER_REFERENCE_LEVEL                  (IVI_SPECIFIC_ATTR_BASE + 142L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_ACP_CARRIER_REFERENCE_LEVEL_AUTO_ENABLED     (IVI_SPECIFIC_ATTR_BASE + 143L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_ACP_CARRIER_REFERENCE_NUMBER                 (IVI_SPECIFIC_ATTR_BASE + 144L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_CARRIER_REFERENCE_NUMBER_AUTO_ENABLED    (IVI_SPECIFIC_ATTR_BASE + 145L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_REFERENCE_TYPE                                  (IVI_SPECIFIC_ATTR_BASE + 852L)  /* ViInt32, read-write */

/*- Frequency */

#define AGXSAN_ATTR_SA_ACP_FREQUENCY_PHASE_NOISE_OPTION_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 152L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_ACP_FREQUENCY_PHASE_NOISE_OPTION_STATE        (IVI_SPECIFIC_ATTR_BASE + 153L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_FREQUENCY_SPAN                            (IVI_SPECIFIC_ATTR_BASE + 154L)  /* ViReal64, read-write */

/*- OffsetFilter */

#define AGXSAN_ATTR_SA_ACP_OFFSETFILTER_ALPHA               (IVI_SPECIFIC_ATTR_BASE + 165L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_ACP_OFFSETFILTER_ENABLED             (IVI_SPECIFIC_ATTR_BASE + 166L)  /* ViBoolean, read-write */

/*- Display */

#define AGXSAN_ATTR_SA_ACP_DISPLAY_TEXT                     (IVI_SPECIFIC_ATTR_BASE + 150L)  /* ViString, read-write */
#define AGXSAN_ATTR_SA_ACP_DISPLAY_BAR_GRAPH_ENABLED        (IVI_SPECIFIC_ATTR_BASE + 147L)  /* ViBoolean, read-write */

/*- WindowY */

#define AGXSAN_ATTR_SA_ACP_DISPLAY_WINDOWY_AUTO_SCALE_ENABLED (IVI_SPECIFIC_ATTR_BASE + 146L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_ACP_DISPLAY_WINDOWY_REFERENCE          (IVI_SPECIFIC_ATTR_BASE + 148L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_ACP_DISPLAY_WINDOWY_REF_POSITION       (IVI_SPECIFIC_ATTR_BASE + 149L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_DISPLAY_WINDOWY_SCALE              (IVI_SPECIFIC_ATTR_BASE + 151L)  /* ViReal64, read-write */

/*- Marker */

#define AGXSAN_ATTR_SA_ACP_MARKER_ACTIVE_MARKER             (IVI_SPECIFIC_ATTR_BASE + 233L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_MARKER_AMPLITUDE                 (IVI_SPECIFIC_ATTR_BASE + 234L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_ACP_MARKER_COUNT                     (IVI_SPECIFIC_ATTR_BASE + 235L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_ACP_MARKER_COUPLE_ENABLED            (IVI_SPECIFIC_ATTR_BASE + 236L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_ACP_MARKER_DELTA_REFERENCE           (IVI_SPECIFIC_ATTR_BASE + 237L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_MARKER_ENABLED                   (IVI_SPECIFIC_ATTR_BASE + 238L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_ACP_MARKER_FUNCTION_RESULT           (IVI_SPECIFIC_ATTR_BASE + 239L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_ACP_MARKER_POSITION                  (IVI_SPECIFIC_ATTR_BASE + 240L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_ACP_MARKER_TRACE                     (IVI_SPECIFIC_ATTR_BASE + 241L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_MARKER_TYPE                      (IVI_SPECIFIC_ATTR_BASE + 242L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_MARKER_TRACE_POINTS_POSITION     (IVI_SPECIFIC_ATTR_BASE + 746L)  /* ViReal64, read-write */

/*- SweepCoupling */

#define AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_SWEEP_POINTS                      (IVI_SPECIFIC_ATTR_BASE + 167L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_SWEEP_TIME                        (IVI_SPECIFIC_ATTR_BASE + 168L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_SWEEP_TIME_AUTO_ENABLED           (IVI_SPECIFIC_ATTR_BASE + 169L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_SWEEP_TIME_AUTO_RULES             (IVI_SPECIFIC_ATTR_BASE + 170L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_CHANNEL_INTEGRATION_BANDWIDTH     (IVI_SPECIFIC_ATTR_BASE + 131L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_RESOLUTION_BANDWIDTH              (IVI_SPECIFIC_ATTR_BASE + 132L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_RESOLUTION_BANDWIDTH_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 133L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_BANDWIDTH_SHAPE                   (IVI_SPECIFIC_ATTR_BASE + 134L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_BANDWIDTH_TYPE                    (IVI_SPECIFIC_ATTR_BASE + 135L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_VIDEO_BANDWIDTH                   (IVI_SPECIFIC_ATTR_BASE + 136L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_VIDEO_BANDWIDTH_AUTO_ENABLED      (IVI_SPECIFIC_ATTR_BASE + 137L)  /* ViBoolean, read-write */

/*- Offset */

#define AGXSAN_ATTR_SA_ACP_OFFSET_TYPE                      (IVI_SPECIFIC_ATTR_BASE + 419L)  /* ViInt32, read-write */

/*- BurstPower */

#define AGXSAN_ATTR_SA_BURSTPOWER_BURST_WIDTH               (IVI_SPECIFIC_ATTR_BASE + 193L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_BURST_WIDTH_AUTO_ENABLED  (IVI_SPECIFIC_ATTR_BASE + 194L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_MEASUREMENT_METHOD        (IVI_SPECIFIC_ATTR_BASE + 195L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_SWEEP_TIME                (IVI_SPECIFIC_ATTR_BASE + 196L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_THRESHOLD                 (IVI_SPECIFIC_ATTR_BASE + 197L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_THRESHOLD_TYPE            (IVI_SPECIFIC_ATTR_BASE + 198L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_TRIGGER_SOURCE            (IVI_SPECIFIC_ATTR_BASE + 199L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_BURST_POWER_IF_GAIN_ENABLED          (IVI_SPECIFIC_ATTR_BASE + 866L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_BURST_POWER_IF_GAIN_AUTO_ENABLED     (IVI_SPECIFIC_ATTR_BASE + 867L)  /* ViBoolean, read-write */

/*- Average */

#define AGXSAN_ATTR_SA_BURSTPOWER_AVERAGE_COUNT             (IVI_SPECIFIC_ATTR_BASE + 205L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_AVERAGE_ENABLED           (IVI_SPECIFIC_ATTR_BASE + 206L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_AVERAGE_MODE              (IVI_SPECIFIC_ATTR_BASE + 207L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_AVERAGE_TYPE              (IVI_SPECIFIC_ATTR_BASE + 208L)  /* ViInt32, read-write */

/*- Display */

#define AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_TEXT              (IVI_SPECIFIC_ATTR_BASE + 213L)  /* ViString, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_BAR_GRAPH_ENABLED (IVI_SPECIFIC_ATTR_BASE + 220L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_MAX_HOLD_ENABLED  (IVI_SPECIFIC_ATTR_BASE + 221L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_MIN_HOLD_ENABLED  (IVI_SPECIFIC_ATTR_BASE + 222L)  /* ViBoolean, read-write */

/*- WindowX */

#define AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_WINDOWX_AUTO_SCALE_ENABLED (IVI_SPECIFIC_ATTR_BASE + 214L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_WINDOWX_REFERENCE          (IVI_SPECIFIC_ATTR_BASE + 215L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_WINDOWX_REF_POSITION       (IVI_SPECIFIC_ATTR_BASE + 216L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_WINDOWX_SCALE              (IVI_SPECIFIC_ATTR_BASE + 223L)  /* ViReal64, read-write */

/*- WindowY */

#define AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_WINDOWY_AUTO_SCALE_ENABLED (IVI_SPECIFIC_ATTR_BASE + 217L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_WINDOWY_REFERENCE          (IVI_SPECIFIC_ATTR_BASE + 218L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_WINDOWY_REF_POSITION       (IVI_SPECIFIC_ATTR_BASE + 219L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_WINDOWY_SCALE              (IVI_SPECIFIC_ATTR_BASE + 224L)  /* ViReal64, read-write */

/*- Marker */

#define AGXSAN_ATTR_SA_BURSTPOWER_MARKER_ACTIVE_MARKER         (IVI_SPECIFIC_ATTR_BASE + 226L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_MARKER_AMPLITUDE             (IVI_SPECIFIC_ATTR_BASE + 227L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_BURSTPOWER_MARKER_ENABLED               (IVI_SPECIFIC_ATTR_BASE + 228L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_MARKER_POSITION              (IVI_SPECIFIC_ATTR_BASE + 229L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_MARKER_TYPE                  (IVI_SPECIFIC_ATTR_BASE + 231L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_MARKER_COUNT                 (IVI_SPECIFIC_ATTR_BASE + 243L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_BURSTPOWER_MARKER_COUPLE_ENABLED        (IVI_SPECIFIC_ATTR_BASE + 244L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_MARKER_DELTA_REFERENCE       (IVI_SPECIFIC_ATTR_BASE + 245L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_MARKER_FUNCTION_RESULT       (IVI_SPECIFIC_ATTR_BASE + 246L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_BURSTPOWER_MARKER_TRACE                 (IVI_SPECIFIC_ATTR_BASE + 247L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_MARKER_TRACE_POINTS_POSITION (IVI_SPECIFIC_ATTR_BASE + 749L)  /* ViReal64, read-write */

/*- SweepCoupling */

#define AGXSAN_ATTR_SA_BURSTPOWER_SWEEPCOUPLING_BANDWIDTH_SHAPE      (IVI_SPECIFIC_ATTR_BASE + 210L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_BURSTPOWER_SWEEPCOUPLING_RESOLUTION_BANDWIDTH (IVI_SPECIFIC_ATTR_BASE + 211L)  /* ViReal64, read-write */

/*- ChannelPower */

#define AGXSAN_ATTR_SA_CHANNELPOWER_DETECTOR_TYPE              (IVI_SPECIFIC_ATTR_BASE + 248L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_DETECTOR_TYPE_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 249L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_TRIGGER_SOURCE             (IVI_SPECIFIC_ATTR_BASE + 269L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_IF_GAIN                    (IVI_SPECIFIC_ATTR_BASE + 659L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_IF_GAIN_AUTO_ENABLED       (IVI_SPECIFIC_ATTR_BASE + 660L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNEL_POWER_POWER_LIMIT               (IVI_SPECIFIC_ATTR_BASE + 861L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_CHANNEL_POWER_POWER_LIMIT_ENABLED       (IVI_SPECIFIC_ATTR_BASE + 862L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNEL_POWER_PSD_LIMIT                 (IVI_SPECIFIC_ATTR_BASE + 863L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_CHANNEL_POWER_PSD_LIMIT_ENABLED         (IVI_SPECIFIC_ATTR_BASE + 864L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNEL_POWER_PSD_UNIT                  (IVI_SPECIFIC_ATTR_BASE + 865L)  /* ViInt32, read-write */

/*- Traces */

#define AGXSAN_ATTR_SA_CHANNELPOWER_TRACES_TYPE             (IVI_SPECIFIC_ATTR_BASE + 778L)  /* ViInt32, read-write */

/*- Average */

#define AGXSAN_ATTR_SA_CHANNELPOWER_AVERAGE_COUNT           (IVI_SPECIFIC_ATTR_BASE + 251L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_AVERAGE_ENABLED         (IVI_SPECIFIC_ATTR_BASE + 252L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_AVERAGE_MODE            (IVI_SPECIFIC_ATTR_BASE + 253L)  /* ViInt32, read-write */

/*- Frequency */

#define AGXSAN_ATTR_SA_CHANNELPOWER_FREQUENCY_SPAN                            (IVI_SPECIFIC_ATTR_BASE + 262L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_FREQUENCY_PHASE_NOISE_OPTION_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 263L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_FREQUENCY_PHASE_NOISE_OPTION_STATE        (IVI_SPECIFIC_ATTR_BASE + 264L)  /* ViInt32, read-write */

/*- OffsetFilter */

#define AGXSAN_ATTR_SA_CHANNELPOWER_OFFSETFILTER_ALPHA      (IVI_SPECIFIC_ATTR_BASE + 266L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_OFFSETFILTER_ENABLED    (IVI_SPECIFIC_ATTR_BASE + 267L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_OFFSETFILTER_BANDWIDTH  (IVI_SPECIFIC_ATTR_BASE + 268L)  /* ViReal64, read-write */

/*- Marker */

#define AGXSAN_ATTR_SA_CHANNELPOWER_MARKER_ACTIVE_MARKER         (IVI_SPECIFIC_ATTR_BASE + 276L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_MARKER_AMPLITUDE             (IVI_SPECIFIC_ATTR_BASE + 277L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_CHANNELPOWER_MARKER_COUNT                 (IVI_SPECIFIC_ATTR_BASE + 278L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_CHANNELPOWER_MARKER_COUPLE_ENABLED        (IVI_SPECIFIC_ATTR_BASE + 279L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_MARKER_DELTA_REFERENCE       (IVI_SPECIFIC_ATTR_BASE + 281L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_MARKER_ENABLED               (IVI_SPECIFIC_ATTR_BASE + 282L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_MARKER_FUNCTION_RESULT       (IVI_SPECIFIC_ATTR_BASE + 283L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_CHANNELPOWER_MARKER_TYPE                  (IVI_SPECIFIC_ATTR_BASE + 284L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_MARKER_TRACE_POINTS_POSITION (IVI_SPECIFIC_ATTR_BASE + 748L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_CHANNEL_POWER_MARKER_POSITION             (IVI_SPECIFIC_ATTR_BASE + 665L)  /* ViReal64, read-write */

/*- Display */

#define AGXSAN_ATTR_SA_CHANNELPOWER_DISPLAY_BAR_GRAPH_ENABLED (IVI_SPECIFIC_ATTR_BASE + 302L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_DISPLAY_TEXT              (IVI_SPECIFIC_ATTR_BASE + 305L)  /* ViString, read-write */

/*- WindowY */

#define AGXSAN_ATTR_SA_CHANNELPOWER_DISPLAY_WINDOWY_AUTO_SCALE_ENABLED (IVI_SPECIFIC_ATTR_BASE + 301L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_DISPLAY_WINDOWY_REFERENCE          (IVI_SPECIFIC_ATTR_BASE + 303L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_DISPLAY_WINDOWY_REF_POSITION       (IVI_SPECIFIC_ATTR_BASE + 304L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_DISPLAY_WINDOWY_SCALE              (IVI_SPECIFIC_ATTR_BASE + 306L)  /* ViReal64, read-write */

/*- SweepCoupling */

#define AGXSAN_ATTR_SA_CHANNELPOWER_SWEEPCOUPLING_BANDWIDTH_SHAPE                   (IVI_SPECIFIC_ATTR_BASE + 255L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_SWEEPCOUPLING_CHANNEL_INTEGRATION_BANDWIDTH     (IVI_SPECIFIC_ATTR_BASE + 256L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_SWEEPCOUPLING_RESOLUTION_BANDWIDTH              (IVI_SPECIFIC_ATTR_BASE + 257L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_SWEEPCOUPLING_RESOLUTION_BANDWIDTH_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 258L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_SWEEPCOUPLING_VIDEO_BANDWIDTH                   (IVI_SPECIFIC_ATTR_BASE + 260L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_SWEEPCOUPLING_VIDEO_BANDWIDTH_AUTO_ENABLED      (IVI_SPECIFIC_ATTR_BASE + 261L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_SWEEPCOUPLING_SWEEP_POINTS                      (IVI_SPECIFIC_ATTR_BASE + 271L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_SWEEPCOUPLING_SWEEP_TIME                        (IVI_SPECIFIC_ATTR_BASE + 272L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_SWEEPCOUPLING_SWEEP_TIME_AUTO_ENABLED           (IVI_SPECIFIC_ATTR_BASE + 273L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_CHANNELPOWER_SWEEPCOUPLING_SWEEP_TIME_AUTO_RULES             (IVI_SPECIFIC_ATTR_BASE + 274L)  /* ViInt32, read-write */

/*- OccupiedBandwidth */

#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DETECTOR_TYPE              (IVI_SPECIFIC_ATTR_BASE + 286L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DETECTOR_TYPE_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 287L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_PERCENT_POWER              (IVI_SPECIFIC_ATTR_BASE + 319L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_LIMIT_TEST_FREQUENCY       (IVI_SPECIFIC_ATTR_BASE + 331L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_LIMIT_TEST_ENABLED         (IVI_SPECIFIC_ATTR_BASE + 332L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_TRIGGER_SOURCE             (IVI_SPECIFIC_ATTR_BASE + 333L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_IF_GAIN                    (IVI_SPECIFIC_ATTR_BASE + 661L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_IF_GAIN_AUTO_ENABLED       (IVI_SPECIFIC_ATTR_BASE + 662L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_POWER_REFERENCE_TYPE       (IVI_SPECIFIC_ATTR_BASE + 827L)  /* ViInt32, read-write */

/*- Traces */

#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_TRACES_TYPE        (IVI_SPECIFIC_ATTR_BASE + 779L)  /* ViInt32, read-write */

/*- Average */

#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_AVERAGE_COUNT      (IVI_SPECIFIC_ATTR_BASE + 289L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_AVERAGE_ENABLED    (IVI_SPECIFIC_ATTR_BASE + 290L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_AVERAGE_MODE       (IVI_SPECIFIC_ATTR_BASE + 291L)  /* ViInt32, read-write */

/*- Frequency */

#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_FREQUENCY_SPAN     (IVI_SPECIFIC_ATTR_BASE + 299L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_FREQUENCY_XDB      (IVI_SPECIFIC_ATTR_BASE + 334L)  /* ViReal64, read-write */

/*- Display */

#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DISPLAY_TEXT                            (IVI_SPECIFIC_ATTR_BASE + 311L)  /* ViString, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DISPLAY_VIEW_SELECTION                  (IVI_SPECIFIC_ATTR_BASE + 869L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DISPLAY_XDB_BOUNDARIES_ENABLED          (IVI_SPECIFIC_ATTR_BASE + 870L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DISPLAY_BOUNDARY_FREQUENCY_DISPLAY_TYPE (IVI_SPECIFIC_ATTR_BASE + 871L)  /* ViInt32, read-write */

/*- WindowY */

#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DISPLAY_WINDOWY_AUTO_SCALE_ENABLED (IVI_SPECIFIC_ATTR_BASE + 308L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DISPLAY_WINDOWY_REFERENCE          (IVI_SPECIFIC_ATTR_BASE + 309L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DISPLAY_WINDOWY_REF_POSITION       (IVI_SPECIFIC_ATTR_BASE + 310L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DISPLAY_WINDOWY_SCALE              (IVI_SPECIFIC_ATTR_BASE + 312L)  /* ViReal64, read-write */

/*- Marker */

#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_MARKER_ACTIVE_MARKER         (IVI_SPECIFIC_ATTR_BASE + 321L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_MARKER_AMPLITUDE             (IVI_SPECIFIC_ATTR_BASE + 322L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_MARKER_COUNT                 (IVI_SPECIFIC_ATTR_BASE + 323L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_MARKER_COUPLE_ENABLED        (IVI_SPECIFIC_ATTR_BASE + 324L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_MARKER_DELTA_REFERENCE       (IVI_SPECIFIC_ATTR_BASE + 325L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_MARKER_ENABLED               (IVI_SPECIFIC_ATTR_BASE + 326L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_MARKER_FUNCTION_RESULT       (IVI_SPECIFIC_ATTR_BASE + 327L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_MARKER_POSITION              (IVI_SPECIFIC_ATTR_BASE + 328L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_MARKER_TYPE                  (IVI_SPECIFIC_ATTR_BASE + 330L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_MARKER_MAX_HOLD_ENABLED      (IVI_SPECIFIC_ATTR_BASE + 209L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_MARKER_TRACE_POINTS_POSITION (IVI_SPECIFIC_ATTR_BASE + 750L)  /* ViReal64, read-write */

/*- SweepCoupling */

#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_SWEEPCOUPLING_BANDWIDTH_SHAPE                   (IVI_SPECIFIC_ATTR_BASE + 293L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_SWEEPCOUPLING_RESOLUTION_BANDWIDTH              (IVI_SPECIFIC_ATTR_BASE + 294L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_SWEEPCOUPLING_RESOLUTION_BANDWIDTH_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 295L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_SWEEPCOUPLING_VIDEO_BANDWIDTH                   (IVI_SPECIFIC_ATTR_BASE + 296L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_SWEEPCOUPLING_VIDEO_BANDWIDTH_AUTO_ENABLED      (IVI_SPECIFIC_ATTR_BASE + 297L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_SWEEPCOUPLING_SWEEP_POINTS                      (IVI_SPECIFIC_ATTR_BASE + 109L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_SWEEPCOUPLING_SWEEP_TIME                        (IVI_SPECIFIC_ATTR_BASE + 254L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_SWEEPCOUPLING_SWEEP_TIME_AUTO_ENABLED           (IVI_SPECIFIC_ATTR_BASE + 292L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_SWEEPCOUPLING_SWEEP_TIME_AUTO_RULES             (IVI_SPECIFIC_ATTR_BASE + 314L)  /* ViInt32, read-write */

/*- PowerStatistics */

#define AGXSAN_ATTR_SA_POWERSTATISTICS_SAMPLING_COUNT       (IVI_SPECIFIC_ATTR_BASE + 313L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_TRIGGER_SOURCE       (IVI_SPECIFIC_ATTR_BASE + 315L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_CHANNEL_BANDWIDTH    (IVI_SPECIFIC_ATTR_BASE + 316L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_IF_GAIN              (IVI_SPECIFIC_ATTR_BASE + 663L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_IF_GAIN_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 664L)  /* ViBoolean, read-write */

/*- Display */

#define AGXSAN_ATTR_SA_POWERSTATISTICS_DISPLAY_GAUSSIAN_LINE_ENABLED   (IVI_SPECIFIC_ATTR_BASE + 318L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_DISPLAY_REFERENCE_TRACE_ENABLED (IVI_SPECIFIC_ATTR_BASE + 338L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_DISPLAY_TEXT                    (IVI_SPECIFIC_ATTR_BASE + 339L)  /* ViString, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_DISPLAY_X_SCALE                 (IVI_SPECIFIC_ATTR_BASE + 340L)  /* ViReal64, read-write */

/*- SweepCoupling */

#define AGXSAN_ATTR_SA_POWERSTATISTICS_SWEEPCOUPLING_SWEEP_CYCLES (IVI_SPECIFIC_ATTR_BASE + 342L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_SWEEPCOUPLING_SWEEP_TIME   (IVI_SPECIFIC_ATTR_BASE + 343L)  /* ViReal64, read-write */

/*- Marker */

#define AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_ACTIVE_MARKER         (IVI_SPECIFIC_ATTR_BASE + 345L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_AMPLITUDE             (IVI_SPECIFIC_ATTR_BASE + 346L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_COUNT                 (IVI_SPECIFIC_ATTR_BASE + 347L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_COUPLE_ENABLED        (IVI_SPECIFIC_ATTR_BASE + 348L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_DELTA_REFERENCE       (IVI_SPECIFIC_ATTR_BASE + 349L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_ENABLED               (IVI_SPECIFIC_ATTR_BASE + 350L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_FUNCTION_RESULT       (IVI_SPECIFIC_ATTR_BASE + 351L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_POSITION              (IVI_SPECIFIC_ATTR_BASE + 352L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_TRACE                 (IVI_SPECIFIC_ATTR_BASE + 353L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_TYPE                  (IVI_SPECIFIC_ATTR_BASE + 354L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_TRACE_POINTS_POSITION (IVI_SPECIFIC_ATTR_BASE + 751L)  /* ViReal64, read-write */

/*- SEMask */

#define AGXSAN_ATTR_SA_SEMASK_TRIGGER_SOURCE                (IVI_SPECIFIC_ATTR_BASE + 357L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SEMASK_MEASUREMENT_TYPE              (IVI_SPECIFIC_ATTR_BASE + 358L)  /* ViInt32, read-write */

/*- Traces */

#define AGXSAN_ATTR_SA_SEMASK_TRACES_TYPE                   (IVI_SPECIFIC_ATTR_BASE + 780L)  /* ViInt32, read-write */

/*- Average */

#define AGXSAN_ATTR_SA_SEMASK_AVERAGE_COUNT                 (IVI_SPECIFIC_ATTR_BASE + 359L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SEMASK_AVERAGE_ENABLED               (IVI_SPECIFIC_ATTR_BASE + 360L)  /* ViBoolean, read-write */

/*- ReferenceChannel */

#define AGXSAN_ATTR_SA_SEMASK_REFERENCECHANNEL_CPSD                       (IVI_SPECIFIC_ATTR_BASE + 362L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_REFERENCECHANNEL_TOTAL_POWER                (IVI_SPECIFIC_ATTR_BASE + 363L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_REFERENCECHANNEL_TOTAL_POWER_AUTO_ENABLED   (IVI_SPECIFIC_ATTR_BASE + 364L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SEMASK_REFERENCECHANNEL_PEAK_POWER                 (IVI_SPECIFIC_ATTR_BASE + 365L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_REFERENCECHANNEL_DETECTOR_TYPE_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 366L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SEMASK_REFERENCECHANNEL_DETECTOR_TYPE              (IVI_SPECIFIC_ATTR_BASE + 367L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SEMASK_REFERENCECHANNEL_FREQUENCY_SPAN             (IVI_SPECIFIC_ATTR_BASE + 368L)  /* ViReal64, read-write */

/*- SweepCoupling */

#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_BANDWIDTH_SHAPE                   (IVI_SPECIFIC_ATTR_BASE + 370L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_CHANNEL_INTEGRATION_BANDWIDTH     (IVI_SPECIFIC_ATTR_BASE + 371L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_RESOLUTION_BANDWIDTH              (IVI_SPECIFIC_ATTR_BASE + 372L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_RESOLUTION_BANDWIDTH_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 373L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_SWEEP_TIME                        (IVI_SPECIFIC_ATTR_BASE + 375L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_SWEEP_TIME_AUTO_ENABLED           (IVI_SPECIFIC_ATTR_BASE + 376L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_VIDEO_BANDWIDTH                   (IVI_SPECIFIC_ATTR_BASE + 378L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_VIDEO_BANDWIDTH_AUTO_ENABLED      (IVI_SPECIFIC_ATTR_BASE + 379L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_BANDWIDTH_RATIO                   (IVI_SPECIFIC_ATTR_BASE + 374L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_BANDWIDTH_RATIO_AUTO_ENABLED      (IVI_SPECIFIC_ATTR_BASE + 377L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_MEASUREMENT_TYPE                  (IVI_SPECIFIC_ATTR_BASE + 818L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_SWEEP_TYPE_AUTO_ENABLED           (IVI_SPECIFIC_ATTR_BASE + 819L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_SWEEP_TYPE_AUTO_RULES             (IVI_SPECIFIC_ATTR_BASE + 820L)  /* ViInt32, read-write */

/*- OffsetFilter */

#define AGXSAN_ATTR_SA_SEMASK_OFFSETFILTER_ALPHA            (IVI_SPECIFIC_ATTR_BASE + 381L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_OFFSETFILTER_ENABLED          (IVI_SPECIFIC_ATTR_BASE + 382L)  /* ViBoolean, read-write */

/*- Display */

#define AGXSAN_ATTR_SA_SEMASK_DISPLAY_TEXT                  (IVI_SPECIFIC_ATTR_BASE + 387L)  /* ViString, read-write */
#define AGXSAN_ATTR_SA_SEMASK_DISPLAY_VIEW                  (IVI_SPECIFIC_ATTR_BASE + 395L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SEMASK_DISPLAY_VIEW_SELECTION        (IVI_SPECIFIC_ATTR_BASE + 396L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SEMASK_DISPLAY_LIMIT_LINE_ENABLED    (IVI_SPECIFIC_ATTR_BASE + 397L)  /* ViBoolean, read-write */

/*- WindowY */

#define AGXSAN_ATTR_SA_SEMASK_DISPLAY_WINDOWY_AUTO_SCALE_ENABLED (IVI_SPECIFIC_ATTR_BASE + 384L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SEMASK_DISPLAY_WINDOWY_REFERENCE          (IVI_SPECIFIC_ATTR_BASE + 385L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_DISPLAY_WINDOWY_REF_POSITION       (IVI_SPECIFIC_ATTR_BASE + 386L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SEMASK_DISPLAY_WINDOWY_SCALE              (IVI_SPECIFIC_ATTR_BASE + 388L)  /* ViReal64, read-write */

/*- WindowX */

#define AGXSAN_ATTR_SA_SEMASK_DISPLAY_WINDOWX_REFERENCE          (IVI_SPECIFIC_ATTR_BASE + 814L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_DISPLAY_WINDOWX_SCALE              (IVI_SPECIFIC_ATTR_BASE + 815L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_DISPLAY_WINDOWX_REF_POSITION       (IVI_SPECIFIC_ATTR_BASE + 816L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SEMASK_DISPLAY_WINDOWX_AUTO_SCALE_ENABLED (IVI_SPECIFIC_ATTR_BASE + 817L)  /* ViBoolean, read-write */

/*- Marker */

#define AGXSAN_ATTR_SA_SEMASK_MARKER_ACTIVE_MARKER          (IVI_SPECIFIC_ATTR_BASE + 399L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SEMASK_MARKER_AMPLITUDE              (IVI_SPECIFIC_ATTR_BASE + 400L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_SEMASK_MARKER_COUNT                  (IVI_SPECIFIC_ATTR_BASE + 401L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_SEMASK_MARKER_COUPLE_ENABLED         (IVI_SPECIFIC_ATTR_BASE + 402L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SEMASK_MARKER_ENABLED                (IVI_SPECIFIC_ATTR_BASE + 404L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SEMASK_MARKER_FUNCTION_RESULT        (IVI_SPECIFIC_ATTR_BASE + 405L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_SEMASK_MARKER_POSITION               (IVI_SPECIFIC_ATTR_BASE + 406L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SEMASK_MARKER_TYPE                   (IVI_SPECIFIC_ATTR_BASE + 408L)  /* ViInt32, read-write */

/*- Offset */

#define AGXSAN_ATTR_SA_SEMASK_OFFSET_DETECTOR_TYPE              (IVI_SPECIFIC_ATTR_BASE + 407L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SEMASK_OFFSET_DETECTOR_TYPE_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 409L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SEMASK_OFFSET_TYPE                       (IVI_SPECIFIC_ATTR_BASE + 420L)  /* ViInt32, read-write */

/*- SpuriousEmissions */

#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_FAST_MEASUREMENT_ENABLED (IVI_SPECIFIC_ATTR_BASE + 426L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_LIMIT_TEST_FAIL_STATE    (IVI_SPECIFIC_ATTR_BASE + 427L)  /* ViBoolean, read-only */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MEASUREMENT_TYPE         (IVI_SPECIFIC_ATTR_BASE + 428L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_REPORT_MODE              (IVI_SPECIFIC_ATTR_BASE + 429L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_TRIGGER_SOURCE           (IVI_SPECIFIC_ATTR_BASE + 430L)  /* ViInt32, read-write */

/*- Average */

#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_AVERAGE_COUNT      (IVI_SPECIFIC_ATTR_BASE + 423L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_AVERAGE_ENABLED    (IVI_SPECIFIC_ATTR_BASE + 424L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_AVERAGE_MODE       (IVI_SPECIFIC_ATTR_BASE + 425L)  /* ViInt32, read-write */

/*- Display */

#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_DISPLAY_VIEW       (IVI_SPECIFIC_ATTR_BASE + 453L)  /* ViInt32, read-write */

/*- WindowY */

#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_DISPLAY_WINDOWY_AUTO_SCALE_ENABLED (IVI_SPECIFIC_ATTR_BASE + 434L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_DISPLAY_WINDOWY_REFERENCE          (IVI_SPECIFIC_ATTR_BASE + 435L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_DISPLAY_WINDOWY_SCALE              (IVI_SPECIFIC_ATTR_BASE + 436L)  /* ViReal64, read-write */

/*- Marker */

#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_ACTIVE_MARKER                  (IVI_SPECIFIC_ATTR_BASE + 438L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_AMPLITUDE                      (IVI_SPECIFIC_ATTR_BASE + 439L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_COUNT                          (IVI_SPECIFIC_ATTR_BASE + 440L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_COUPLE_ENABLED                 (IVI_SPECIFIC_ATTR_BASE + 441L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_DELTA_REFERENCE                (IVI_SPECIFIC_ATTR_BASE + 442L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_ENABLED                        (IVI_SPECIFIC_ATTR_BASE + 443L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_FUNCTION_RESULT                (IVI_SPECIFIC_ATTR_BASE + 444L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_POSITION                       (IVI_SPECIFIC_ATTR_BASE + 445L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_TRACE                          (IVI_SPECIFIC_ATTR_BASE + 446L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_TYPE                           (IVI_SPECIFIC_ATTR_BASE + 447L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_CONTINUOUS_PEAK_SEARCH_ENABLED (IVI_SPECIFIC_ATTR_BASE + 448L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_TRACE_POINTS_POSITION          (IVI_SPECIFIC_ATTR_BASE + 752L)  /* ViReal64, read-write */

/*- RangeTable */

#define AGXSAN_ATTR_SA_SPURIOUS_EMISSION_RANGE_TABLE_SWEEP_TYPE_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 822L)  /* ViBoolean, read-write */

/*- HarmonicDistortion */

#define AGXSAN_ATTR_SA_HARMONICDISTORTION_NUMBER_OF_HARMONICS                (IVI_SPECIFIC_ATTR_BASE + 459L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_FUNDAMENTAL_FREQUENCY              (IVI_SPECIFIC_ATTR_BASE + 460L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_FUNDAMENTAL_FREQUENCY_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 461L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_FREQUENCY_STEP                     (IVI_SPECIFIC_ATTR_BASE + 462L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_TRIGGER_SOURCE                     (IVI_SPECIFIC_ATTR_BASE + 470L)  /* ViInt32, read-write */

/*- Trace */

#define AGXSAN_ATTR_SA_HARMONICDISTORTION_TRACE_TYPE        (IVI_SPECIFIC_ATTR_BASE + 777L)  /* ViInt32, read-write */

/*- Average */

#define AGXSAN_ATTR_SA_HARMONICDISTORTION_AVERAGE_COUNT     (IVI_SPECIFIC_ATTR_BASE + 456L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_AVERAGE_ENABLED   (IVI_SPECIFIC_ATTR_BASE + 457L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_AVERAGE_MODE      (IVI_SPECIFIC_ATTR_BASE + 458L)  /* ViInt32, read-write */

/*- SweepCoupling */

#define AGXSAN_ATTR_SA_HARMONICDISTORTION_SWEEPCOUPLING_RESOLUTION_BANDWIDTH              (IVI_SPECIFIC_ATTR_BASE + 464L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_SWEEPCOUPLING_RESOLUTION_BANDWIDTH_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 465L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_SWEEPCOUPLING_SWEEP_TIME                        (IVI_SPECIFIC_ATTR_BASE + 466L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_SWEEPCOUPLING_SWEEP_TIME_AUTO_ENABLED           (IVI_SPECIFIC_ATTR_BASE + 467L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_SWEEPCOUPLING_VIDEO_BANDWIDTH                   (IVI_SPECIFIC_ATTR_BASE + 468L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_SWEEPCOUPLING_VIDEO_BANDWIDTH_AUTO_ENABLED      (IVI_SPECIFIC_ATTR_BASE + 469L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SWEEP_TIME_ENABLED                                                    (IVI_SPECIFIC_ATTR_BASE + 747L)  /* ViBoolean, read-write */

/*- RangeTable */

#define AGXSAN_ATTR_SA_HARMONICDISTORTION_RANGETABLE_ENABLED (IVI_SPECIFIC_ATTR_BASE + 472L)  /* ViBoolean, read-write */

/*- DisplayWindowY */

#define AGXSAN_ATTR_SA_HARMONICDISTORTION_DISPLAYWINDOWY_REFERENCE    (IVI_SPECIFIC_ATTR_BASE + 477L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_DISPLAYWINDOWY_REF_POSITION (IVI_SPECIFIC_ATTR_BASE + 478L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_HARMONICDISTORTION_DISPLAYWINDOWY_SCALE        (IVI_SPECIFIC_ATTR_BASE + 479L)  /* ViReal64, read-write */

/*- ThirdOrderIntercept */

#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_TRIGGER_SOURCE                    (IVI_SPECIFIC_ATTR_BASE + 495L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_UPPER_TONE_FREQUENCY              (IVI_SPECIFIC_ATTR_BASE + 496L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_LOWER_TONE_FREQUENCY              (IVI_SPECIFIC_ATTR_BASE + 497L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_LOWER_TONE_FREQUENCY_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 498L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_UPPER_TONE_FREQUENCY_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 499L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_SPAN                              (IVI_SPECIFIC_ATTR_BASE + 500L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_MAX_MIXER_LEVEL                   (IVI_SPECIFIC_ATTR_BASE + 501L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_ZERO_SPAN_ENABLED                 (IVI_SPECIFIC_ATTR_BASE + 506L)  /* ViBoolean, read-write */

/*- Average */

#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_AVERAGE_COUNT    (IVI_SPECIFIC_ATTR_BASE + 482L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_AVERAGE_ENABLED  (IVI_SPECIFIC_ATTR_BASE + 483L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_AVERAGE_MODE     (IVI_SPECIFIC_ATTR_BASE + 484L)  /* ViInt32, read-write */

/*- SweepCoupling */

#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_SWEEPCOUPLING_RESOLUTION_BANDWIDTH                            (IVI_SPECIFIC_ATTR_BASE + 486L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_SWEEPCOUPLING_RESOLUTION_BANDWIDTH_AUTO_ENABLED               (IVI_SPECIFIC_ATTR_BASE + 487L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_SWEEPCOUPLING_SWEEP_POINTS                                    (IVI_SPECIFIC_ATTR_BASE + 488L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_SWEEPCOUPLING_SWEEP_TIME                                      (IVI_SPECIFIC_ATTR_BASE + 489L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_SWEEPCOUPLING_SWEEP_TIME_AUTO_ENABLED                         (IVI_SPECIFIC_ATTR_BASE + 490L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_SWEEPCOUPLING_VIDEO_BANDWIDTH                                 (IVI_SPECIFIC_ATTR_BASE + 491L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_SWEEPCOUPLING_VIDEO_BANDWIDTH_AUTO_ENABLED                    (IVI_SPECIFIC_ATTR_BASE + 492L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_SWEEPCOUPLING_BANDWIDTH_RATIO                                 (IVI_SPECIFIC_ATTR_BASE + 493L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_SWEEPCOUPLING_BANDWIDTH_RATIO_AUTO_ENABLED                    (IVI_SPECIFIC_ATTR_BASE + 494L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_SWEEPCOUPLING_SPAN_TO_RESOLUTION_BANDWIDTH_RATIO              (IVI_SPECIFIC_ATTR_BASE + 503L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_SWEEPCOUPLING_SPAN_TO_RESOLUTION_BANDWIDTH_RATIO_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 504L)  /* ViBoolean, read-write */

/*- Traces */

#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_TRACES_TYPE      (IVI_SPECIFIC_ATTR_BASE + 781L)  /* ViInt32, read-write */

/*- ZeroSpanSweepCoupling */

#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_ZEROSPANSWEEPCOUPLING_RESOLUTION_BANDWIDTH              (IVI_SPECIFIC_ATTR_BASE + 505L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_ZEROSPANSWEEPCOUPLING_RESOLUTION_BANDWIDTH_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 507L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_ZEROSPANSWEEPCOUPLING_SWEEP_TIME                        (IVI_SPECIFIC_ATTR_BASE + 508L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_ZEROSPANSWEEPCOUPLING_SWEEP_TIME_AUTO_ENABLED           (IVI_SPECIFIC_ATTR_BASE + 509L)  /* ViBoolean, read-write */

/*- DisplayWindowY */

#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_DISPLAYWINDOWY_REFERENCE    (IVI_SPECIFIC_ATTR_BASE + 579L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_DISPLAYWINDOWY_REF_POSITION (IVI_SPECIFIC_ATTR_BASE + 580L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_DISPLAYWINDOWY_SCALE        (IVI_SPECIFIC_ATTR_BASE + 581L)  /* ViReal64, read-write */

/*- Gating */

#define AGXSAN_ATTR_SA_GATING_DELAY                         (IVI_SPECIFIC_ATTR_BASE + 526L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_GATING_ENABLED                       (IVI_SPECIFIC_ATTR_BASE + 527L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_GATING_LENGTH                        (IVI_SPECIFIC_ATTR_BASE + 528L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_GATING_METHOD                        (IVI_SPECIFIC_ATTR_BASE + 529L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_GATING_MIN_FAST                      (IVI_SPECIFIC_ATTR_BASE + 530L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_GATING_SOURCE                        (IVI_SPECIFIC_ATTR_BASE + 531L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_GATING_TYPE                          (IVI_SPECIFIC_ATTR_BASE + 532L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_GATING_VIEW                          (IVI_SPECIFIC_ATTR_BASE + 533L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_GATING_VIEW_SWEEP_TIME               (IVI_SPECIFIC_ATTR_BASE + 534L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_GATING_HOLD_OFF_TIME                 (IVI_SPECIFIC_ATTR_BASE + 535L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_GATING_HOLD_OFF_TIME_AUTO_ENABLED    (IVI_SPECIFIC_ATTR_BASE + 536L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_GATING_DELAY_COMPENSATION            (IVI_SPECIFIC_ATTR_BASE + 537L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_GATING_VIEW_START_TIME               (IVI_SPECIFIC_ATTR_BASE + 875L)  /* ViReal64, read-write */

/*- Limit */

#define AGXSAN_ATTR_SA_LIMIT_AMPLITUDE_INTERPOLATOR               (IVI_SPECIFIC_ATTR_BASE + 614L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_LIMIT_COMMENT                              (IVI_SPECIFIC_ATTR_BASE + 618L)  /* ViString, read-write */
#define AGXSAN_ATTR_SA_LIMIT_DISPLAY_ENABLED                      (IVI_SPECIFIC_ATTR_BASE + 619L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_LIMIT_DOMAIN                               (IVI_SPECIFIC_ATTR_BASE + 620L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_LIMIT_ENABLED                              (IVI_SPECIFIC_ATTR_BASE + 621L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_LIMIT_FAIL                                 (IVI_SPECIFIC_ATTR_BASE + 622L)  /* ViBoolean, read-only */
#define AGXSAN_ATTR_SA_LIMIT_FREQUENCY_INTERPOLATOR               (IVI_SPECIFIC_ATTR_BASE + 623L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_LIMIT_MARGIN                               (IVI_SPECIFIC_ATTR_BASE + 624L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_LIMIT_MARGIN_ENABLED                       (IVI_SPECIFIC_ATTR_BASE + 625L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_LIMIT_MODE                                 (IVI_SPECIFIC_ATTR_BASE + 626L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_LIMIT_REALTIVE_TO_CENTER_FREQUENCY_ENABLED (IVI_SPECIFIC_ATTR_BASE + 627L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_LIMIT_RELATIVE_TO_AMPLITUDE_ENABLED        (IVI_SPECIFIC_ATTR_BASE + 628L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_LIMIT_TEST_TRACE                           (IVI_SPECIFIC_ATTR_BASE + 629L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_LIMIT_TYPE                                 (IVI_SPECIFIC_ATTR_BASE + 630L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_LIMIT_X_OFFSET                             (IVI_SPECIFIC_ATTR_BASE + 631L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_LIMIT_Y_OFFSET                             (IVI_SPECIFIC_ATTR_BASE + 632L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_LIMIT_LINE_ENABLED                         (IVI_SPECIFIC_ATTR_BASE + 745L)  /* ViBoolean, read-write */

/*- ListSweep */

#define AGXSAN_ATTR_SA_LISTSWEEP_ENABLED                    (IVI_SPECIFIC_ATTR_BASE + 754L)  /* ViBoolean, read-write */

/*- Bandwidth */

#define AGXSAN_ATTR_SA_LISTSWEEP_BANDWIDTH_RESOLUTION_POINTS      (IVI_SPECIFIC_ATTR_BASE + 634L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_LISTSWEEP_BANDWIDTH_RESOLUTION_TYPE_POINTS (IVI_SPECIFIC_ATTR_BASE + 635L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_LISTSWEEP_BANDWIDTH_VIDEO_POINTS           (IVI_SPECIFIC_ATTR_BASE + 636L)  /* ViInt32, read-only */

/*- Frequency */

#define AGXSAN_ATTR_SA_LISTSWEEP_FREQUENCY_POINTS                 (IVI_SPECIFIC_ATTR_BASE + 638L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_LISTSWEEP_FREQUENCY_SYNTHESIS              (IVI_SPECIFIC_ATTR_BASE + 639L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_LISTSWEEP_FREQUENCY_SYNTHESIS_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 640L)  /* ViBoolean, read-write */

/*- Sequence */

#define AGXSAN_ATTR_SA_LISTSWEEP_SEQUENCE_AUTO_ENABLED      (IVI_SPECIFIC_ATTR_BASE + 642L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_LISTSWEEP_SEQUENCE_POINTS            (IVI_SPECIFIC_ATTR_BASE + 643L)  /* ViInt32, read-only */

/*- Trigger */

#define AGXSAN_ATTR_SA_LISTSWEEP_TRIGGER_DELAY_POINTS       (IVI_SPECIFIC_ATTR_BASE + 645L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_LISTSWEEP_TRIGGER_HOLDOFF_POINTS     (IVI_SPECIFIC_ATTR_BASE + 646L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_LISTSWEEP_TRIGGER_LEVEL_POINTS       (IVI_SPECIFIC_ATTR_BASE + 647L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_LISTSWEEP_TRIGGER_SLOPE_POINTS       (IVI_SPECIFIC_ATTR_BASE + 648L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_LISTSWEEP_TRIGGER_SOURCE_POINTS      (IVI_SPECIFIC_ATTR_BASE + 649L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_LISTSWEEP_TRIGGER_SLOPE              (IVI_SPECIFIC_ATTR_BASE + 657L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_LISTSWEEP_TRIGGER_SOURCE             (IVI_SPECIFIC_ATTR_BASE + 658L)  /* ViInt32, read-write */

/*- Time */

#define AGXSAN_ATTR_SA_LISTSWEEP_TIME_POINTS                (IVI_SPECIFIC_ATTR_BASE + 651L)  /* ViInt32, read-only */

/*- Detector */

#define AGXSAN_ATTR_SA_LISTSWEEP_DETECTOR_POINTS            (IVI_SPECIFIC_ATTR_BASE + 653L)  /* ViInt32, read-only */

/*- Attenuation */

#define AGXSAN_ATTR_SA_LISTSWEEP_ATTENUATION_ELECTRONIC_POINTS (IVI_SPECIFIC_ATTR_BASE + 655L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_LISTSWEEP_ATTENUATION_MECHANICAL_POINTS (IVI_SPECIFIC_ATTR_BASE + 656L)  /* ViInt32, read-only */

/*- SweepCoupling */

#define AGXSAN_ATTR_SA_SWEEPCOUPLING_BANDWIDTH_RATIO                    (IVI_SPECIFIC_ATTR_BASE + 722L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_BANDWIDTH_RATIO_AUTO_ENABLED       (IVI_SPECIFIC_ATTR_BASE + 723L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_SWEEP_POINTS                       (IVI_SPECIFIC_ATTR_BASE + 724L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_FFT_WIDTH                          (IVI_SPECIFIC_ATTR_BASE + 725L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_FFT_WIDTH_AUTO_ENABLED             (IVI_SPECIFIC_ATTR_BASE + 726L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_FFT_WIDTH_TO_SPAN_RATIO            (IVI_SPECIFIC_ATTR_BASE + 727L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_SWEEP_TYPE_AUTO_RULES              (IVI_SPECIFIC_ATTR_BASE + 728L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_SWEEP_TYPE_AUTO_RULES_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 729L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_BANDWIDTH_SHAPE                    (IVI_SPECIFIC_ATTR_BASE + 730L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_BANDWIDTH_TYPE                     (IVI_SPECIFIC_ATTR_BASE + 731L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_SWEEP_TIME_AUTO_RULES              (IVI_SPECIFIC_ATTR_BASE + 732L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_SWEEP_TIME_AUTO_RULES_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 733L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_SWEEP_TYPE                         (IVI_SPECIFIC_ATTR_BASE + 734L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SWEEPCOUPLING_SWEEP_TYPE_AUTO_ENABLED            (IVI_SPECIFIC_ATTR_BASE + 735L)  /* ViBoolean, read-write */

/*- Marker */

#define AGXSAN_ATTR_SA_MARKER_COUPLE_ENABLED                  (IVI_SPECIFIC_ATTR_BASE + 689L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_DELTA_REFERENCE                 (IVI_SPECIFIC_ATTR_BASE + 690L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_MARKER_ENABLED                         (IVI_SPECIFIC_ATTR_BASE + 691L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_FUNCTION                        (IVI_SPECIFIC_ATTR_BASE + 692L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_MARKER_FUNCTION_BAND_LEFT              (IVI_SPECIFIC_ATTR_BASE + 693L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_MARKER_FUNCTION_BAND_RIGHT             (IVI_SPECIFIC_ATTR_BASE + 694L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_MARKER_FUNCTION_BAND_SPAN              (IVI_SPECIFIC_ATTR_BASE + 695L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_MARKER_LINES_ENABLED                   (IVI_SPECIFIC_ATTR_BASE + 696L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_PEAK_TABLE_ENABLED              (IVI_SPECIFIC_ATTR_BASE + 697L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_X_AXIS_SCALE                    (IVI_SPECIFIC_ATTR_BASE + 698L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_MARKER_X_AXIS_SCALE_AUTO_ENABLED       (IVI_SPECIFIC_ATTR_BASE + 699L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_TABLE_ENABLED                   (IVI_SPECIFIC_ATTR_BASE + 700L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_TRACE_AUTO_ENABLED              (IVI_SPECIFIC_ATTR_BASE + 701L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_Y                               (IVI_SPECIFIC_ATTR_BASE + 702L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_MARKER_CONTINUOUS_PEAK_SEARCH_ENABLED  (IVI_SPECIFIC_ATTR_BASE + 703L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_FUNCTION_BAND_SPAN_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 704L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_THRESHOLD_ENABLED               (IVI_SPECIFIC_ATTR_BASE + 705L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_PEAK_EXCURSION_ENABLED          (IVI_SPECIFIC_ATTR_BASE + 706L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_PEAK_TABLE_READOUT_MODE         (IVI_SPECIFIC_ATTR_BASE + 707L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_MARKER_PEAK_SORT_MODE                  (IVI_SPECIFIC_ATTR_BASE + 708L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_MARKER_PEAK_SEARCH_MODE                (IVI_SPECIFIC_ATTR_BASE + 709L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_MARKER_X_AXIS_TRACE_POINTS             (IVI_SPECIFIC_ATTR_BASE + 710L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_MARKER_ACTIVE_MARKER                   (IVI_SPECIFIC_ATTR_BASE + 711L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_MARKER_AMPLITUDE                       (IVI_SPECIFIC_ATTR_BASE + 712L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_MARKER_COUNT                           (IVI_SPECIFIC_ATTR_BASE + 713L)  /* ViInt32, read-only */
#define AGXSAN_ATTR_SA_MARKER_PEAK_EXCURSION                  (IVI_SPECIFIC_ATTR_BASE + 714L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_MARKER_POSITION                        (IVI_SPECIFIC_ATTR_BASE + 715L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_MARKER_REFERENCE_AMPLITUDE             (IVI_SPECIFIC_ATTR_BASE + 716L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_MARKER_REFERENCE_POSITION              (IVI_SPECIFIC_ATTR_BASE + 717L)  /* ViReal64, read-only */
#define AGXSAN_ATTR_SA_MARKER_SIGNAL_TRACK_ENABLED            (IVI_SPECIFIC_ATTR_BASE + 718L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_THRESHOLD                       (IVI_SPECIFIC_ATTR_BASE + 719L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_MARKER_TRACE                           (IVI_SPECIFIC_ATTR_BASE + 720L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_MARKER_TYPE                            (IVI_SPECIFIC_ATTR_BASE + 721L)  /* ViInt32, read-write */

/*- FrequencyCounter */

#define AGXSAN_ATTR_SA_MARKER_FREQUENCYCOUNTER_GATE_TIME               (IVI_SPECIFIC_ATTR_BASE + 683L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_MARKER_FREQUENCYCOUNTER_GATE_TIME_AUTO_ENABLED  (IVI_SPECIFIC_ATTR_BASE + 684L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_FREQUENCYCOUNTER_RESOLUTION_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 685L)  /* ViBoolean, read-write */

/*- NDBPoints */

#define AGXSAN_ATTR_SA_MARKER_NDBPOINTS_ENABLED             (IVI_SPECIFIC_ATTR_BASE + 686L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_NDBPOINTS_VALUE               (IVI_SPECIFIC_ATTR_BASE + 687L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_MARKER_NDBPOINTS_RESULTS             (IVI_SPECIFIC_ATTR_BASE + 688L)  /* ViReal64, read-only */

/*- MeasureAtMarker */

#define AGXSAN_ATTR_SA_MARKER_MEASUREATMARKER_COUPLE_ENABLED                (IVI_SPECIFIC_ATTR_BASE + 753L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_MARKER_MEASUREATMARKER_PRESELECTOR_CENTERING_ENABLED (IVI_SPECIFIC_ATTR_BASE + 755L)  /* ViBoolean, read-write */

/*- Source */

#define AGXSAN_ATTR_SA_SOURCE_RF_OUTPUT_ENABLED             (IVI_SPECIFIC_ATTR_BASE + 784L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SOURCE_MODE                          (IVI_SPECIFIC_ATTR_BASE + 799L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SOURCE_ADDRESS                       (IVI_SPECIFIC_ATTR_BASE + 800L)  /* ViString, read-write */
#define AGXSAN_ATTR_SA_SOURCE_POINT_TRIGGER_TYPE            (IVI_SPECIFIC_ATTR_BASE + 801L)  /* ViInt32, read-write */

/*- Level */

#define AGXSAN_ATTR_SA_SOURCE_LEVEL_AMPLITUDE                   (IVI_SPECIFIC_ATTR_BASE + 785L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SOURCE_LEVEL_POWER_SWEEP                 (IVI_SPECIFIC_ATTR_BASE + 788L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SOURCE_LEVEL_POWER_SWEEP_ENABLED         (IVI_SPECIFIC_ATTR_BASE + 789L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SOURCE_LEVEL_AMPLITUDE_OFFSET            (IVI_SPECIFIC_ATTR_BASE + 790L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SOURCE_LEVEL_AMPLITUDE_STEP              (IVI_SPECIFIC_ATTR_BASE + 791L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SOURCE_LEVEL_AMPLITUDE_STEP_AUTO_ENABLED (IVI_SPECIFIC_ATTR_BASE + 792L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SOURCE_LEVEL_TRACK_DELAY                 (IVI_SPECIFIC_ATTR_BASE + 793L)  /* ViReal64, read-write */

/*- Frequency */

#define AGXSAN_ATTR_SA_SOURCE_FREQUENCY_MULTIPLIER_NUMERATOR   (IVI_SPECIFIC_ATTR_BASE + 794L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SOURCE_FREQUENCY_MULTIPLIER_DENOMINATOR (IVI_SPECIFIC_ATTR_BASE + 795L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SA_SOURCE_FREQUENCY_SWEEP_REVERSE_ENABLED  (IVI_SPECIFIC_ATTR_BASE + 796L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SOURCE_FREQUENCY_OFFSET                 (IVI_SPECIFIC_ATTR_BASE + 797L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SA_SOURCE_FREQUENCY_OFFSET_ENABLED         (IVI_SPECIFIC_ATTR_BASE + 798L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SA_SOURCE_FREQUENCY_STEP_INCREMENT         (IVI_SPECIFIC_ATTR_BASE + 943L)  /* ViReal64, read-write */

/*- RefOscillator */

#define AGXSAN_ATTR_REFOSCILLATOR_EXTERNAL_COUPLING         (IVI_SPECIFIC_ATTR_BASE + 538L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_REFOSCILLATOR_EXTERNAL_BANDWIDTH        (IVI_SPECIFIC_ATTR_BASE + 539L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_REFOSCILLATOR_SOURCE                    (IVI_SPECIFIC_ATTR_BASE + 877L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_REFOSCILLATOR_EXTERNAL_FREQUENCY        (IVI_SPECIFIC_ATTR_BASE + 878L)  /* ViReal64, read-write */

/*- StateTrigger */

#define AGXSAN_ATTR_STATETRIGGER_DETECTION                  (IVI_SPECIFIC_ATTR_BASE + 159L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_STATETRIGGER_ENABLED                    (IVI_SPECIFIC_ATTR_BASE + 160L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_STATETRIGGER_EVENT_ID                   (IVI_SPECIFIC_ATTR_BASE + 161L)  /* ViString, read-write */
#define AGXSAN_ATTR_STATETRIGGER_FILTER                     (IVI_SPECIFIC_ATTR_BASE + 162L)  /* ViString, read-write */
#define AGXSAN_ATTR_STATETRIGGER_STATE_LOCATION             (IVI_SPECIFIC_ATTR_BASE + 163L)  /* ViString, read-write */

/*- System */

#define AGXSAN_ATTR_SYSTEM_DATE                             (IVI_SPECIFIC_ATTR_BASE + 172L)  /* ViString, read-write */
#define AGXSAN_ATTR_SYSTEM_SERIAL_NUMBER                    (IVI_SPECIFIC_ATTR_BASE + 173L)  /* ViString, read-only */
#define AGXSAN_ATTR_SYSTEM_TIME                             (IVI_SPECIFIC_ATTR_BASE + 174L)  /* ViString, read-write */
#define AGXSAN_ATTR_SYSTEM_TIMEOUT_MILLISECONDS             (IVI_SPECIFIC_ATTR_BASE + 175L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SYSTEM_TRACE_ENABLED                    (IVI_SPECIFIC_ATTR_BASE + 176L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SYSTEM_IO_TIMEOUT                       (IVI_SPECIFIC_ATTR_BASE + 783L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_FORMAT                                  (IVI_SPECIFIC_ATTR_BASE + 876L)  /* ViInt32, read-write */

/*- Radio */

#define AGXSAN_ATTR_RADIO_DEVICE                            (IVI_SPECIFIC_ATTR_BASE + 547L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_RADIO_STANDARD                          (IVI_SPECIFIC_ATTR_BASE + 548L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_RADIO_NON_STANDARD_MEASUREMENT_ENABLED  (IVI_SPECIFIC_ATTR_BASE + 549L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_RADIO_BAND_CLASS                        (IVI_SPECIFIC_ATTR_BASE + 550L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_RADIO_PACKET_TYPE                       (IVI_SPECIFIC_ATTR_BASE + 551L)  /* ViInt32, read-write */

/*- AnalogDemodulator */

#define AGXSAN_ATTR_ANALOGDEMODULATOR_TYPE                  (IVI_SPECIFIC_ATTR_BASE + 556L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_ANALOGDEMODULATOR_CHANNEL_BANDWIDTH     (IVI_SPECIFIC_ATTR_BASE + 557L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_ANALOGDEMODULATOR_ENABLED               (IVI_SPECIFIC_ATTR_BASE + 558L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_ANALOGDEMODULATOR_TIME                  (IVI_SPECIFIC_ATTR_BASE + 559L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_ANALOGDEMODULATOR_FM_DE_EMPHASIS        (IVI_SPECIFIC_ATTR_BASE + 560L)  /* ViInt32, read-write */

/*- Input */

#define AGXSAN_ATTR_INPUT_AMPLITUDE_REFERENCE               (IVI_SPECIFIC_ATTR_BASE + 562L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_INPUT_PORT                              (IVI_SPECIFIC_ATTR_BASE + 563L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_INPUT_TYPE                              (IVI_SPECIFIC_ATTR_BASE + 774L)  /* ViInt32, read-write */

/*- IF */

#define AGXSAN_ATTR_INPUT_IF_FFT_IF_GAIN_STATE              (IVI_SPECIFIC_ATTR_BASE + 565L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_INPUT_IF_FFT_IF_GAIN_AUTO_ENABLED       (IVI_SPECIFIC_ATTR_BASE + 566L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_INPUT_IF_SWEPT_IF_GAIN_AUTO_ENABLED     (IVI_SPECIFIC_ATTR_BASE + 567L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_INPUT_IF_SWEPT_IF_GAIN_STATE            (IVI_SPECIFIC_ATTR_BASE + 568L)  /* ViInt32, read-write */

/*- RF */

#define AGXSAN_ATTR_INPUT_RF_COUPLING                       (IVI_SPECIFIC_ATTR_BASE + 571L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_INPUT_RF_MAX_MIXER_LEVEL                (IVI_SPECIFIC_ATTR_BASE + 572L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_INPUT_RF_PREAMP_ENABLED                 (IVI_SPECIFIC_ATTR_BASE + 573L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_INPUT_RF_AUTO_RANGE_ENABLED             (IVI_SPECIFIC_ATTR_BASE + 587L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_INPUT_RF_CENTER_FREQUENCY               (IVI_SPECIFIC_ATTR_BASE + 744L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_INPUT_RF_PRESELECTOR_ENABLED            (IVI_SPECIFIC_ATTR_BASE + 775L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_INPUT_RF_RANGE                          (IVI_SPECIFIC_ATTR_BASE + 872L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_INPUT_RF_PEAK_TO_AVERAGE                (IVI_SPECIFIC_ATTR_BASE + 873L)  /* ViReal64, read-write */

/*- Correction */

#define AGXSAN_ATTR_INPUT_RF_CORRECTION_ENABLED                 (IVI_SPECIFIC_ATTR_BASE + 574L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_INPUT_RF_CORRECTION_FREQUENCY_INTERPOLATION (IVI_SPECIFIC_ATTR_BASE + 575L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_INPUT_RF_CORRECTION_ANTENNA_UNIT            (IVI_SPECIFIC_ATTR_BASE + 736L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_INPUT_RF_CORRECTION_COMMENT                 (IVI_SPECIFIC_ATTR_BASE + 737L)  /* ViString, read-write */
#define AGXSAN_ATTR_INPUT_RF_CORRECTION_DESCRIPTION             (IVI_SPECIFIC_ATTR_BASE + 738L)  /* ViString, read-write */

/*- Corrections */

#define AGXSAN_ATTR_INPUT_RF_CORRECTIONS_ALL_ENABLED                    (IVI_SPECIFIC_ATTR_BASE + 576L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_INPUT_RF_CORRECTIONS_IMPEDANCE                      (IVI_SPECIFIC_ATTR_BASE + 739L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_INPUT_RF_CORRECTIONS_BASE_STATION_GAIN              (IVI_SPECIFIC_ATTR_BASE + 673L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_INPUT_RF_CORRECTIONS_EXTERNAL_GAIN                  (IVI_SPECIFIC_ATTR_BASE + 570L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_INPUT_RF_CORRECTIONS_MOBILE_STATION_GAIN            (IVI_SPECIFIC_ATTR_BASE + 740L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_INPUT_RF_CORRECTIONS_NOISE_FLOOR_EXTENSTION_ENABLED (IVI_SPECIFIC_ATTR_BASE + 741L)  /* ViBoolean, read-write */

/*- Calibration */

#define AGXSAN_ATTR_CALIBRATION_AUTO_ALERT_MODE             (IVI_SPECIFIC_ATTR_BASE + 674L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_CALIBRATION_AUTO_ENABLED                (IVI_SPECIFIC_ATTR_BASE + 675L)  /* ViInt32, read-write */

/*- RFPreselector */

#define AGXSAN_ATTR_CALIBRATION_RFPRESELECTOR_AUTO_ALERT_ENABLED (IVI_SPECIFIC_ATTR_BASE + 773L)  /* ViBoolean, read-write */

/*- Catalog */

#define AGXSAN_ATTR_CATALOG_CURRENT_MEASUREMENT_NAME        (IVI_SPECIFIC_ATTR_BASE + 676L)  /* ViString, read-only */
#define AGXSAN_ATTR_CATALOG_CURRENT_PERSONALITY_NAME        (IVI_SPECIFIC_ATTR_BASE + 677L)  /* ViString, read-only */

/*- MemoryOperation */

#define AGXSAN_ATTR_MEMORYOPERATION_SCREEN_IMAGE_THEME      (IVI_SPECIFIC_ATTR_BASE + 678L)  /* ViInt32, read-write */

/*- Output */

#define AGXSAN_ATTR_OUTPUT_ANALOG_TYPE                      (IVI_SPECIFIC_ATTR_BASE + 679L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_OUTPUT_ANALOG_AUTO_TYPE_ENABLED         (IVI_SPECIFIC_ATTR_BASE + 680L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_OUTPUT_AUXILIARY_IF_TYPE                (IVI_SPECIFIC_ATTR_BASE + 681L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_OUTPUT_ARBITRARY_IF                     (IVI_SPECIFIC_ATTR_BASE + 682L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_OUTPUT_TYPE                             (IVI_SPECIFIC_ATTR_BASE + 921L)  /* ViInt32, read-write */

/*- Traces */

#define AGXSAN_ATTR_TRACES_AVERAGE_TYPE                     (IVI_SPECIFIC_ATTR_BASE + 666L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_TRACES_AVERAGE_TYPE_AUTO_ENABLED        (IVI_SPECIFIC_ATTR_BASE + 667L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_TRACES_AVERAGE_ENABLED                  (IVI_SPECIFIC_ATTR_BASE + 756L)  /* ViBoolean, read-write */

/*- Status */

#define AGXSAN_ATTR_STATUS_SERIAL_POLL                      (IVI_SPECIFIC_ATTR_BASE + 759L)  /* ViInt32, read-only */

/*- Arb */

#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_RUN_TIME_SCALING               (IVI_SPECIFIC_ATTR_BASE + 880L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_TRIGGER_SOURCE                 (IVI_SPECIFIC_ATTR_BASE + 881L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_TRIGGER_TYPE                   (IVI_SPECIFIC_ATTR_BASE + 882L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_CONTINUOUS_TRIGGER_TYPE        (IVI_SPECIFIC_ATTR_BASE + 883L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_SEGMENT_ADVANCE_TRIGGER_TYPE   (IVI_SPECIFIC_ATTR_BASE + 884L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_EXTERNAL_TRIGGER_SLOPE         (IVI_SPECIFIC_ATTR_BASE + 885L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_EXTERNAL_TRIGGER_DELAY_ENABLED (IVI_SPECIFIC_ATTR_BASE + 886L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_EXTERNAL_TRIGGER_DELAY         (IVI_SPECIFIC_ATTR_BASE + 887L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_RE_TRIGGER_MODE                (IVI_SPECIFIC_ATTR_BASE + 888L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_SAMPLING_RATE                  (IVI_SPECIFIC_ATTR_BASE + 890L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_RMS_VALUE                      (IVI_SPECIFIC_ATTR_BASE + 891L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_RMS_CALCULATION_MODE           (IVI_SPECIFIC_ATTR_BASE + 892L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_SELECTED_WAVEFORM              (IVI_SPECIFIC_ATTR_BASE + 894L)  /* ViString, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_SEQUENCE_SYNC_ENABLED          (IVI_SPECIFIC_ATTR_BASE + 907L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_ALC_HOLD                       (IVI_SPECIFIC_ATTR_BASE + 908L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_RF_BLANKING                    (IVI_SPECIFIC_ATTR_BASE + 909L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_ENABLED                        (IVI_SPECIFIC_ATTR_BASE + 917L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_DIRECTORY_PATH                 (IVI_SPECIFIC_ATTR_BASE + 925L)  /* ViString, read-write */

/*- IQAdjustment */

#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_IQADJUSTMENT_ENABLED (IVI_SPECIFIC_ATTR_BASE + 918L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_IQADJUSTMENT_GAIN    (IVI_SPECIFIC_ATTR_BASE + 919L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_IQADJUSTMENT_DELAY   (IVI_SPECIFIC_ATTR_BASE + 920L)  /* ViReal64, read-write */

/*- Base */

#define AGXSAN_ATTR_SS_DIGITALMODULATION_BASE_FREQUENCY_OFFSET (IVI_SPECIFIC_ATTR_BASE + 889L)  /* ViReal64, read-write */

/*- ListSequencer */

#define AGXSAN_ATTR_SS_LISTSEQUENCER_ENABLED                (IVI_SPECIFIC_ATTR_BASE + 903L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SS_LISTSEQUENCER_REPEATITION_MODE       (IVI_SPECIFIC_ATTR_BASE + 904L)  /* ViInt32, read-write */

/*- Setup */

#define AGXSAN_ATTR_SS_LISTSEQUENCER_SETUP_NUMBER_OF_STEPS  (IVI_SPECIFIC_ATTR_BASE + 905L)  /* ViInt32, read-write */

/*- Trigger */

#define AGXSAN_ATTR_SS_LISTSEQUENCER_SETUP_TRIGGER_TYPE     (IVI_SPECIFIC_ATTR_BASE + 906L)  /* ViInt32, read-write */

/*- RFGenerator */

#define AGXSAN_ATTR_SS_RFGENERATOR_FREQUENCY                   (IVI_SPECIFIC_ATTR_BASE + 922L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_OFFSET_FREQUENCY            (IVI_SPECIFIC_ATTR_BASE + 923L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_RADIO_BAND                  (IVI_SPECIFIC_ATTR_BASE + 911L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_RADIO_CHANNEL_NUMBER        (IVI_SPECIFIC_ATTR_BASE + 910L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_REFERENCE_FREQUENCY         (IVI_SPECIFIC_ATTR_BASE + 912L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_REFERENCE_FREQUENCY_ENABLED (IVI_SPECIFIC_ATTR_BASE + 913L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_LEVEL                       (IVI_SPECIFIC_ATTR_BASE + 924L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_OFFSET_POWER                (IVI_SPECIFIC_ATTR_BASE + 916L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_REFERENCE_POWER             (IVI_SPECIFIC_ATTR_BASE + 914L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_REFERENCE_POWER_ENABLED     (IVI_SPECIFIC_ATTR_BASE + 915L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_OUTPUT_ENABLED              (IVI_SPECIFIC_ATTR_BASE + 942L)  /* ViBoolean, read-write */

/*- Modulation */

#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_ENABLED       (IVI_SPECIFIC_ATTR_BASE + 940L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_TYPE          (IVI_SPECIFIC_ATTR_BASE + 941L)  /* ViInt32, read-write */

/*- AM */

#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_AM_DEPTH      (IVI_SPECIFIC_ATTR_BASE + 926L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_AM_ENABLED    (IVI_SPECIFIC_ATTR_BASE + 927L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_AM_FREQUENCY  (IVI_SPECIFIC_ATTR_BASE + 928L)  /* ViReal64, read-write */

/*- FM */

#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_FM_DEVIATION  (IVI_SPECIFIC_ATTR_BASE + 929L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_FM_ENABLED    (IVI_SPECIFIC_ATTR_BASE + 930L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_FM_FREQUENCY  (IVI_SPECIFIC_ATTR_BASE + 931L)  /* ViReal64, read-write */

/*- PM */

#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_PM_ENABLED    (IVI_SPECIFIC_ATTR_BASE + 932L)  /* ViBoolean, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_PM_FREQUENCY  (IVI_SPECIFIC_ATTR_BASE + 933L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_PM_DEVIATION  (IVI_SPECIFIC_ATTR_BASE + 934L)  /* ViReal64, read-write */

/*- Analog */

#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_ANALOG_FORMAT          (IVI_SPECIFIC_ATTR_BASE + 935L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_ANALOG_WAVEFORM_TYPE   (IVI_SPECIFIC_ATTR_BASE + 936L)  /* ViInt32, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_ANALOG_DUTY_CYCLE      (IVI_SPECIFIC_ATTR_BASE + 937L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_ANALOG_SINE2_LEVEL     (IVI_SPECIFIC_ATTR_BASE + 938L)  /* ViReal64, read-write */
#define AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_ANALOG_SINE2_FREQUENCY (IVI_SPECIFIC_ATTR_BASE + 939L)  /* ViReal64, read-write */


/**************************************************************************** 
 *------------------------ Attribute Value Defines -------------------------* 
 ****************************************************************************/

/*- Defined values for 
	attribute AGXSAN_ATTR_AMPLITUDE_UNITS
	parameter AmplitudeUnits in function AgXSAn_ConfigureLevel */

#define AGXSAN_VAL_AMPLITUDE_UNITS_DBM                      1
#define AGXSAN_VAL_AMPLITUDE_UNITS_DBMV                     2
#define AGXSAN_VAL_AMPLITUDE_UNITS_DBUV                     3
#define AGXSAN_VAL_AMPLITUDE_UNITS_VOLT                     4
#define AGXSAN_VAL_AMPLITUDE_UNITS_WATT                     5

/*- Defined values for 
	parameter DetectorType in function AgXSAn_ConfigureAcquisition */

#define AGXSAN_VAL_DETECTOR_TYPE_AUTO_PEAK                  1
#define AGXSAN_VAL_DETECTOR_TYPE_AVERAGE                    2
#define AGXSAN_VAL_DETECTOR_TYPE_MAX_PEAK                   3
#define AGXSAN_VAL_DETECTOR_TYPE_MIN_PEAK                   4
#define AGXSAN_VAL_DETECTOR_TYPE_SAMPLE                     5
#define AGXSAN_VAL_DETECTOR_TYPE_RMS                        6

/*- Defined values for 
	parameter VerticalScale in function AgXSAn_ConfigureAcquisition */

#define AGXSAN_VAL_VERTICAL_SCALE_LINEAR                    1
#define AGXSAN_VAL_VERTICAL_SCALE_LOGARITHMIC               2

/*- Defined values for 
	attribute AGXSAN_ATTR_TRIGGER_SOURCE
	parameter TriggerSource in function AgXSAn_ConfigureTriggerSource */

#define AGXSAN_VAL_TRIGGER_SOURCE_EXTERNAL                  1
#define AGXSAN_VAL_TRIGGER_SOURCE_IMMEDIATE                 2
#define AGXSAN_VAL_TRIGGER_SOURCE_SOFTWARE                  3
#define AGXSAN_VAL_TRIGGER_SOURCE_AC_LINE                   4
#define AGXSAN_VAL_TRIGGER_SOURCE_VIDEO                     5

/*- Defined values for 
	attribute AGXSAN_ATTR_EXTERNAL_TRIGGER_SLOPE
	parameter ExternalTriggerSlope in function AgXSAn_ConfigureExternalTrigger */

#define AGXSAN_VAL_EXTERNAL_TRIGGER_SLOPE_POSITIVE          1
#define AGXSAN_VAL_EXTERNAL_TRIGGER_SLOPE_NEGATIVE          2

/*- Defined values for 
	attribute AGXSAN_ATTR_VIDEO_TRIGGER_SLOPE
	parameter VideoTriggerSlope in function AgXSAn_ConfigureVideoTrigger */

#define AGXSAN_VAL_VIDEO_TRIGGER_SLOPE_POSITIVE             1
#define AGXSAN_VAL_VIDEO_TRIGGER_SLOPE_NEGATIVE             2

/*- Defined values for 
	parameter Status in function AgXSAn_AcquisitionStatus */

#define AGXSAN_VAL_ACQUISITION_STATUS_IN_PROGRESS           0
#define AGXSAN_VAL_ACQUISITION_STATUS_COMPLETE              1
#define AGXSAN_VAL_ACQUISITION_STATUS_UNKNOWN               -1

/*- Defined values for 
	attribute AGXSAN_ATTR_TRACE_TYPE
	parameter TraceType in function AgXSAn_ConfigureTraceType */

#define AGXSAN_VAL_TRACE_TYPE_CLEAR_WRITE                   1
#define AGXSAN_VAL_TRACE_TYPE_MAX_HOLD                      2
#define AGXSAN_VAL_TRACE_TYPE_MIN_HOLD                      3
#define AGXSAN_VAL_TRACE_TYPE_VIDEO_AVERAGE                 4
#define AGXSAN_VAL_TRACE_TYPE_VIEW                          5
#define AGXSAN_VAL_TRACE_TYPE_STORE                         6

/*- Defined values for 
	attribute AGXSAN_ATTR_MARKER_TYPE
	parameter MarkerType in function AgXSAn_QueryMarkerType */

#define AGXSAN_VAL_MARKER_TYPE_NORMAL                       1
#define AGXSAN_VAL_MARKER_TYPE_DELTA                        2

/*- Defined values for 
	parameter SearchType in function AgXSAn_MarkerSearch */

#define AGXSAN_VAL_MARKER_SEARCH_HIGHEST                    1
#define AGXSAN_VAL_MARKER_SEARCH_MINIMUM                    2
#define AGXSAN_VAL_MARKER_SEARCH_NEXT_PEAK                  3
#define AGXSAN_VAL_MARKER_SEARCH_NEXT_PEAK_LEFT             4
#define AGXSAN_VAL_MARKER_SEARCH_NEXT_PEAK_RIGHT            5

/*- Defined values for 
	parameter InstrumentSetting in function AgXSAn_SetInstrumentFromMarker */

#define AGXSAN_VAL_INSTRUMENT_SETTING_FREQUENCY_CENTER      1
#define AGXSAN_VAL_INSTRUMENT_SETTING_FREQUENCY_SPAN        2
#define AGXSAN_VAL_INSTRUMENT_SETTING_FREQUENCY_START       3
#define AGXSAN_VAL_INSTRUMENT_SETTING_FREQUENCY_STOP        4
#define AGXSAN_VAL_INSTRUMENT_SETTING_REFERENCE_LEVEL       5

/*- Defined values for */

#define AGXSAN_VAL_MAX_TIME_IMMEDIATE                       0
#define AGXSAN_VAL_MAX_TIME_INFINITE                        -1

/*- Defined values for 
	attribute AGXSAN_ATTR_IVILXISYNC_TRIGGER_SOURCE_DETECTION
	attribute AGXSAN_ATTR_IVILXISYNC_ARM_SOURCE_DETECTION
	parameter Detection in function AgXSAn_IviLxiSync_ConfigureTriggerSource
	parameter Detection in function AgXSAn_IviLxiSync_ConfigureArmSource */

#define AGXSAN_VAL_IVILXISYNC_DETECTION_RISE                0
#define AGXSAN_VAL_IVILXISYNC_DETECTION_FALL                1
#define AGXSAN_VAL_IVILXISYNC_DETECTION_HIGH                2
#define AGXSAN_VAL_IVILXISYNC_DETECTION_LOW                 3

/*- Defined values for 
	attribute AGXSAN_ATTR_IVILXISYNC_EVENT_DRIVE_MODE
	parameter DriveMode in function AgXSAn_IviLxiSync_ConfigureEvent */

#define AGXSAN_VAL_IVILXISYNC_EVENT_DRIVEN                  0
#define AGXSAN_VAL_IVILXISYNC_EVENT_OFF                     1
#define AGXSAN_VAL_IVILXISYNC_EVENT_WIREDOR                 2

/*- Defined values for 
	attribute AGXSAN_ATTR_IVILXISYNC_EVENT_SLOPE
	parameter Slope in function AgXSAn_IviLxiSync_ConfigureEvent */

#define AGXSAN_VAL_IVILXISYNC_SLOPE_RISE                    0
#define AGXSAN_VAL_IVILXISYNC_SLOPE_FALL                    1

/*- Defined values for */

#define AGXSAN_VAL_IVILXISYNC_SLOPE_RISE                    0
#define AGXSAN_VAL_IVILXISYNC_SLOPE_FALL                    1

/*- Defined values for */

#define AGXSAN_VAL_AMPLITUDE_UNITS_DBM                      1
#define AGXSAN_VAL_AMPLITUDE_UNITS_DBMV                     2
#define AGXSAN_VAL_AMPLITUDE_UNITS_DBUV                     3
#define AGXSAN_VAL_AMPLITUDE_UNITS_VOLT                     4
#define AGXSAN_VAL_AMPLITUDE_UNITS_WATT                     5

/*- Defined values for 
	attribute AGXSAN_ATTR_TRACE_DETECTOR_TYPE
	attribute AGXSAN_ATTR_SA_ACP_DETECTOR_TYPE
	attribute AGXSAN_ATTR_SA_CHANNELPOWER_DETECTOR_TYPE
	attribute AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DETECTOR_TYPE
	attribute AGXSAN_ATTR_SA_SEMASK_REFERENCECHANNEL_DETECTOR_TYPE
	attribute AGXSAN_ATTR_SA_SEMASK_OFFSET_DETECTOR_TYPE
	parameter RetVal in function AgXSAn_AcquisitionGetDetectorTrace
	parameter DetectorType in function AgXSAn_AcquisitionSetDetectorTrace
	parameter Detector in function AgXSAn_SASpuriousEmissionsRangeTableConfigureDetector1
	parameter RetVal in function AgXSAn_SASpuriousEmissionsRangeTableQueryDetector1
	parameter Detector in function AgXSAn_SASpuriousEmissionsRangeTableConfigureDetector2
	parameter RetVal in function AgXSAn_SASpuriousEmissionsRangeTableQueryDetector2
	parameter DetectorType in function AgXSAn_SAMarkerMeasureAtMarkerConfigureDetectorType
	parameter Val in function AgXSAn_SAMarkerMeasureAtMarkerQueryDetectorType */

#define AGXSAN_VAL_SA_DETECTOR_TYPE_AVERAGE                 0
#define AGXSAN_VAL_SA_DETECTOR_TYPE_MAX_PEAK                1
#define AGXSAN_VAL_SA_DETECTOR_TYPE_MIN_PEAK                2
#define AGXSAN_VAL_SA_DETECTOR_TYPE_SAMPLE                  3
#define AGXSAN_VAL_SA_DETECTOR_TYPE_RMS                     4
#define AGXSAN_VAL_SA_DETECTOR_TYPE_NORMAL                  5
#define AGXSAN_VAL_SA_DETECTOR_TYPE_QUASI_PEAK              6
#define AGXSAN_VAL_SA_DETECTOR_TYPE_EMI_AVERAGE             7
#define AGXSAN_VAL_SA_DETECTOR_TYPE_RMS_AVERAGE             8
#define AGXSAN_VAL_DETECTOR_TYPE_OFF                        9

/*- Defined values for */

#define AGXSAN_VAL_VERTICAL_SCALE_LINEAR                    1
#define AGXSAN_VAL_VERTICAL_SCALE_LOGARITHMIC               2

/*- Defined values for 
	attribute AGXSAN_ATTR_TRIGGER_EXTERNAL_SLOPE
	attribute AGXSAN_ATTR_TRIGGER_EXTERNAL2_SLOPE
	parameter ExternalTriggerSlope in function AgXSAn_TriggerExternalConfigure
	parameter External2TriggerSlope in function AgXSAn_TriggerExternal2Configure */

#define AGXSAN_VAL_EXTERNAL_TRIGGER_SLOPE_POSITIVE          1
#define AGXSAN_VAL_EXTERNAL_TRIGGER_SLOPE_NEGATIVE          2

/*- Defined values for 
	attribute AGXSAN_ATTR_TRIGGER_VIDEO_SLOPE
	parameter VideoTriggerSlope in function AgXSAn_TriggerVideoConfigure */

#define AGXSAN_VAL_VIDEO_TRIGGER_SLOPE_POSITIVE             1
#define AGXSAN_VAL_VIDEO_TRIGGER_SLOPE_NEGATIVE             2

/*- Defined values for */

#define AGXSAN_VAL_ACQUISITION_STATUS_IN_PROGRESS           0
#define AGXSAN_VAL_ACQUISITION_STATUS_COMPLETE              1
#define AGXSAN_VAL_ACQUISITION_STATUS_UNKNOWN               -1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_ACP_TRACE_TYPE
	attribute AGXSAN_ATTR_SA_CHANNELPOWER_TRACES_TYPE
	attribute AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_TRACES_TYPE
	attribute AGXSAN_ATTR_SA_SEMASK_TRACES_TYPE
	attribute AGXSAN_ATTR_SA_HARMONICDISTORTION_TRACE_TYPE
	attribute AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_TRACES_TYPE */

#define AGXSAN_VAL_TRACE_TYPE_CLEAR_WRITE                   1
#define AGXSAN_VAL_TRACE_TYPE_MAX_HOLD                      2
#define AGXSAN_VAL_TRACE_TYPE_MIN_HOLD                      3
#define AGXSAN_VAL_TRACE_TYPE_VIDEO_AVERAGE                 4
#define AGXSAN_VAL_TRACE_TYPE_VIEW                          5
#define AGXSAN_VAL_TRACE_TYPE_STORE                         6

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_ACP_MARKER_TYPE
	attribute AGXSAN_ATTR_SA_BURSTPOWER_MARKER_TYPE
	attribute AGXSAN_ATTR_SA_CHANNELPOWER_MARKER_TYPE
	attribute AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_MARKER_TYPE
	attribute AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_TYPE
	attribute AGXSAN_ATTR_SA_SEMASK_MARKER_TYPE
	attribute AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MARKER_TYPE
	attribute AGXSAN_ATTR_SA_MARKER_TYPE */

#define AGXSAN_VAL_MARKER_TYPE_NORMAL                       1
#define AGXSAN_VAL_MARKER_TYPE_DELTA                        2
#define AGXSAN_VAL_MARKER_TYPE_OFF                          0
#define AGXSAN_VAL_MARKER_TYPE_FIXED                        3

/*- Defined values for 
	parameter SearchType in function AgXSAn_SAACPMarkerSearch
	parameter SearchType in function AgXSAn_SABurstPowerMarkerSearch
	parameter SearchType in function AgXSAn_SAChannelPowerMarkerSearch
	parameter SearchType in function AgXSAn_SAOccupiedBandwidthMarkerSearch
	parameter SearchType in function AgXSAn_SASpuriousEmissionsMarkerSearch
	parameter SearchType in function AgXSAn_SAMarkerSearch */

#define AGXSAN_VAL_MARKER_SEARCH_HIGHEST                    1
#define AGXSAN_VAL_MARKER_SEARCH_MINIMUM                    2
#define AGXSAN_VAL_MARKER_SEARCH_NEXT_PEAK                  3
#define AGXSAN_VAL_MARKER_SEARCH_NEXT_PEAK_LEFT             4
#define AGXSAN_VAL_MARKER_SEARCH_NEXT_PEAK_RIGHT            5
#define AGXSAN_VAL_MARKER_SEARCH_PEAK_TO_PEAK               0

/*- Defined values for 
	parameter InstrumentSetting in function AgXSAn_SAMarkerSetInstrumentFromMarker */

#define AGXSAN_VAL_INSTRUMENT_SETTING_FREQUENCY_CENTER       1
#define AGXSAN_VAL_INSTRUMENT_SETTING_FREQUENCY_SPAN         2
#define AGXSAN_VAL_INSTRUMENT_SETTING_FREQUENCY_START        3
#define AGXSAN_VAL_INSTRUMENT_SETTING_FREQUENCY_STOP         4
#define AGXSAN_VAL_INSTRUMENT_SETTING_REFERENCE_LEVEL        5
#define AGXSAN_VAL_INSTRUMENT_SETTING_FREQUENCY_CENTER_STEP  0
#define AGXSAN_VAL_INSTRUMENT_SETTING_DELTA_FREQUENCY_CENTER 6
#define AGXSAN_VAL_INSTRUMENT_SETTING_DELTA_FREQUENCY_SPAN   7

/*- Defined values for */

#define AGXSAN_VAL_ARM_SOURCE_DETECTION_RISE                0
#define AGXSAN_VAL_ARM_SOURCE_DETECTION_FALL                1
#define AGXSAN_VAL_ARM_SOURCE_DETECTION_HIGH                2
#define AGXSAN_VAL_ARM_SOURCE_DETECTION_LOW                 3

/*- Defined values for */

#define AGXSAN_VAL_EVENT_DRIVE_MODE_DRIVEN                  0
#define AGXSAN_VAL_EVENT_DRIVE_MODE_OFF                     1
#define AGXSAN_VAL_EVENT_DRIVE_MODE_WIRED_OR                2

/*- Defined values for */

#define AGXSAN_VAL_SOURCE_SLOPE_RISE                        0
#define AGXSAN_VAL_SOURCE_SLOPE_FALL                        1

/*- Defined values for */

#define AGXSAN_VAL_TRIGGER_SOURCE_DETECTION_RISE            0
#define AGXSAN_VAL_TRIGGER_SOURCE_DETECTION_FALL            1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_ACP_MEASUREMENT_METHOD */

#define AGXSAN_VAL_SA_ACP_MEASUREMENT_METHOD_IBW            0
#define AGXSAN_VAL_SA_ACP_MEASUREMENT_METHOD_RBW            1
#define AGXSAN_VAL_SA_ACP_MEASUREMENT_METHOD_IBW_RANGE      2
#define AGXSAN_VAL_SA_ACP_MEASUREMENT_METHOD_FAST           3

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_ACP_MEASUREMENT_TYPE */

#define AGXSAN_VAL_SA_ACP_MEASUREMENT_TYPE_POWER_SPECTRAL_DENSITY_REFERENCE 0
#define AGXSAN_VAL_SA_ACP_MEASUREMENT_TYPE_TOTAL_POWER_REFERENCE            1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_ACP_TRIGGER_SOURCE
	attribute AGXSAN_ATTR_SA_BURSTPOWER_TRIGGER_SOURCE
	attribute AGXSAN_ATTR_SA_CHANNELPOWER_TRIGGER_SOURCE
	attribute AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_TRIGGER_SOURCE
	attribute AGXSAN_ATTR_SA_POWERSTATISTICS_TRIGGER_SOURCE
	attribute AGXSAN_ATTR_SA_SEMASK_TRIGGER_SOURCE
	attribute AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_TRIGGER_SOURCE
	attribute AGXSAN_ATTR_SA_HARMONICDISTORTION_TRIGGER_SOURCE
	attribute AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_TRIGGER_SOURCE
	attribute AGXSAN_ATTR_SA_LISTSWEEP_TRIGGER_SOURCE
	parameter TriggerSource in function AgXSAn_SAListSweepConfigureParameters */

#define AGXSAN_VAL_SA_TRIGGER_SOURCE_IMMEDIATE              0
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_VIDEO                  1
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_ACLINE                 2
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_EXTERNAL1              3
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_EXTERNAL2              4
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_RF_BURST               5
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_FRAME                  8
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_LXI_LAN_EVENT          10
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_LXI_ALARM_TRIGGER      11
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_IF                     6
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_IQ_MAGNITUDE           7
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_DEMODULATED_I_VOLTAGE  9
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_DEMODULATED_Q_VOLTAGE  12
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_IADC_VOLATGE           13
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_QADC_VOLTAGE           14
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_AUXILIARY_IQ_MAGNITUDE 15
#define AGXSAN_VAL_SA_TRIGGER_SOURCE_SOFTWARE               16

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_ACP_AVERAGE_MODE
	attribute AGXSAN_ATTR_SA_BURSTPOWER_AVERAGE_MODE
	attribute AGXSAN_ATTR_SA_CHANNELPOWER_AVERAGE_MODE
	attribute AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_AVERAGE_MODE
	attribute AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_AVERAGE_MODE
	attribute AGXSAN_ATTR_SA_HARMONICDISTORTION_AVERAGE_MODE
	attribute AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_AVERAGE_MODE */

#define AGXSAN_VAL_SA_AVERAGING_MODE_EXPONENTIAL            0
#define AGXSAN_VAL_SA_AVERAGING_MODE_REPEAT                 1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_BANDWIDTH_SHAPE
	attribute AGXSAN_ATTR_SA_BURSTPOWER_SWEEPCOUPLING_BANDWIDTH_SHAPE
	attribute AGXSAN_ATTR_SA_CHANNELPOWER_SWEEPCOUPLING_BANDWIDTH_SHAPE
	attribute AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_SWEEPCOUPLING_BANDWIDTH_SHAPE
	attribute AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_BANDWIDTH_SHAPE
	attribute AGXSAN_ATTR_SA_SWEEPCOUPLING_BANDWIDTH_SHAPE
	parameter Shape in function AgXSAn_SAACPOffsetListBandwidthConfigureShape
	parameter RetVal in function AgXSAn_SAACPOffsetListBandwidthQueryShape
	parameter Shape in function AgXSAn_SASpuriousEmissionsRangeTableBandwidthConfigureShape
	parameter RetVal in function AgXSAn_SASpuriousEmissionsRangeTableBandwidthQueryShape
	parameter Shape in function AgXSAn_SAListSweepBandwidthConfigureResolutionShape
	parameter RetVal in function AgXSAn_SAListSweepBandwidthQueryResolutionShape */

#define AGXSAN_VAL_BANDWIDTH_SHAPE_GAUSSIAN                 0
#define AGXSAN_VAL_BANDWIDTH_SHAPE_FLATTOP                  1
#define AGXSAN_VAL_BANDWIDTH_SHAPE_AUTO_SENSE               2

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_BANDWIDTH_TYPE
	attribute AGXSAN_ATTR_SA_SWEEPCOUPLING_BANDWIDTH_TYPE
	parameter Type in function AgXSAn_SAACPOffsetListBandwidthConfigureType
	parameter RetVal in function AgXSAn_SAACPOffsetListBandwidthQueryType */

#define AGXSAN_VAL_BANDWIDTH_TYPE_DB3                       0
#define AGXSAN_VAL_BANDWIDTH_TYPE_DB6                       1
#define AGXSAN_VAL_BANDWIDTH_TYPE_IMPULSE                   2
#define AGXSAN_VAL_BANDWIDTH_TYPE_NOISE                     3

/*- Defined values for 
	parameter Method in function AgXSAn_SAACPCarrierListConfigureMethod
	parameter RetVal in function AgXSAn_SAACPCarrierListQueryMethod */

#define AGXSAN_VAL_SA_ACP_CARRIER_LIST_METHOD_INTEGRATION   0
#define AGXSAN_VAL_SA_ACP_CARRIER_LIST_METHOD_RRC_FILTERED  1

/*- Defined values for 
	parameter Enabled in function AgXSAn_SAACPCarrierListConfigurePowerPresent
	parameter RetVal in function AgXSAn_SAACPCarrierListQueryPowerPresent */

#define AGXSAN_VAL_SA_ACP_CARRIER_LIST_POWER_PRESENT_YES    0
#define AGXSAN_VAL_SA_ACP_CARRIER_LIST_POWER_PRESENT_NO     1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_ACP_DISPLAY_WINDOWY_REF_POSITION
	attribute AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_WINDOWY_REF_POSITION
	attribute AGXSAN_ATTR_SA_CHANNELPOWER_DISPLAY_WINDOWY_REF_POSITION
	attribute AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DISPLAY_WINDOWY_REF_POSITION
	attribute AGXSAN_ATTR_SA_SEMASK_DISPLAY_WINDOWY_REF_POSITION
	attribute AGXSAN_ATTR_SA_HARMONICDISTORTION_DISPLAYWINDOWY_REF_POSITION
	attribute AGXSAN_ATTR_SA_THIRDORDERINTERCEPT_DISPLAYWINDOWY_REF_POSITION */

#define AGXSAN_VAL_DISPLAY_REF_POSTION_TOP                  0
#define AGXSAN_VAL_DISPLAY_REF_POSTION_CENTER               1
#define AGXSAN_VAL_DISPLAY_REF_POSTION_BOTTOM               2

/*- Defined values for 
	parameter Sideband in function AgXSAn_SAACPOffsetListConfigureSidebandSelection
	parameter RetVal in function AgXSAn_SAACPOffsetListQuerySidebandSelection
	parameter Sideband in function AgXSAn_SASEMaskOffsetListConfigureSidebandSelection
	parameter RetVal in function AgXSAn_SASEMaskOffsetListQuerySidebandSelection */

#define AGXSAN_VAL_SA_OFFSET_SIDEBAND_SELECTION_BOTH        0
#define AGXSAN_VAL_SA_OFFSET_SIDEBAND_SELECTION_NEGATIVE    1
#define AGXSAN_VAL_SA_OFFSET_SIDEBAND_SELECTION_POSITIVE    2

/*- Defined values for 
	parameter Type in function AgXSAn_SAACPOffsetListConfigureTest
	parameter RetVal in function AgXSAn_SAACPOffsetListQueryTest
	parameter Type in function AgXSAn_SASEMaskOffsetListConfigureTest
	parameter RetVal in function AgXSAn_SASEMaskOffsetListQueryTest */

#define AGXSAN_VAL_SA_OFFSET_TEST_TYPE_ABSOLUTE             0
#define AGXSAN_VAL_SA_OFFSET_TEST_TYPE_AND                  1
#define AGXSAN_VAL_SA_OFFSET_TEST_TYPE_OR                   2
#define AGXSAN_VAL_SA_OFFSET_TEST_TYPE_RELATIVE             3

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_ACP_SWEEPCOUPLING_SWEEP_TIME_AUTO_RULES
	attribute AGXSAN_ATTR_SA_CHANNELPOWER_SWEEPCOUPLING_SWEEP_TIME_AUTO_RULES
	attribute AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_SWEEPCOUPLING_SWEEP_TIME_AUTO_RULES
	attribute AGXSAN_ATTR_SA_SWEEPCOUPLING_SWEEP_TIME_AUTO_RULES
	parameter AutoRules in function AgXSAn_SASpuriousEmissionsRangeTableConfigureSweepTimeAutoRules
	parameter RetVal in function AgXSAn_SASpuriousEmissionsRangeTableQuerySweepTimeAutoRules */

#define AGXSAN_VAL_SWEEP_TIME_AUTO_RULES_NORMAL             0
#define AGXSAN_VAL_SWEEP_TIME_AUTO_RULES_ACCURACY           1

/*- Defined values for 
	attribute AGXSAN_ATTR_CALIBRATION_AUTO_ENABLED */

#define AGXSAN_VAL_CALIBRATION_AUTO_ON                      0
#define AGXSAN_VAL_CALIBRATION_AUTO_OFF                     1
#define AGXSAN_VAL_CALIBRATION_AUTO_ALERT                   2

/*- Defined values for 
	attribute AGXSAN_ATTR_DISPLAY_THEME
	attribute AGXSAN_ATTR_MEMORYOPERATION_SCREEN_IMAGE_THEME */

#define AGXSAN_VAL_THEME_TD_COLOR                           0
#define AGXSAN_VAL_THEME_TD_MONOCHROME                      1
#define AGXSAN_VAL_THEME_F_COLOR                            2
#define AGXSAN_VAL_THEME_F_MONOCHROME                       3
#define AGXSAN_VAL_THEME_FILLED                             4
#define AGXSAN_VAL_THEME_OUTLINE                            5

/*- Defined values for 
	attribute AGXSAN_ATTR_REFOSCILLATOR_SOURCE */

#define AGXSAN_VAL_REF_OSCILLATOR_SOURCE_INTERNAL           0
#define AGXSAN_VAL_REF_OSCILLATOR_SOURCE_EXTERNAL           1
#define AGXSAN_VAL_REF_OSCILLATOR_SOURCE_SENSE              2
#define AGXSAN_VAL_REF_OSCILLATOR_SOURCE_PULSE              3

/*- Defined values for 
	attribute AGXSAN_ATTR_STATETRIGGER_DETECTION
	parameter Detection in function AgXSAn_StateTriggerConfigure */

#define AGXSAN_VAL_STATE_TRIGGER_DETECTION_HIGH             0
#define AGXSAN_VAL_STATE_TRIGGER_DETECTION_LOW              1
#define AGXSAN_VAL_STATE_TRIGGER_DETECTION_RISE             2
#define AGXSAN_VAL_STATE_TRIGGER_DETECTION_FALL             3

/*- Defined values for 
	parameter Reason in function AgXSAn_StatusConfigureServiceRequest */

#define AGXSAN_VAL_SRQ_REASON_STB_MAV                       1
#define AGXSAN_VAL_SRQ_REASON_STB_ERROR_QUEUE               2
#define AGXSAN_VAL_SRQ_REASON_ESR_OPC                       4
#define AGXSAN_VAL_SRQ_REASON_ESR_QUERY_ERROR               8
#define AGXSAN_VAL_SRQ_REASON_ESR_DEVICE_ERROR              16
#define AGXSAN_VAL_SRQ_REASON_ESR_EXECUTION_ERROR           32
#define AGXSAN_VAL_SRQ_REASON_ESR_COMMAND_ERROR             64
#define AGXSAN_VAL_SRQ_REASON_ESR_USER_REQUEST              128
#define AGXSAN_VAL_SRQ_REASON_QUES_VOLTAGE                  256
#define AGXSAN_VAL_SRQ_REASON_QUES_CURRENT                  512
#define AGXSAN_VAL_SRQ_REASON_QUES_TIME                     1024
#define AGXSAN_VAL_SRQ_REASON_QUES_POWER                    2048
#define AGXSAN_VAL_SRQ_REASON_QUES_TEMPERATURE              4096
#define AGXSAN_VAL_SRQ_REASON_QUES_FREQUENCY                8192
#define AGXSAN_VAL_SRQ_REASON_QUES_PHASE                    16384
#define AGXSAN_VAL_SRQ_REASON_QUES_MODULATION               32768
#define AGXSAN_VAL_SRQ_REASON_QUES_CALIBRATION              65536
#define AGXSAN_VAL_SRQ_REASON_QUES_INSTRUMENT               131072

/*- Defined values for 
	parameter Register in function AgXSAn_Status_GetRegister
	parameter Register in function AgXSAn_Status_SetRegister
	parameter Register in function AgXSAn_StatusGetRegister
	parameter Register in function AgXSAn_StatusSetRegister */

#define AGXSAN_VAL_STATUS_REGISTER_STATUS_BYTE                                                   0
#define AGXSAN_VAL_STATUS_REGISTER_STANDARD_EVENT                                                1
#define AGXSAN_VAL_STATUS_REGISTER_OPERATION                                                     2
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE                                                  3
#define AGXSAN_VAL_STATUS_REGISTER_OPERATION_CONDITION                                           4
#define AGXSAN_VAL_STATUS_REGISTER_OPERATION_ENABLE                                              5
#define AGXSAN_VAL_STATUS_REGISTER_OPERATION_EVENT                                               6
#define AGXSAN_VAL_STATUS_REGISTER_OPERATION_INSTRUMENT_CONDITION                                16
#define AGXSAN_VAL_STATUS_REGISTER_OPERATION_INSTRUMENT_ENABLE                                   17
#define AGXSAN_VAL_STATUS_REGISTER_OPERATION_INSTRUMENT_EVENT                                    18
#define AGXSAN_VAL_STATUS_REGISTER_OPERATION_INSTRUMENT_NEGATIVE_TRANSITION                      19
#define AGXSAN_VAL_STATUS_REGISTER_OPERATION_INSTRUMENT_POSITIVE_TRANSITION                      20
#define AGXSAN_VAL_STATUS_REGISTER_OPERATION_NEGATIVE_TRANSITION                                 7
#define AGXSAN_VAL_STATUS_REGISTER_OPERATION_POSITIVE_TRANSITION                                 8
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_CONDITION                            21
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_ENABLE                               22
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_EVENT                                23
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_EXTENDED_FAILURE_CONDITION           24
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_EXTENDED_FAILURE_ENABLE              25
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_EXTENDED_FAILURE_EVENT               26
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_EXTENDED_FAILURE_NEGATIVE_TRANSITION 27
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_EXTENDED_FAILURE_POSITIVE_TRANSITION 28
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_EXTENDED_NEEDED_CONDITION            29
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_EXTENDED_NEEDED_ENABLE               30
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_EXTENDED_NEEDED_EVENT                31
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_EXTENDED_NEEDED_NEGATIVE_TRANSITION  32
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_EXTENDED_NEEDED_POSITIVE_TRANSITION  33
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_NEGATIVE_TRANSITION                  34
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_POSITIVE_TRANSITION                  35
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_SKIPPED_CONDITION                    36
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_SKIPPED_ENABLE                       37
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_SKIPPED_EVENT                        38
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_SKIPPED_NEGATIVE_TRANSITION          39
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CALIBRATION_SKIPPED_POSITIVE_TRANSITION          40
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_CONDITION                                        9
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_ENABLE                                           10
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_EVENT                                            11
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_FREQUENCY_CONDITION                              41
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_FREQUENCY_ENABLE                                 42
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_FREQUENCY_EVENT                                  43
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_FREQUENCY_NEGATIVE_TRANSITION                    44
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_FREQUENCY_POSITIVE_TRANSITION                    45
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_CONDITION                              46
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_ENABLE                                 47
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_EVENT                                  48
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_NEGATIVE_TRANSITION                    49
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_POSITIVE_TRANSITION                    50
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_SIGNAL_CONDITION                       51
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_SIGNAL_ENABLE                          52
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_SIGNAL_EVENT                           53
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_SIGNAL_NEGATIVE_TRANSITION             54
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_SIGNAL_POSITIVE_TRANSITION             55
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_UN_CALIBRATED_CONDITION                56
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_UN_CALIBRATED_ENABLE                   57
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_UN_CALIBRATED_EVENT                    58
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_UN_CALIBRATED_NEGATIVE_TRANSITION      59
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_INTEGRITY_UN_CALIBRATED_POSITIVE_TRANSITION      60
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_NEGATIVE_TRANSITION                              12
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_POSITIVE_TRANSITION                              13
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_POWER_CONDITION                                  61
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_POWER_ENABLE                                     62
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_POWER_EVENT                                      63
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_POWER_NEGATIVE_TRANSITION                        64
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_POWER_POSITIVE_TRANSITION                        65
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_TEMPERATURE_CONDITION                            66
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_TEMPERATURE_ENABLE                               67
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_TEMPERATURE_EVENT                                68
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_TEMPERATURE_NEGATIVE_TRANSITION                  69
#define AGXSAN_VAL_STATUS_REGISTER_QUESTIONABLE_TEMPERATURE_POSITIVE_TRANSITION                  70
#define AGXSAN_VAL_STATUS_REGISTER_SERVICE_REQUEST_ENABLE                                        14
#define AGXSAN_VAL_STATUS_REGISTER_STANDARD_EVENT_ENABLE                                         15

/*- Defined values for 
	parameter SubRegister in function AgXSAn_Status_GetRegister
	parameter SubRegister in function AgXSAn_Status_SetRegister */

#define AGXSAN_VAL_STATUS_SUB_REGISTER_CONDITION            0
#define AGXSAN_VAL_STATUS_SUB_REGISTER_NEGATIVE_TRANSITION  1
#define AGXSAN_VAL_STATUS_SUB_REGISTER_POSITIVE_TRANSITION  2
#define AGXSAN_VAL_STATUS_SUB_REGISTER_EVENT                3
#define AGXSAN_VAL_STATUS_SUB_REGISTER_ENABLE               4

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_BURSTPOWER_MEASUREMENT_METHOD */

#define AGXSAN_VAL_SA_BURST_POWER_MEASUREMENT_METHOD_THRESHOLD   0
#define AGXSAN_VAL_SA_BURST_POWER_MEASUREMENT_METHOD_BURST_WIDTH 1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_BURSTPOWER_THRESHOLD_TYPE */

#define AGXSAN_VAL_SA_BURST_POWER_THRESHOLD_TYPE_ABSOLUTE   0
#define AGXSAN_VAL_SA_BURST_POWER_THRESHOLD_TYPE_RELATIVE   1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_BURSTPOWER_AVERAGE_TYPE */

#define AGXSAN_VAL_SA_BURST_POWER_AVERAGE_TYPE_POWER        0
#define AGXSAN_VAL_SA_BURST_POWER_AVERAGE_TYPE_LOG_POWER    1
#define AGXSAN_VAL_SA_BURST_POWER_AVERAGE_TYPE_MAXIMUM      2
#define AGXSAN_VAL_SA_BURST_POWER_AVERAGE_TYPE_MINIMUM      3

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_BURSTPOWER_DISPLAY_WINDOWX_REF_POSITION */

#define AGXSAN_VAL_SA_BURST_POWER_DISPLAY_X_REF_POSTION_LEFT   0
#define AGXSAN_VAL_SA_BURST_POWER_DISPLAY_X_REF_POSTION_CENTER 1
#define AGXSAN_VAL_SA_BURST_POWER_DISPLAY_X_REF_POSTION_RIGHT  2

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_POWERSTATISTICS_MARKER_TRACE
	parameter Trace in function AgXSAn_SAPowerStatisticsMarkerConfigureEnabled */

#define AGXSAN_VAL_SA_POWER_STATISTICS_MARKER_TRACE_MEASURED  0
#define AGXSAN_VAL_SA_POWER_STATISTICS_MARKER_TRACE_GAUSSIAN  1
#define AGXSAN_VAL_SA_POWER_STATISTICS_MARKER_TRACE_REFERENCE 2

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_BURSTPOWER_MARKER_TRACE
	parameter Trace in function AgXSAn_SABurstPowerMarkerConfigureEnabled */

#define AGXSAN_VAL_SA_BURST_POWER_MARKER_TRACE_MAX_HOLD     0
#define AGXSAN_VAL_SA_BURST_POWER_MARKER_TRACE_MIN_HOLD     1
#define AGXSAN_VAL_SA_BURST_POWER_MARKER_TRACERF_ENVELOPE   2

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_SEMASK_MEASUREMENT_TYPE */

#define AGXSAN_VAL_SASE_MASK_MEASUREMENT_TYPE_POWER_SPECTRAL_DENSITY_REFERENCE 0
#define AGXSAN_VAL_SASE_MASK_MEASUREMENT_TYPE_TOTAL_POWER_REFERENCE            1
#define AGXSAN_VAL_SASE_MASK_MEASUREMENT_TYPE_SPECTRUM_PEAK_POWER_REFERENCE    2

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_SEMASK_DISPLAY_VIEW_SELECTION */

#define AGXSAN_VAL_SASE_MASK_DISPLAY_VIEW_ABSOLUTE_POWER_FREQUENCY   0
#define AGXSAN_VAL_SASE_MASK_DISPLAY_VIEW_RELATIVE_POWER_FREQUENCY   1
#define AGXSAN_VAL_SASE_MASK_DISPLAY_VIEW_INTEGRATED_POWER_FREQUENCY 2

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_ACP_OFFSET_TYPE
	attribute AGXSAN_ATTR_SA_SEMASK_OFFSET_TYPE */

#define AGXSAN_VAL_SA_OFFSET_TYPE_CTO_CENTER                0
#define AGXSAN_VAL_SA_OFFSET_TYPE_CTO_EDGE                  1
#define AGXSAN_VAL_SA_OFFSET_TYPE_ETO_CENTER                2
#define AGXSAN_VAL_SA_OFFSET_TYPE_ETO_EDGE                  3

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_MEASUREMENT_TYPE */

#define AGXSAN_VAL_SA_SPURIOUS_EMISSIONS_MEASUREMENT_TYPE_EXAMINE 0
#define AGXSAN_VAL_SA_SPURIOUS_EMISSIONS_MEASUREMENT_TYPE_FULL    1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_SPURIOUSEMISSIONS_REPORT_MODE */

#define AGXSAN_VAL_SA_SPURIOUS_EMISSION_REPORT_MODE_ALL        0
#define AGXSAN_VAL_SA_SPURIOUS_EMISSION_REPORT_MODE_LIMIT_TEST 1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_SWEEPCOUPLING_SWEEP_TYPE_AUTO_RULES */

#define AGXSAN_VAL_SWEEP_TYPE_AUTO_RULES_BEST_SPEED         0
#define AGXSAN_VAL_SWEEP_TYPE_AUTO_RULES_DYNAMIC_RANGE      1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_MEASUREMENT_TYPE
	attribute AGXSAN_ATTR_SA_SWEEPCOUPLING_SWEEP_TYPE
	parameter Val in function AgXSAn_SASEMaskOffsetSweepType
	parameter SweepType in function AgXSAn_SASEMaskOffsetListConfigureSweepType */

#define AGXSAN_VAL_SWEEP_TYPE_FFT                           0
#define AGXSAN_VAL_SWEEP_TYPE_SWEPT                         1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_GATING_METHOD */

#define AGXSAN_VAL_SA_GATING_METHOD_LO                      0
#define AGXSAN_VAL_SA_GATING_METHOD_VIDEO                   1
#define AGXSAN_VAL_SA_GATING_METHOD_FFT                     2

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_GATING_SOURCE */

#define AGXSAN_VAL_SA_GATING_SOURCE_EXTERNAL1               0
#define AGXSAN_VAL_SA_GATING_SOURCE_EXTERNAL2               1
#define AGXSAN_VAL_SA_GATING_SOURCE_LINE                    3
#define AGXSAN_VAL_SA_GATING_SOURCE_FRAME                   4
#define AGXSAN_VAL_SA_GATING_SOURCE_RFBURST                 5

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_GATING_TYPE */

#define AGXSAN_VAL_SA_GATING_TYPE_EDGE                      0
#define AGXSAN_VAL_SA_GATING_TYPE_LEVEL                     1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_GATING_DELAY_COMPENSATION */

#define AGXSAN_VAL_SA_GATE_DELAY_COMPENSATION_TYPE_OFF             0
#define AGXSAN_VAL_SA_GATE_DELAY_COMPENSATION_TYPE_RBW_SETTLED     1
#define AGXSAN_VAL_SA_GATE_DELAY_COMPENSATION_TYPE_RBW_GROUP_DELAY 2

/*- Defined values for 
	attribute AGXSAN_ATTR_REFOSCILLATOR_EXTERNAL_COUPLING */

#define AGXSAN_VAL_REF_OSCILLATOR_COUPLING_NORMAL           0
#define AGXSAN_VAL_REF_OSCILLATOR_COUPLING_NO_ACQUISITION   1

/*- Defined values for 
	attribute AGXSAN_ATTR_REFOSCILLATOR_EXTERNAL_BANDWIDTH */

#define AGXSAN_VAL_REF_OSCILLATOR_BANDWIDTH_WIDE            0
#define AGXSAN_VAL_REF_OSCILLATOR_BANDWIDTH_NARROW          1

/*- Defined values for 
	attribute AGXSAN_ATTR_FREQUENCY_SYNTHESIS
	attribute AGXSAN_ATTR_SA_LISTSWEEP_FREQUENCY_SYNTHESIS */

#define AGXSAN_VAL_FREQUENCY_SYNTHESIS1                     0
#define AGXSAN_VAL_FREQUENCY_SYNTHESIS2                     1
#define AGXSAN_VAL_FREQUENCY_SYNTHESIS3                     2

/*- Defined values for 
	attribute AGXSAN_ATTR_RADIO_DEVICE */

#define AGXSAN_VAL_RADIO_DEVICE_BTS                         0
#define AGXSAN_VAL_RADIO_DEVICE_MS                          1

/*- Defined values for 
	attribute AGXSAN_ATTR_RADIO_STANDARD */

#define AGXSAN_VAL_RADIO_STANDARD_NONE                      0
#define AGXSAN_VAL_RADIO_STANDARD_JSTD                      1
#define AGXSAN_VAL_RADIO_STANDARD_IS95A                     2
#define AGXSAN_VAL_RADIO_STANDARD_IS97D                     3
#define AGXSAN_VAL_RADIO_STANDARD_IS98D                     4
#define AGXSAN_VAL_RADIO_STANDARD_GSM                       5
#define AGXSAN_VAL_RADIO_STANDARD_W3GPP                     6
#define AGXSAN_VAL_RADIO_STANDARD_CDMA2000MC1               7
#define AGXSAN_VAL_RADIO_STANDARD_C20001X                   8
#define AGXSAN_VAL_RADIO_STANDARD_NADC                      9
#define AGXSAN_VAL_RADIO_STANDARD_PDC                       10
#define AGXSAN_VAL_RADIO_STANDARD_BLUETOOTH                 11
#define AGXSAN_VAL_RADIO_STANDARD_TETRA                     12
#define AGXSAN_VAL_RADIO_STANDARD_WL802DOT11A               13
#define AGXSAN_VAL_RADIO_STANDARD_WL802DOT11B               14
#define AGXSAN_VAL_RADIO_STANDARD_WL802DOT11G               15
#define AGXSAN_VAL_RADIO_STANDARD_HIPERLAN2                 16
#define AGXSAN_VAL_RADIO_STANDARD_DVBTLSN                   17
#define AGXSAN_VAL_RADIO_STANDARD_DVBTGPN                   18
#define AGXSAN_VAL_RADIO_STANDARD_DVBTIPN                   19
#define AGXSAN_VAL_RADIO_STANDARD_FCC15                     20
#define AGXSAN_VAL_RADIO_STANDARD_SDMBSE                    21
#define AGXSAN_VAL_RADIO_STANDARD_UWBINDOOR                 22

/*- Defined values for 
	attribute AGXSAN_ATTR_RADIO_NON_STANDARD_MEASUREMENT_ENABLED */

#define AGXSAN_VAL_RADIO_NON_STANDARD_MEASUREMENT_STATE_ENABLED  0
#define AGXSAN_VAL_RADIO_NON_STANDARD_MEASUREMENT_STATE_DISABLED 1

/*- Defined values for 
	attribute AGXSAN_ATTR_RADIO_BAND_CLASS */

#define AGXSAN_VAL_RADIO_BAND_CLASS_BC0                     0
#define AGXSAN_VAL_RADIO_BAND_CLASS_BC1                     1

/*- Defined values for 
	attribute AGXSAN_ATTR_RADIO_PACKET_TYPE */

#define AGXSAN_VAL_RADIO_PACKET_TYPE_DH1                    0
#define AGXSAN_VAL_RADIO_PACKET_TYPE_DH3                    1
#define AGXSAN_VAL_RADIO_PACKET_TYPE_DH5                    2

/*- Defined values for 
	attribute AGXSAN_ATTR_ANALOGDEMODULATOR_TYPE */

#define AGXSAN_VAL_ANALOG_DEMODULATOR_TYPE_AMPLITUDE_MODULATION 0
#define AGXSAN_VAL_ANALOG_DEMODULATOR_TYPE_PHASE_MODULATION     1
#define AGXSAN_VAL_ANALOG_DEMODULATOR_TYPE_FREQUENCY_MODULATION 2
#define AGXSAN_VAL_ANALOG_DEMODULATOR_TYPE_OFF                  3

/*- Defined values for 
	attribute AGXSAN_ATTR_ANALOGDEMODULATOR_FM_DE_EMPHASIS */

#define AGXSAN_VAL_ANALOG_DEMODULATOR_DE_EMPHASIS_TYPE_OFF   0
#define AGXSAN_VAL_ANALOG_DEMODULATOR_DE_EMPHASIS_TYPE_US25  1
#define AGXSAN_VAL_ANALOG_DEMODULATOR_DE_EMPHASIS_TYPE_US50  2
#define AGXSAN_VAL_ANALOG_DEMODULATOR_DE_EMPHASIS_TYPE_US75  3
#define AGXSAN_VAL_ANALOG_DEMODULATOR_DE_EMPHASIS_TYPE_US750 4

/*- Defined values for 
	attribute AGXSAN_ATTR_INPUT_AMPLITUDE_REFERENCE */

#define AGXSAN_VAL_INPUT_AMPLITUDE_REFERENCE_50             0
#define AGXSAN_VAL_INPUT_AMPLITUDE_REFERENCE_4800           1
#define AGXSAN_VAL_INPUT_AMPLITUDE_REFERENCE_OFF            2

/*- Defined values for 
	attribute AGXSAN_ATTR_INPUT_PORT */

#define AGXSAN_VAL_INPUT_PORT_I                             0
#define AGXSAN_VAL_INPUT_PORT_Q                             1
#define AGXSAN_VAL_INPUT_PORT_IQ                            2
#define AGXSAN_VAL_INPUT_PORT_RF                            3
#define AGXSAN_VAL_INPUT_PORT_INDEPENDENT                   4
#define AGXSAN_VAL_INPUT_PORT_AMPLITUDE_REFERENCE           5
#define AGXSAN_VAL_INPUT_PORT_ALIGNEDIQ                     6

/*- Defined values for 
	attribute AGXSAN_ATTR_INPUT_IF_FFT_IF_GAIN_STATE */

#define AGXSAN_VAL_INPUT_FFT_IF_GAIN_STATE_AUTO_RANGE       0
#define AGXSAN_VAL_INPUT_FFT_IF_GAIN_STATE_HIGH             1
#define AGXSAN_VAL_FFT_IF_GAIN_STATE_LOW                    2

/*- Defined values for 
	attribute AGXSAN_ATTR_INPUT_RF_COUPLING */

#define AGXSAN_VAL_INPUT_RF_COUPLING_AC                     0
#define AGXSAN_VAL_INPUT_RF_COUPLING_DC                     1

/*- Defined values for 
	attribute AGXSAN_ATTR_INPUT_RF_CORRECTION_FREQUENCY_INTERPOLATION */

#define AGXSAN_VAL_INPUT_RF_CORRECTION_FREQUENCY_INTERPOLATION_LINEAR      0
#define AGXSAN_VAL_INPUT_RF_CORRECTION_FREQUENCY_INTERPOLATION_LOGARITHMIC 1

/*- Defined values for 
	attribute AGXSAN_ATTR_LEVEL_ATTENUATION_OPTIMIZE */

#define AGXSAN_VAL_LEVEL_ATTENUATION_OPTIMIZE_OFF           0
#define AGXSAN_VAL_LEVEL_ATTENUATION_OPTIMIZE_ELECTRICAL    1
#define AGXSAN_VAL_LEVEL_ATTENUATION_OPTIMIZE_COMBINED      2

/*- Defined values for 
	attribute AGXSAN_ATTR_LEVEL_ATTENUATION_STEP_INCREMENT */

#define AGXSAN_VAL_LEVEL_ATTENUATION_STEP_INCREMENT2        0
#define AGXSAN_VAL_LEVEL_ATTENUATION_STEP_INCREMENT10       1

/*- Defined values for 
	attribute AGXSAN_ATTR_PRESELECTOR_MW_PATH */

#define AGXSAN_VAL_PRESELECTOR_MICRO_WAVE_PATH_STANDARD     0
#define AGXSAN_VAL_PRESELECTOR_MICRO_WAVE_PATH_LOW_NOISE    1
#define AGXSAN_VAL_PRESELECTOR_MICRO_WAVE_PATH_BY_PASS      2

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_LIMIT_AMPLITUDE_INTERPOLATOR */

#define AGXSAN_VAL_SA_LIMIT_AMPLITUDE_INTERPOLATOR_LINEAR      0
#define AGXSAN_VAL_SA_LIMIT_AMPLITUDE_INTERPOLATOR_LOGARITHMIC 1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_LIMIT_DOMAIN */

#define AGXSAN_VAL_SA_LIMIT_DOMAIN_FREQUENCY                0
#define AGXSAN_VAL_SA_LIMIT_DOMAIN_TIME                     1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_LIMIT_FREQUENCY_INTERPOLATOR */

#define AGXSAN_VAL_SA_LIMIT_FREQUENCY_INTERPOLATION_LINEAR      0
#define AGXSAN_VAL_SA_LIMIT_FREQUENCY_INTERPOLATION_LOGARITHMIC 1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_LIMIT_MODE */

#define AGXSAN_VAL_SA_LIMIT_MODE_FIXED                      0
#define AGXSAN_VAL_SA_LIMIT_MODE_RELATIVE                   1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_LIMIT_TYPE */

#define AGXSAN_VAL_SA_LIMIT_TYPE_LOWER                      0
#define AGXSAN_VAL_SA_LIMIT_TYPE_UPPER                      1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_MARKER_FUNCTION */

#define AGXSAN_VAL_MARKER_FUNCTION_BAND_POWER               0
#define AGXSAN_VAL_MARKER_FUNCTION_NOISE                    1
#define AGXSAN_VAL_MARKER_FUNCTION_OFF                      2
#define AGXSAN_VAL_MARKER_FUNCTION_BAND_DENSITY             3

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_MARKER_X_AXIS_SCALE */

#define AGXSAN_VAL_MARKER_X_AXIS_SCALE_FREQUENCY            0
#define AGXSAN_VAL_MARKER_X_AXIS_SCALE_TIME                 1
#define AGXSAN_VAL_MARKER_X_AXIS_SCALE_INVERSE_TIME         2
#define AGXSAN_VAL_MARKER_X_AXIS_SCALE_PERIOD               3

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_MARKER_PEAK_TABLE_READOUT_MODE */

#define AGXSAN_VAL_MARKER_PEAK_TABLE_READOUT_MODE_READ_ALL                0
#define AGXSAN_VAL_MARKER_PEAK_TABLE_READOUT_MODE_READ_ABOVE_DISPLAY_LINE 1
#define AGXSAN_VAL_MARKER_PEAK_TABLE_READOUT_MODE_READ_BELOW_DISPLAY_LINE 2

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_MARKER_PEAK_SORT_MODE */

#define AGXSAN_VAL_MARKER_PEAK_SORT_MODE_DESCENDING_AMPLITUDE 0
#define AGXSAN_VAL_MARKER_PEAK_SORT_MODE_ASCENDING_FREQUENCY  1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_MARKER_PEAK_SEARCH_MODE */

#define AGXSAN_VAL_MARKER_PEAK_SEARCH_MODE_MAXIMUM          0
#define AGXSAN_VAL_MARKER_PEAK_SEARCH_MODE_PARAMETER        1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_LISTSWEEP_TRIGGER_SLOPE
	parameter TriggerSlope in function AgXSAn_SAListSweepConfigureParameters */

#define AGXSAN_VAL_TRIGGER_SLOPE_POSITIVE                   0
#define AGXSAN_VAL_TRIGGER_SLOPE_NEGATIVE                   1

/*- Defined values for 
	attribute AGXSAN_ATTR_TRACES_AVERAGE_TYPE */

#define AGXSAN_VAL_TRACES_AVERAGING_TYPERMS                 0
#define AGXSAN_VAL_TRACES_AVERAGING_TYPE_LOGARITHMIC        1
#define AGXSAN_VAL_TRACES_AVERAGING_TYPE_SCALAR             2

/*- Defined values for 
	parameter Method in function AgXSAn_TraceCompress */

#define AGXSAN_VAL_TRACE_COMPRESS_METHOD_BLOCK              0
#define AGXSAN_VAL_TRACE_COMPRESS_METHOD_CFIT               1
#define AGXSAN_VAL_TRACE_COMPRESS_METHOD_MAXIMUM            2
#define AGXSAN_VAL_TRACE_COMPRESS_METHOD_MEAN               3
#define AGXSAN_VAL_TRACE_COMPRESS_METHOD_MINIMUM            4
#define AGXSAN_VAL_TRACE_COMPRESS_METHOD_SAMPLE             5
#define AGXSAN_VAL_TRACE_COMPRESS_METHODRMS                 6
#define AGXSAN_VAL_TRACE_COMPRESS_METHOD_DEVIATION          7

/*- Defined values for 
	parameter Function in function AgXSAn_TracesConfigureFunctions */

#define AGXSAN_VAL_TRACE_MATH_FUNCTION_OFF                  0
#define AGXSAN_VAL_TRACE_MATH_FUNCTION_POWER_DIFFERENCE     1
#define AGXSAN_VAL_TRACE_MATH_FUNCTION_POWER_SUM            2
#define AGXSAN_VAL_TRACE_MATH_FUNCTION_LOG_OFFSET           3
#define AGXSAN_VAL_TRACE_MATH_FUNCTION_LOG_DIFFERENCE       4

/*- Defined values for 
	parameter Destination in function AgXSAn_TracesConfigureFunctions
	parameter Operand1 in function AgXSAn_TracesConfigureFunctions
	parameter Operand2 in function AgXSAn_TracesConfigureFunctions */

#define AGXSAN_VAL_TRACE_MATH_TRACE1                        0
#define AGXSAN_VAL_TRACE_MATH_TRACE2                        1
#define AGXSAN_VAL_TRACE_MATH_TRACE3                        2
#define AGXSAN_VAL_TRACE_MATH_TRACE4                        3
#define AGXSAN_VAL_TRACE_MATH_TRACE5                        4
#define AGXSAN_VAL_TRACE_MATH_TRACE6                        5

/*- Defined values for 
	attribute AGXSAN_ATTR_INPUT_IF_SWEPT_IF_GAIN_STATE */

#define AGXSAN_VAL_INPUT_SWEPT_IF_GAIN_STATE_HIGH           0
#define AGXSAN_VAL_INPUT_SWEPT_IF_GAIN_STATE_LOW            1

/*- Defined values for 
	parameter DetectorType in function AgXSAn_SAListSweepDetectorConfigure
	parameter RetVal in function AgXSAn_SAListSweepDetectorQuery */

#define AGXSAN_VAL_LIST_DETECTOR_TYPE_LOG_AVERAGE           0
#define AGXSAN_VAL_LIST_DETECTOR_TYPE_VOLTAGE_AVERAGE       1
#define AGXSAN_VAL_LIST_DETECTOR_TYPERMS_AVERAGE            2
#define AGXSAN_VAL_LIST_DETECTOR_TYPE_MIN_PEAK              3
#define AGXSAN_VAL_LIST_DETECTOR_TYPE_MAX_PEAK              4
#define AGXSAN_VAL_LIST_DETECTOR_TYPE_SAMPLE                5
#define AGXSAN_VAL_LIST_DETECTOR_TYPE_AVERAGE_PEAK          6
#define AGXSAN_VAL_LIST_DETECTOR_TYPERMS_PEAK               7
#define AGXSAN_VAL_LIST_DETECTOR_TYPE_DUAL_AVERAGE          8

/*- Defined values for 
	attribute AGXSAN_ATTR_CALIBRATION_AUTO_ALERT_MODE */

#define AGXSAN_VAL_CALIBRATION_AUTO_ALERT_MODE_TIME_TEMPRATURE 0
#define AGXSAN_VAL_CALIBRATION_AUTO_ALERT_MODE24_HOURS         1
#define AGXSAN_VAL_CALIBRATION_AUTO_ALERT_MODE7_DAYS           2
#define AGXSAN_VAL_CALIBRATION_AUTO_ALERT_MODE_NONE            3

/*- Defined values for 
	attribute AGXSAN_ATTR_OUTPUT_ANALOG_TYPE */

#define AGXSAN_VAL_ANALOG_OUTPUT_TYPE_OFF                   0
#define AGXSAN_VAL_ANALOG_OUTPUT_TYPE_SCREEN_VIDEO          1
#define AGXSAN_VAL_ANALOG_OUTPUT_TYPE_LOGARITHIMIC_VIDEO    2
#define AGXSAN_VAL_ANALOG_OUTPUT_TYPE_LINEAR_VIDEO          3
#define AGXSAN_VAL_ANALOG_OUTPUT_TYPE_DEMODULATOR_AUDIO     4

/*- Defined values for 
	attribute AGXSAN_ATTR_OUTPUT_AUXILIARY_IF_TYPE */

#define AGXSAN_VAL_AUXILIARY_IF_OUTPUT_TYPE_SECONDIF           0
#define AGXSAN_VAL_AUXILIARY_IF_OUTPUT_TYPE_ARBITRARYIF        1
#define AGXSAN_VAL_AUXILIARY_IF_OUTPUT_TYPE_LOGARITHIMIC_VIDEO 2
#define AGXSAN_VAL_AUXILIARY_IF_OUTPUT_TYPE_OFF                3

/*- Defined values for 
	attribute AGXSAN_ATTR_INPUT_RF_CORRECTION_ANTENNA_UNIT */

#define AGXSAN_VAL_INPUT_RF_CORRECTION_ANTENNA_UNIT_DBUV    0
#define AGXSAN_VAL_INPUT_RF_CORRECTION_ANTENNA_UNIT_DBUA    1
#define AGXSAN_VAL_INPUT_RF_CORRECTION_ANTENNA_UNIT_DBPT    2
#define AGXSAN_VAL_INPUT_RF_CORRECTION_ANTENNA_UNIT_DBG     3
#define AGXSAN_VAL_INPUT_RF_CORRECTION_ANTENNA_UNIT_NONE    4

/*- Defined values for 
	attribute AGXSAN_ATTR_INPUT_RF_CORRECTIONS_IMPEDANCE */

#define AGXSAN_VAL_INPUTRF_IMPEDANCE_CORRECTION50           0
#define AGXSAN_VAL_INPUTRF_IMPEDANCE_CORRECTION75           1

/*- Defined values for 
	attribute AGXSAN_ATTR_DISPLAY_VIEW */

#define AGXSAN_VAL_DISPLAY_VIEW_NORMAL                      0
#define AGXSAN_VAL_DISPLAY_VIEW_TRACE_ZOOM                  1
#define AGXSAN_VAL_DISPLAY_VIEW_SPECTROGRAM                 2
#define AGXSAN_VAL_DISPLAY_VIEW_ZOOM_SPAN                   3
#define AGXSAN_VAL_DISPLAY_VIEW_ALTERNATE                   4

/*- Defined values for 
	parameter Sort in function AgXSAn_TracePeaks */

#define AGXSAN_VAL_TRACE_SORT_AMPLITUDE                     0
#define AGXSAN_VAL_TRACE_SORT_FREQUENCY                     1
#define AGXSAN_VAL_TRACE_SORT_TIME                          2

/*- Defined values for 
	attribute AGXSAN_ATTR_INPUT_TYPE */

#define AGXSAN_VAL_INPUT_TYPE_INPUT1                        0
#define AGXSAN_VAL_INPUT_TYPE_INPUT2                        1
#define AGXSAN_VAL_INPUT_TYPE_OUTPUT1                       2
#define AGXSAN_VAL_INPUT_TYPE_OUTPUT2                       3
#define AGXSAN_VAL_INPUT_TYPE_OUTPUT3                       4
#define AGXSAN_VAL_INPUT_TYPE_OUTPUT4                       5
#define AGXSAN_VAL_INPUT_TYPE_RFFD                          6
#define AGXSAN_VAL_INPUT_TYPE_RFHD                          7
#define AGXSAN_VAL_INPUT_TYPE_ANT                           8
#define AGXSAN_VAL_INPUT_TYPE_TR                            9
#define AGXSAN_VAL_INPUT_TYPERFFD                           6
#define AGXSAN_VAL_INPUT_TYPERFHD                           7
#define AGXSAN_VAL_INPUT_TYPEANT                            8
#define AGXSAN_VAL_INPUT_TYPETR                             9

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_SOURCE_MODE */

#define AGXSAN_VAL_SOURCE_MODE_TRACKING                     0
#define AGXSAN_VAL_SOURCE_MODE_OFF                          1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_SOURCE_POINT_TRIGGER_TYPE */

#define AGXSAN_VAL_SOURCE_POINT_TRIGGER_TYPE_SOFTWARE       0
#define AGXSAN_VAL_SOURCE_POINT_TRIGGER_TYPE_EXTERNAL1      1

/*- Defined values for 
	attribute AGXSAN_ATTR_SCALE_TYPE */

#define AGXSAN_VAL_SCALE_TYPE_LINEAR                        0
#define AGXSAN_VAL_SCALE_TYPE_LOGARITHMIC                   1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_SEMASK_DISPLAY_WINDOWX_REF_POSITION */

#define AGXSAN_VAL_DISPLAYX_REF_POSITION_LEFT               0
#define AGXSAN_VAL_DISPLAYX_REF_POSITION_CENTER             1
#define AGXSAN_VAL_DISPLAYX_REF_POSITION_RIGHT              2

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_SEMASK_SWEEPCOUPLING_SWEEP_TYPE_AUTO_RULES */

#define AGXSAN_VAL_SWEEP_TYPE_AUTO_RULE_BEST_DYNAMIC_RANGE  0
#define AGXSAN_VAL_SWEEP_TYPE_AUTO_RULE_BEST_SPEED          1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_SPURIOUS_EMISSION_DISPLAY_VIEW_SELECTION */

#define AGXSAN_VAL_SPURIOUS_EMISSION_DISPLAY_VIEW_RESULT    0
#define AGXSAN_VAL_SPURIOUS_EMISSION_DISPLAY_VIEW_RANGE     1
#define AGXSAN_VAL_SPURIOUS_EMISSION_DISPLAY_VIEW_ALL       2

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DISPLAY_VIEW_SELECTION */

#define AGXSAN_VAL_OB_WIDTH_DISPLAY_VIEWOBW_RESULTS         0
#define AGXSAN_VAL_OB_WIDTH_DISPLAY_VIEW_BOUNDARIES         1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_DISPLAY_BOUNDARY_FREQUENCY_DISPLAY_TYPE */

#define AGXSAN_VAL_OB_WIDTH_BOUNDARY_FREQUENCY_DISPLAY_TYPE_OFFSET   0
#define AGXSAN_VAL_OB_WIDTH_BOUNDARY_FREQUENCY_DISPLAY_TYPE_ABSOLUTE 1

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_OCCUPIEDBANDWIDTH_POWER_REFERENCE_TYPE */

#define AGXSAN_VAL_OB_WIDTH_POWER_REFERENCE_TYPE_TOTAL_POWER 0
#define AGXSAN_VAL_OB_WIDTH_POWER_REFERENCE_TYPEOBW_POWER    1

/*- Defined values for 
	attribute AGXSAN_ATTR_TRIGGER_RFBURST_SLOPE
	attribute AGXSAN_ATTR_TRIGGER_LINE_DELAY_SLOPE
	parameter MarkerPolarity in function AgXSAn_SSDigitalModulationArbSetMarkerPolarity
	parameter Val in function AgXSAn_SSDigitalModulationArbGetMarkerPolarity */

#define AGXSAN_VAL_POLARITY_POSITIVE                        0
#define AGXSAN_VAL_POLARITY_NEGATIVE                        1

/*- Defined values for 
	attribute AGXSAN_ATTR_TRIGGER_FRAME_SYNC_SOURCE */

#define AGXSAN_VAL_TRIGGER_FRAME_SYNC_SOURCE_OFF            0
#define AGXSAN_VAL_TRIGGER_FRAME_SYNC_SOURCE_EXTERNAL1      1
#define AGXSAN_VAL_TRIGGER_FRAME_SYNC_SOURCE_EXTERNAL2      2
#define AGXSAN_VAL_TRIGGER_FRAME_SYNC_SOURCERF_BURST        3

/*- Defined values for 
	attribute AGXSAN_ATTR_REFERENCE_TYPE */

#define AGXSAN_VAL_ACP_POWER_CARRIER_REFERENCE_TYPER_CARRIER  0
#define AGXSAN_VAL_ACP_POWER_CARRIER_REFERENCE_TYPE_MANUAL    1
#define AGXSAN_VAL_ACP_POWER_CARRIER_REFERENCE_TYPETM_CARRIER 2

/*- Defined values for 
	attribute AGXSAN_ATTR_SA_CHANNEL_POWER_PSD_UNIT */

#define AGXSAN_VAL_CH_POWERPSD_UNITDBM_HZ                   0
#define AGXSAN_VAL_CH_POWERPSD_UNITDBMM_HZ                  1

/*- Defined values for 
	attribute AGXSAN_ATTR_FORMAT */

#define AGXSAN_VAL_SYSTEM_FORMAT_ASCII                      0
#define AGXSAN_VAL_SYSTEM_FORMAT_INT32                      1
#define AGXSAN_VAL_SYSTEM_FORMAT_INT64                      2
#define AGXSAN_VAL_SYSTEM_FORMAT_REAL32                     3
#define AGXSAN_VAL_SYSTEM_FORMAT_REAL64                     4

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_TRIGGER_SOURCE */

#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_TRIGGER_SOURCE_BUS      0
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_TRIGGER_SOURCE_EXTERNAL 1
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_TRIGGER_SOURCE_KEY      2

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_TRIGGER_TYPE
	attribute AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_SEGMENT_ADVANCE_TRIGGER_TYPE */

#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_TRIGGER_TYPE_SINGLE     0
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_TRIGGER_TYPE_CONTINUOUS 1

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_CONTINUOUS_TRIGGER_TYPE */

#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_CONTINUOUS_TRIGGER_TYPE_FREE_RUN 0
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_CONTINUOUS_TRIGGER_TYPE_RESET    1
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_CONTINUOUS_TRIGGER_TYPE_TRIGGER  2

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_EXTERNAL_TRIGGER_SLOPE */

#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_EXTERNAL_TRIGGER_SLOPE_POSITIVE 0
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_EXTERNAL_TRIGGER_SLOPE_NEGATIVE 1

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_RE_TRIGGER_MODE */

#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_RETRIGGER_MODE_ON        0
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_RETRIGGER_MODE_OFF       1
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_RETRIGGER_MODE_IMMEDIATE 2

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_ALC_HOLD
	attribute AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_RF_BLANKING
	parameter MarkerIndex in function AgXSAn_SSDigitalModulationArbSetMarkerPolarity
	parameter MarkerIndex in function AgXSAn_SSDigitalModulationArbGetMarkerPolarity */

#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_MARKER_INDEX_ONE   0
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_MARKER_INDEX_TWO   1
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_MARKER_INDEX_THREE 2
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_MARKER_INDEX_FOUR  3
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_MARKER_INDEX_ALL   4
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_MARKER_INDEX_NONE  5

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_DIGITALMODULATION_ARB_RMS_CALCULATION_MODE */

#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARBRMS_CALCULATION_MODE_AUTO 0
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARBRMS_CALCULATION_MODEM1    1
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARBRMS_CALCULATION_MODEM2    2
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARBRMS_CALCULATION_MODEM3    3
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARBRMS_CALCULATION_MODEM4    4

/*- Defined values for */

#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_NOISE_POWER_CONTROL_MODE_TOTAL         0
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_NOISE_POWER_CONTROL_MODE_CARRIER       1
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_NOISE_POWER_CONTROL_MODE_TOTAL_NOISE   2
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_NOISE_POWER_CONTROL_MODE_CHANNEL_NOISE 3

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_LISTSEQUENCER_REPEATITION_MODE */

#define AGXSAN_VAL_SS_LIST_SEQUENCER_REPEATITION_MODE_SINGLE     0
#define AGXSAN_VAL_SS_LIST_SEQUENCER_REPEATITION_MODE_CONTINUOUS 1

/*- Defined values for 
	parameter StepDuration in function AgXSAn_SSListSequencerConfigure
	parameter StepDuration in function AgXSAn_SSListSequencerQueryConfiguration
	parameter DurationType in function AgXSAn_SSListSequencerSetupConfigureListDurationType
	parameter Val in function AgXSAn_SSListSequencerSetupQueryListDurationType
	parameter StepDuartionType in function AgXSAn_SSListSequencerSetupConfigureListStepDurationType
	parameter Val in function AgXSAn_SSListSequencerSetupQueryListStepDurationType */

#define AGXSAN_VAL_SS_LIST_SEQUENCER_STEP_DURATION_TYPE_TIME       0
#define AGXSAN_VAL_SS_LIST_SEQUENCER_STEP_DURATION_TYPE_CONTINUOUS 1
#define AGXSAN_VAL_SS_LIST_SEQUENCER_STEP_DURATION_TYPE_COUNT      2

/*- Defined values for 
	parameter DataMarker in function AgXSAn_SSListSequencerSetupTriggerConfigureDataMarker
	parameter Val in function AgXSAn_SSListSequencerSetupTriggerQueryDataMarker */

#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_TRIGGER_DATA_MARKER_MARKER1 0
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_TRIGGER_DATA_MARKER_MARKER2 1
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_TRIGGER_DATA_MARKER_MARKER3 2
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_TRIGGER_DATA_MARKER_MARKER4 3

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_LISTSEQUENCER_SETUP_TRIGGER_TYPE */

#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_TRIGGER_TYPE_BEGINING_OF_STEP 0
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_TRIGGER_TYPE_DATA_MARKER      1

/*- Defined values for 
	parameter TriggerType in function AgXSAn_SSListSequencerConfigure
	parameter TriggerType in function AgXSAn_SSListSequencerQueryConfiguration
	parameter TriggerType in function AgXSAn_SSListSequencerSetupTriggerConfigureStepInputTriggerType
	parameter Val in function AgXSAn_SSListSequencerSetupTriggerQueryStepInputTriggerType */

#define AGXSAN_VAL_LIST_SEQUENCER_SETUP_INPUT_TRIGGER_TYPE_FREE_RUN  0
#define AGXSAN_VAL_LIST_SEQUENCER_SETUP_INPUT_TRIGGER_TYPE_INTERNAL  1
#define AGXSAN_VAL_LIST_SEQUENCER_SETUP_INPUT_TRIGGER_TYPE_MANUAL    2
#define AGXSAN_VAL_LIST_SEQUENCER_SETUP_INPUT_TRIGGER_TYPE_BUS       3
#define AGXSAN_VAL_LIST_SEQUENCER_SETUP_INPUT_TRIGGER_TYPE_EXTERNAL2 4
#define AGXSAN_VAL_LIST_SEQUENCER_SETUP_INPUT_TRIGGER_TYPE_EXTERNAL4 5
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_INPUT_TRIGGER_TYPE_FREE_RUN  0
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_INPUT_TRIGGER_TYPE_INTERNAL  1
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_INPUT_TRIGGER_TYPE_MANUAL    2
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_INPUT_TRIGGER_TYPE_BUS       3
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_INPUT_TRIGGER_TYPE_EXTERNAL2 4
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_INPUT_TRIGGER_TYPE_EXTERNAL4 5

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_RFGENERATOR_RADIO_BAND
	parameter RadioBand in function AgXSAn_SSListSequencerConfigure
	parameter RadioBand in function AgXSAn_SSListSequencerQueryConfiguration
	parameter RadioBand in function AgXSAn_SSListSequencerSetupConfigureListRadioBand
	parameter Val in function AgXSAn_SSListSequencerSetupQueryListRadioBand
	parameter RadioBand in function AgXSAn_SSListSequencerSetupConfigureListStepRadioBand
	parameter Val in function AgXSAn_SSListSequencerSetupQueryListStepRadioBand */

#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_NONE      0
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_PGSM      1
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_EGSM      2
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_RGSM      3
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_DCS1800   4
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_PCS1900   5
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_TGSM810   6
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_GSM450    7
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_GSM480    8
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_GSM700    9
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_GSM850    10
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDI          11
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDII         12
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDIII        13
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDIV         14
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDV          15
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDVI         16
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDVII        17
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDVIII       18
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDIX         19
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDX          20
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDXI         21
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDXII        22
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDXIII       23
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDXIV        24
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDXIX        25
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_USCELL    26
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_USPCS     27
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_JAPAN     28
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_KOREAN    29
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_NMT       30
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_IMT2K     31
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_UPPER     32
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_SECOND    33
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_PAMR400   34
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_PAMR800   35
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_IMTEXT    36
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_PCS1DOT9G 37
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_AWS       38
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_US2DOT5G  39
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_PUBLIC    40
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_LOWER     41
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND1          42
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND2          43
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND3          44
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND4          45
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND5          46
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND6          47
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND7          48
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND8          49
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDA          87
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND10         50
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND11         51
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND12         52
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND13         53
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND14         54
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDB          88
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDC          89
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND17         55
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND18         56
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND19         57
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND20         58
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND21         59
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDD          90
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDE          91
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND24         60
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND25         61
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND9          45
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND26         62
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND27         63
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND28         64
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND29         65
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND30         66
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND31         67
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND65         68
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND66         69
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND68         70
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND252        71
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND255        72
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND33         73
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND34         74
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND35         75
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND36         76
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND37         77
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND38         78
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND39         79
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND40         80
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND41         81
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND42         82
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND43         83
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND44         84
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND45         85
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND46         86
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BANDF          92
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BAND_NONE     0
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDPGSM      1
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDEGSM      2
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDRGSM      3
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDDCS1800   4
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDPCS1900   5
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDTGSM810   6
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDGSM450    7
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDGSM480    8
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDGSM700    9
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDGSM850    10
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDI     11
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDII    12
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDIII   13
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDIV    14
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDV     15
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDVI    16
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDVII   17
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDVIII  18
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDIX    19
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDX     20
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDXI    21
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDXII   22
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDXIII  23
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDXIV   24
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDXIX   25
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDUSCELL    26
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDUSPCS     27
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDJAPAN     28
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDKOREAN    29
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDNMT       30
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDIMT2K     31
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDUPPER     32
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDSECOND    33
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDPAMR400   34
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDPAMR800   35
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDIMTEXT    36
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDPCS1DOT9G 37
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDAWS       38
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDUS2DOT5G  39
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDPUBLIC    40
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDLOWER     41
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND1     42
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND2     43
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND3     44
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND4     45
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND5     46
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND6     47
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND7     48
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND8     49
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDA     87
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND10    50
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND11    51
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND12    52
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND13    53
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND14    54
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDB     88
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDC     89
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND17    55
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND18    56
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND19    57
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND20    58
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND21    59
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDD     90
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDE     91
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND24    60
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND25    61
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND9     45
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND26    62
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND27    63
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND28    64
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND29    65
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND30    66
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND31    67
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND65    68
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND66    69
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND68    70
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND252   71
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND255   72
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND33    73
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND34    74
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND35    75
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND36    76
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND37    77
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND38    78
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND39    79
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND40    80
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND41    81
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND42    82
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND43    83
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND44    84
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND45    85
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBAND46    86
#define AGXSAN_VAL_I_AGXS_AN5SS_LIST_SEQUENCER_SETUP_RADIO_BANDBANDF	 92

/*- Defined values for 
	parameter Link in function AgXSAn_SSListSequencerConfigure
	parameter Link in function AgXSAn_SSListSequencerQueryConfiguration
	parameter Link in function AgXSAn_SSListSequencerSetupConfigureListRadioBandLink
	parameter Val in function AgXSAn_SSListSequencerSetupQueryListRadioBandLink
	parameter Link in function AgXSAn_SSListSequencerSetupConfigureListStepRadioBandLink
	parameter Val in function AgXSAn_SSListSequencerSetupQueryListStepRadioBandLink */

#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_LINK_UPLINK   0
#define AGXSAN_VAL_SS_LIST_SEQUENCER_SETUP_RADIO_BAND_LINK_DOWNLINK 1

/*- Defined values for 
	parameter ListType in function AgXSAn_SSDigitalModulationArbQueryLockedWaveformList */

#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_LOCKED_WAVEFORM_LIST_TYPE_UNIQUEID 0
#define AGXSAN_VAL_SS_DIGITAL_MODULATION_ARB_LOCKED_WAVEFORM_LIST_TYPE_NAME     1

/*- Defined values for 
	attribute AGXSAN_ATTR_OUTPUT_TYPE */

#define AGXSAN_VAL_OUTPUT_TYPER_FOUT                        0
#define AGXSAN_VAL_OUTPUT_TYPE_GENERATOR                    1
#define AGXSAN_VAL_OUTPUT_TYPETR                            2
#define AGXSAN_VAL_OUTPUT_TYPERFHD                          3

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_TYPE */

#define AGXSAN_VAL_MODULATION_MODE_ANALOG                   0
#define AGXSAN_VAL_MODULATION_MODE_DIGITAL                  1
#define AGXSAN_VAL_MODULATION_MODE_ARBITRARY                2

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_ANALOG_FORMAT */

#define AGXSAN_VAL_MODULATION_TYPE_AM                       0
#define AGXSAN_VAL_MODULATION_TYPE_FM                       1
#define AGXSAN_VAL_MODULATION_TYPE_PM                       2
#define AGXSAN_VAL_MODULATION_TYPE_OFF                      3

/*- Defined values for 
	attribute AGXSAN_ATTR_SS_RFGENERATOR_MODULATION_ANALOG_WAVEFORM_TYPE */

#define AGXSAN_VAL_WAVEFORM_TRACE_TYPE_TRIANGLE             0
#define AGXSAN_VAL_WAVEFORM_TRACE_TYPE_SINE                 1
#define AGXSAN_VAL_WAVEFORM_TRACE_TYPE_SQUARE               2
#define AGXSAN_VAL_WAVEFORM_TRACE_TYPE_RECTANGLE            3
#define AGXSAN_VAL_WAVEFORM_TYPE_DUAL_SINE                  4
#define AGXSAN_VAL_WAVEFORM_TYPE_NOISE                      5
#define AGXSAN_VAL_WAVEFORM_TYPE_PULSE                      6
#define AGXSAN_VAL_WAVEFORM_TYPE_RUP                        7
#define AGXSAN_VAL_WAVEFORM_TYPER_DOWN                      8

/*- Defined values for 
	parameter ModulationType in function AgXSAn_SSRFGeneratorModulationDigitalConfigureModulationFormatTestPattern
	parameter ModulationType in function AgXSAn_SSRFGeneratorModulationDigitalQueryModulationFormatTestPattern */

#define AGXSAN_VAL_DIGITAL_MODULATION_TYPE_APCO25C4FM       0
#define AGXSAN_VAL_DIGITAL_MODULATION_TYPE_DMR              1
#define AGXSAN_VAL_DIGITAL_MODULATION_TYPE_NONE             2

/*- Defined values for 
	parameter TestPattern in function AgXSAn_SSRFGeneratorModulationDigitalConfigureModulationFormatTestPattern
	parameter TestPattern in function AgXSAn_SSRFGeneratorModulationDigitalQueryModulationFormatTestPattern */

#define AGXSAN_VAL_DIGITAL_MODULATION_FORMAT_TEST_PATTERN_STANDARD10112                0
#define AGXSAN_VAL_DIGITAL_MODULATION_FORMAT_TEST_PATTERN_STANDARD5112                 1
#define AGXSAN_VAL_DIGITAL_MODULATION_FORMAT_TEST_PATTERN_STANDARD_CALIBRATION         2
#define AGXSAN_VAL_DIGITAL_MODULATION_FORMAT_TEST_PATTERN_STANDARD_INBOUND10112        3
#define AGXSAN_VAL_DIGITAL_MODULATION_FORMAT_TEST_PATTERN_STANDARD_INBOUND5112         4
#define AGXSAN_VAL_DIGITAL_MODULATION_FORMAT_TEST_PATTERN_STANDARD_INBOUND_CALIBRATION 5
#define AGXSAN_VAL_DIGITAL_MODULATION_FORMAT_TEST_PATTERN_NONE                         6


/**************************************************************************** 
 *---------------- Instrument Driver Function Declarations -----------------* 
 ****************************************************************************/

/*- AgXSAn */

ViStatus _VI_FUNC AgXSAn_init(ViRsrc ResourceName, ViBoolean IdQuery, ViBoolean Reset, ViSession* Vi);
ViStatus _VI_FUNC AgXSAn_close(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_InitWithOptions(ViRsrc ResourceName, ViBoolean IdQuery, ViBoolean Reset, ViConstString OptionsString, ViSession* Vi);
ViStatus _VI_FUNC AgXSAn_SelectInstrPersonality(ViSession Vi, ViConstString PersonalityName);

/*- Utility */

ViStatus _VI_FUNC AgXSAn_revision_query(ViSession Vi, ViChar DriverRev[], ViChar InstrRev[]);
ViStatus _VI_FUNC AgXSAn_error_message(ViSession Vi, ViStatus ErrorCode, ViChar ErrorMessage[]);
ViStatus _VI_FUNC AgXSAn_GetError(ViSession Vi, ViStatus* ErrorCode, ViInt32 ErrorDescriptionBufferSize, ViChar ErrorDescription[]);
ViStatus _VI_FUNC AgXSAn_ClearError(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_GetNextCoercionRecord(ViSession Vi, ViInt32 CoercionRecordBufferSize, ViChar CoercionRecord[]);
ViStatus _VI_FUNC AgXSAn_InvalidateAllAttributes(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_Disable(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_error_query(ViSession Vi, ViInt32* ErrorCode, ViChar ErrorMessage[]);
ViStatus _VI_FUNC AgXSAn_LockSession(ViSession Vi, ViBoolean* CallerHasLock);
ViStatus _VI_FUNC AgXSAn_reset(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_ResetWithDefaults(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_self_test(ViSession Vi, ViInt16* TestResult, ViChar TestMessage[]);
ViStatus _VI_FUNC AgXSAn_UnlockSession(ViSession Vi, ViBoolean* CallerHasLock);

/*- Attribute Accessors */

ViStatus _VI_FUNC AgXSAn_GetAttributeViInt32(ViSession Vi, ViConstString RepCapIdentifier, ViAttr AttributeID, ViInt32* AttributeValue);
ViStatus _VI_FUNC AgXSAn_GetAttributeViReal64(ViSession Vi, ViConstString RepCapIdentifier, ViAttr AttributeID, ViReal64* AttributeValue);
ViStatus _VI_FUNC AgXSAn_GetAttributeViBoolean(ViSession Vi, ViConstString RepCapIdentifier, ViAttr AttributeID, ViBoolean* AttributeValue);
ViStatus _VI_FUNC AgXSAn_GetAttributeViSession(ViSession Vi, ViConstString RepCapIdentifier, ViAttr AttributeID, ViSession* AttributeValue);
ViStatus _VI_FUNC AgXSAn_GetAttributeViString(ViSession Vi, ViConstString RepCapIdentifier, ViAttr AttributeID, ViInt32 AttributeValueBufferSize, ViChar AttributeValue[]);
ViStatus _VI_FUNC AgXSAn_SetAttributeViInt32(ViSession Vi, ViConstString RepCapIdentifier, ViAttr AttributeID, ViInt32 AttributeValue);
ViStatus _VI_FUNC AgXSAn_SetAttributeViReal64(ViSession Vi, ViConstString RepCapIdentifier, ViAttr AttributeID, ViReal64 AttributeValue);
ViStatus _VI_FUNC AgXSAn_SetAttributeViBoolean(ViSession Vi, ViConstString RepCapIdentifier, ViAttr AttributeID, ViBoolean AttributeValue);
ViStatus _VI_FUNC AgXSAn_SetAttributeViSession(ViSession Vi, ViConstString RepCapIdentifier, ViAttr AttributeID, ViSession AttributeValue);
ViStatus _VI_FUNC AgXSAn_SetAttributeViString(ViSession Vi, ViConstString RepCapIdentifier, ViAttr AttributeID, ViConstString AttributeValue);

/*- Configuration */

ViStatus _VI_FUNC AgXSAn_ConfigureFrequencyOffset(ViSession Vi, ViReal64 FrequencyOffset);
ViStatus _VI_FUNC AgXSAn_ConfigureTraceType(ViSession Vi, ViConstString TraceName, ViInt32 TraceType);
ViStatus _VI_FUNC AgXSAn_GetTraceName(ViSession Vi, ViInt32 Index, ViInt32 NameBufferSize, ViChar Name[]);
ViStatus _VI_FUNC AgXSAn_QueryTraceSize(ViSession Vi, ViConstString TraceName, ViInt32* TraceSize);
ViStatus _VI_FUNC AgXSAn_ConfigureAcquisition(ViSession Vi, ViBoolean SweepModeContinuous, ViInt32 NumberOfSweeps, ViBoolean DetectorTypeAuto, ViInt32 DetectorType, ViInt32 VerticalScale);
ViStatus _VI_FUNC AgXSAn_ConfigureFrequencyCenterSpan(ViSession Vi, ViReal64 CenterFrequency, ViReal64 Span);
ViStatus _VI_FUNC AgXSAn_ConfigureFrequencyStartStop(ViSession Vi, ViReal64 StartFrequency, ViReal64 StopFrequency);
ViStatus _VI_FUNC AgXSAn_ConfigureLevel(ViSession Vi, ViInt32 AmplitudeUnits, ViReal64 InputImpedance, ViReal64 ReferenceLevel, ViReal64 ReferenceLevelOffset, ViBoolean AttenuationAuto, ViReal64 Attenuation);
ViStatus _VI_FUNC AgXSAn_ConfigureSweepCoupling(ViSession Vi, ViBoolean ResolutionBandwidthAuto, ViReal64 ResolutionBandwidth, ViBoolean VideoBandwidthAuto, ViReal64 VideoBandwidth, ViBoolean SweepTimeAuto, ViReal64 SweepTime);

/*- Marker */

ViStatus _VI_FUNC AgXSAn_ConfigureSignalTrackEnabled(ViSession Vi, ViBoolean SignalTrackEnabled);
ViStatus _VI_FUNC AgXSAn_GetMarkerName(ViSession Vi, ViInt32 Index, ViInt32 NameBufferSize, ViChar Name[]);
ViStatus _VI_FUNC AgXSAn_MoveMarker(ViSession Vi, ViReal64 MarkerPosition);
ViStatus _VI_FUNC AgXSAn_SetActiveMarker(ViSession Vi, ViConstString ActiveMarker);
ViStatus _VI_FUNC AgXSAn_QueryMarkerType(ViSession Vi, ViInt32* MarkerType);
ViStatus _VI_FUNC AgXSAn_ConfigureMarkerEnabled(ViSession Vi, ViBoolean MarkerEnabled, ViConstString MarkerTraceName);
ViStatus _VI_FUNC AgXSAn_ConfigureMarkerSearch(ViSession Vi, ViReal64 PeakExcursion, ViReal64 MarkerThreshold);
ViStatus _VI_FUNC AgXSAn_DisableAllMarkers(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_MakeMarkerDelta(ViSession Vi, ViBoolean DeltaMarker);
ViStatus _VI_FUNC AgXSAn_QueryMarker(ViSession Vi, ViReal64* MarkerPosition, ViReal64* MarkerAmplitude);
ViStatus _VI_FUNC AgXSAn_QueryReferenceMarker(ViSession Vi, ViReal64* ReferenceMarkerAmplitude, ViReal64* ReferenceMarkerPosition);
ViStatus _VI_FUNC AgXSAn_MarkerSearch(ViSession Vi, ViInt32 SearchType);
ViStatus _VI_FUNC AgXSAn_SetInstrumentFromMarker(ViSession Vi, ViInt32 InstrumentSetting);
ViStatus _VI_FUNC AgXSAn_ConfigureMarkerFrequencyCounter(ViSession Vi, ViBoolean Enabled, ViReal64 Resolution);

/*- Trigger */

ViStatus _VI_FUNC AgXSAn_ConfigureTriggerSource(ViSession Vi, ViInt32 TriggerSource);
ViStatus _VI_FUNC AgXSAn_ConfigureExternalTrigger(ViSession Vi, ViReal64 ExternalTriggerLevel, ViInt32 ExternalTriggerSlope);
ViStatus _VI_FUNC AgXSAn_ConfigureVideoTrigger(ViSession Vi, ViReal64 VideoTriggerLevel, ViInt32 VideoTriggerSlope);

/*- Alarm */

ViStatus _VI_FUNC AgXSAn_IviLxiSync_GetTriggerAlarmName(ViSession Vi, ViInt32 AlarmIndex, ViInt32 AlarmNameBufferSize, ViChar AlarmName[]);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_ConfigureTriggerAlarm(ViSession Vi, ViConstString AlarmName, ViReal64 TimeSeconds, ViReal64 TimeFraction, ViReal64 Period, ViInt32 RepeatCount);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_AddTriggerAlarm(ViSession Vi, ViConstString AlarmName);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_DisableAllTriggerAlarms(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_RemoveTriggerAlarm(ViSession Vi, ViConstString AlarmName);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_RemoveAllTriggerAlarms(ViSession Vi);

/*- Source */

ViStatus _VI_FUNC AgXSAn_IviLxiSync_GetTriggerSourceName(ViSession Vi, ViInt32 SourceIndex, ViInt32 SourceNameBufferSize, ViChar SourceName[]);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_ConfigureTriggerSource(ViSession Vi, ViConstString SourceName, ViReal64 Delay, ViInt32 Detection);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_AddTriggerSource(ViSession Vi, ViConstString SourceName);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_RemoveTriggerSource(ViSession Vi, ViConstString SourceName);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_RemoveAllCustomTriggerSources(ViSession Vi);

/*- External Mixer */

ViStatus _VI_FUNC AgXSAn_ConfigureConversionLossTableEnabled(ViSession Vi, ViBoolean ConversionLossTableEnabled);
ViStatus _VI_FUNC AgXSAn_ConfigureExternalMixerBiasEnabled(ViSession Vi, ViBoolean BiasEnabled);
ViStatus _VI_FUNC AgXSAn_ConfigureExternalMixerEnabled(ViSession Vi, ViBoolean ExternalMixerEnabled);
ViStatus _VI_FUNC AgXSAn_ConfigureExternalMixerNumberOfPorts(ViSession Vi, ViInt32 NumberOfPorts);
ViStatus _VI_FUNC AgXSAn_ConfigureExternalMixer(ViSession Vi, ViInt32 Harmonic, ViReal64 AverageConversionLoss);
ViStatus _VI_FUNC AgXSAn_ConfigureExternalMixerBias(ViSession Vi, ViReal64 Bias, ViReal64 BiasLimit);
ViStatus _VI_FUNC AgXSAn_ConfigureConversionLossTable(ViSession Vi, ViInt32 Count, ViReal64 Frequency[], ViReal64 ConversionLoss[]);

/*- Preselector */

ViStatus _VI_FUNC AgXSAn_PeakPreselector(ViSession Vi);

/*- Multitrace */

ViStatus _VI_FUNC AgXSAn_AddTraces(ViSession Vi, ViConstString DestinationTrace, ViConstString Trace1, ViConstString Trace2);
ViStatus _VI_FUNC AgXSAn_CopyTrace(ViSession Vi, ViConstString DestinationTrace, ViConstString SourceTrace);
ViStatus _VI_FUNC AgXSAn_ExchangeTraces(ViSession Vi, ViConstString Trace1, ViConstString Trace2);
ViStatus _VI_FUNC AgXSAn_SubtractTraces(ViSession Vi, ViConstString DestinationTrace, ViConstString Trace1, ViConstString Trace2);

/*- Alarm */

ViStatus _VI_FUNC AgXSAn_IviLxiSync_GetArmAlarmName(ViSession Vi, ViInt32 AlarmIndex, ViInt32 AlarmNameBufferSize, ViChar AlarmName[]);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_ConfigureArmAlarm(ViSession Vi, ViConstString AlarmName, ViBoolean Enabled, ViReal64 TimeSeconds, ViReal64 TimeFraction, ViReal64 Period, ViInt32 RepeatCount);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_AddArmAlarm(ViSession Vi, ViConstString AlarmName);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_DisableAllArmAlarms(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_RemoveArmAlarm(ViSession Vi, ViConstString AlarmName);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_RemoveAllCustomArmAlarms(ViSession Vi);

/*- Source */

ViStatus _VI_FUNC AgXSAn_IviLxiSync_GetArmSourceName(ViSession Vi, ViInt32 SourceIndex, ViInt32 SourceNameBufferSize, ViChar SourceName[]);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_ConfigureArmSource(ViSession Vi, ViConstString SourceName, ViBoolean Enabled, ViInt32 Detection);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_AddArmSource(ViSession Vi, ViConstString SourceName);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_DisableAllArmSources(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_RemoveArmSource(ViSession Vi, ViConstString SourceName);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_RemoveAllCustomArmSources(ViSession Vi);

/*- Event */

ViStatus _VI_FUNC AgXSAn_IviLxiSync_GetEventName(ViSession Vi, ViInt32 EventIndex, ViInt32 EventNameBufferSize, ViChar EventName[]);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_ConfigureEvent(ViSession Vi, ViConstString EventName, ViInt32 DriveMode, ViConstString Source, ViConstString DestinationPath, ViInt32 Slope);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_AddEvent(ViSession Vi, ViConstString EventName);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_DisableAllEvents(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_RemoveEvent(ViSession Vi, ViConstString EventName);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_RemoveAllCustomEvents(ViSession Vi);

/*- Measurement */

ViStatus _VI_FUNC AgXSAn_FetchYTrace(ViSession Vi, ViConstString TraceName, ViInt32 ArrayLength, ViInt32* ActualPoints, ViReal64 Amplitude[]);
ViStatus _VI_FUNC AgXSAn_ReadYTrace(ViSession Vi, ViConstString TraceName, ViInt32 MaxTimeMilliseconds, ViInt32 ArrayLength, ViInt32* ActualPoints, ViReal64 Amplitude[]);

/*- Low Level Measurement */

ViStatus _VI_FUNC AgXSAn_Abort(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_AcquisitionStatus(ViSession Vi, ViInt32* Status);
ViStatus _VI_FUNC AgXSAn_Initiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SendSoftwareTrigger(ViSession Vi);

/*- External */

ViStatus _VI_FUNC AgXSAn_TriggerExternalConfigure(ViSession Vi, ViReal64 ExternalTriggerLevel, ViInt32 ExternalTriggerSlope);

/*- External2 */

ViStatus _VI_FUNC AgXSAn_TriggerExternal2Configure(ViSession Vi, ViReal64 External2TriggerLevel, ViInt32 External2TriggerSlope);

/*- Video */

ViStatus _VI_FUNC AgXSAn_TriggerVideoConfigure(ViSession Vi, ViReal64 VideoTriggerLevel, ViInt32 VideoTriggerSlope);

/*- Frame */

ViStatus _VI_FUNC AgXSAn_TriggerFrameReset(ViSession Vi);

/*- Event Log */

ViStatus _VI_FUNC AgXSAn_IviLxiSync_ClearEventLog(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_IviLxiSync_GetNextEventLogEntry(ViSession Vi, ViInt32 LogEntryBufferSize, ViChar LogEntry[]);

/*- Time */

ViStatus _VI_FUNC AgXSAn_IviLxiSync_GetSystemTime(ViSession Vi, ViReal64* TimeSeconds, ViReal64* TimeFractional);

/*- Frequency */

ViStatus _VI_FUNC AgXSAn_FrequencyFullSpan(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_FrequencyPreviousSpan(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_FrequencyTune(ViSession Vi);

/*- Acquisition */

ViStatus _VI_FUNC AgXSAn_AcquisitionGetDetectorTrace(ViSession Vi, ViInt32 TraceNo, ViInt32* RetVal);
ViStatus _VI_FUNC AgXSAn_AcquisitionGetDetectorTraceAutoEnabled(ViSession Vi, ViInt32 TraceNo, ViBoolean* RetVal);
ViStatus _VI_FUNC AgXSAn_AcquisitionSetDetectorTrace(ViSession Vi, ViInt32 TraceNo, ViInt32 DetectorType);
ViStatus _VI_FUNC AgXSAn_AcquisitionSetDetectorTraceAutoEnabled(ViSession Vi, ViInt32 TraceNo, ViBoolean Auto);

/*- Display */

ViStatus _VI_FUNC AgXSAn_ZoomIn(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_ZoomOut(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_DisplayGetLine(ViSession Vi, ViInt32 Index, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_DisplayGetFrequencyLine(ViSession Vi, ViInt32 Index, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_DisplaySetLine(ViSession Vi, ViInt32 Index, ViReal64 Position);
ViStatus _VI_FUNC AgXSAn_DisplaySetFrequencyLine(ViSession Vi, ViInt32 Index, ViReal64 Position);
ViStatus _VI_FUNC AgXSAn_DisplayGetFrequencyLineEnabled(ViSession Vi, ViInt32 Index, ViBoolean* Val);
ViStatus _VI_FUNC AgXSAn_DisplayGetLineEnabled(ViSession Vi, ViInt32 Index, ViBoolean* Val);
ViStatus _VI_FUNC AgXSAn_DisplaySetFrequencyLineEnabled(ViSession Vi, ViInt32 Index, ViBoolean Value);
ViStatus _VI_FUNC AgXSAn_DisplaySetLineEnabled(ViSession Vi, ViInt32 Index, ViBoolean Value);
ViStatus _VI_FUNC AgXSAn_DisplayGetTimeLine(ViSession Vi, ViInt32 Index, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_DisplayGetTimeLineEnabled(ViSession Vi, ViInt32 Index, ViBoolean* Val);
ViStatus _VI_FUNC AgXSAn_DisplaySetTimeLine(ViSession Vi, ViInt32 Index, ViReal64 Position);
ViStatus _VI_FUNC AgXSAn_DisplaySetTimeLineEnabled(ViSession Vi, ViInt32 Index, ViBoolean Value);

/*- Trace */

ViStatus _VI_FUNC AgXSAn_TraceClear(ViSession Vi, ViConstString RepCapIdentifier);
ViStatus _VI_FUNC AgXSAn_TraceFetchX(ViSession Vi, ViConstString Trace, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_TraceCompress(ViSession Vi, ViConstString Trace, ViInt32 Method, ViReal64 StartOffset, ViReal64 Length, ViReal64 RepeatOffset, ViInt32 RepeatLimit, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_TraceImportTraceCSV(ViSession Vi, ViConstString Trace, ViInt32 TraceNumber, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_TraceExportTraceCSV(ViSession Vi, ViConstString Trace, ViInt32 TraceNumber, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_TracePeaks(ViSession Vi, ViConstString Trace, ViReal64 Threshold, ViReal64 Excursion, ViInt32 Sort, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);

/*- ACP */

ViStatus _VI_FUNC AgXSAn_SAACPConfigure(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAACPConfigureNoPreset(ViSession Vi);

/*- Trace */

ViStatus _VI_FUNC AgXSAn_SAACPTraceFetch(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPTraceRead(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPTraceReadSignal(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViReal64 Frequency, ViReal64 Amplitude, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Traces */

ViStatus _VI_FUNC AgXSAn_SAACPTracesAbort(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAACPTracesInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAACPTracesInitiateSignal(ViSession Vi, ViReal64 Frequency, ViReal64 Amplitude);

/*- List */

ViStatus _VI_FUNC AgXSAn_SAACPCarrierListConfigureCarrierMethod(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[], ViInt32* StateActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPCarrierListConfigureChannelSpacing(ViSession Vi, ViInt32 FrequencyDifferenceBufferSize, ViReal64 FrequencyDifference[], ViInt32* FrequencyDifferenceActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPCarrierListConfigureCouplingEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[], ViInt32* StateActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPCarrierListConfigureIntegrationBandwidth(ViSession Vi, ViInt32 BandwidthBufferSize, ViReal64 Bandwidth[], ViInt32* BandwidthActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPCarrierListConfigureMethod(ViSession Vi, ViInt32 MethodBufferSize, ViInt32 Method[], ViInt32* MethodActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPCarrierListConfigurePowerPresent(ViSession Vi, ViInt32 EnabledBufferSize, ViInt32 Enabled[], ViInt32* EnabledActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPCarrierListQueryCarrierMethod(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPCarrierListQueryChannelSpacing(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPCarrierListQueryCouplingEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPCarrierListQueryIntegrationBandwidth(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPCarrierListQueryMethod(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPCarrierListQueryPowerPresent(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_ConfigureAlphaValue(ViSession Vi, ViInt32 AlphaValuesBufferSize, ViReal64 AlphaValues[]);
ViStatus _VI_FUNC AgXSAn_SAACPCarrierListQueryAlphaValue(ViSession Vi, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);

/*- Frequency */

ViStatus _VI_FUNC AgXSAn_SAACPFrequencyFullSpan(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAACPFrequencyLastSpan(ViSession Vi);

/*- Marker */

ViStatus _VI_FUNC AgXSAn_SAACPMarkerConfigureEnabled(ViSession Vi, ViBoolean Enabled, ViInt32 Trace);
ViStatus _VI_FUNC AgXSAn_SAACPMarkerDisableAll(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAACPMarkerQuery(ViSession Vi, ViReal64* pPosition, ViReal64* pAmplitude);
ViStatus _VI_FUNC AgXSAn_SAACPMarkerSearch(ViSession Vi, ViInt32 SearchType);

/*- OffsetList */

ViStatus _VI_FUNC AgXSAn_SAACPOffsetListConfigureAbsoluteLimit(ViSession Vi, ViInt32 LimitBufferSize, ViReal64 Limit[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListConfigureEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListConfigureFrequency(ViSession Vi, ViInt32 FrequencyDifferenceBufferSize, ViReal64 FrequencyDifference[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListConfigureLowerLimit(ViSession Vi, ViInt32 LimitBufferSize, ViReal64 Limit[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListConfigureRelativeLimitCarrier(ViSession Vi, ViInt32 LimitBufferSize, ViReal64 Limit[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListConfigureRelativeLimitPSD(ViSession Vi, ViInt32 LimitBufferSize, ViReal64 Limit[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListConfigureSidebandSelection(ViSession Vi, ViInt32 SidebandBufferSize, ViInt32 Sideband[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListConfigureTest(ViSession Vi, ViInt32 TypeBufferSize, ViInt32 Type[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListConfigureUpperLimit(ViSession Vi, ViInt32 LimitBufferSize, ViReal64 Limit[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListQueryAbsoluteLimit(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListQueryEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListQueryFrequency(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListQueryLowerLimit(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListQueryRelativeLimitCarrier(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListQueryRelativeLimitPSD(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListQuerySidebandSelection(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListQueryTest(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListQueryUpperLimit(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Bandwidth */

ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthConfigureReference(ViSession Vi, ViInt32 BandwidthBufferSize, ViReal64 Bandwidth[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthConfigureResolution(ViSession Vi, ViInt32 BandwidthBufferSize, ViReal64 Bandwidth[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthConfigureResolutionAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthConfigureVideo(ViSession Vi, ViInt32 BandwidthBufferSize, ViReal64 Bandwidth[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthConfigureVideoAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthQueryReference(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthQueryResolution(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthQueryResolutionAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthQueryVideo(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthQueryVideoAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthConfigureShape(ViSession Vi, ViInt32 ShapeBufferSize, ViInt32 Shape[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthQueryShape(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthConfigureType(ViSession Vi, ViInt32 TypeBufferSize, ViInt32 Type[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListBandwidthQueryType(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);

/*- Filter */

ViStatus _VI_FUNC AgXSAn_SAACPOffsetListFilterConfigureAlpha(ViSession Vi, ViInt32 AlphaValueBufferSize, ViReal64 AlphaValue[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListFilterQueryAlpha(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListFilterConfigureEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SAACPOffsetListFilterQueryEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);

/*- BurstPower */

ViStatus _VI_FUNC AgXSAn_SABurstPowerConfigure(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SABurstPowerConfigureNoPreset(ViSession Vi);

/*- Trace */

ViStatus _VI_FUNC AgXSAn_SABurstPowerTraceFetch(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SABurstPowerTraceRead(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SABurstPowerTraceReadSignal(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViReal64 Frequency, ViReal64 Amplitude, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Traces */

ViStatus _VI_FUNC AgXSAn_SABurstPowerTracesAbort(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SABurstPowerTracesInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SABurstPowerTracesInitiateSignal(ViSession Vi, ViReal64 Frequency, ViReal64 Amplitude);

/*- Marker */

ViStatus _VI_FUNC AgXSAn_SABurstPowerMarkerDisableAll(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SABurstPowerMarkerConfigureEnabled(ViSession Vi, ViBoolean Enabled, ViInt32 Trace);
ViStatus _VI_FUNC AgXSAn_SABurstPowerMarkerQuery(ViSession Vi, ViReal64* pPosition, ViReal64* pAmplitude);
ViStatus _VI_FUNC AgXSAn_SABurstPowerMarkerSearch(ViSession Vi, ViInt32 SearchType);

/*- ChannelPower */

ViStatus _VI_FUNC AgXSAn_SAChannelPowerConfigure(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAChannelPowerConfigureNoPreset(ViSession Vi);

/*- Trace */

ViStatus _VI_FUNC AgXSAn_SAChannelPowerTraceFetch(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAChannelPowerTraceRead(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAChannelPowerTraceReadSignal(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViReal64 Frequency, ViReal64 Amplitude, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Traces */

ViStatus _VI_FUNC AgXSAn_SAChannelPowerTracesAbort(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAChannelPowerTracesInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAChannelPowerTracesInitiateSignal(ViSession Vi, ViReal64 Frequency, ViReal64 Amplitude);
ViStatus _VI_FUNC AgXSAn_SAChannelPowerTracesFetchChannelDensity(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAChannelPowerTracesFetchChannelPower(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAChannelPowerTracesReadChannelDesnsity(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAChannelPowerTracesReadChannelPower(ViSession Vi, ViReal64* Val);

/*- Frequency */

ViStatus _VI_FUNC AgXSAn_SAChannelPowerFrequencyFullSpan(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAChannelPowerFrequencyLastSpan(ViSession Vi);

/*- Marker */

ViStatus _VI_FUNC AgXSAn_SAChannelPowerMarkerDisableAll(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAChannelPowerMarkerQuery(ViSession Vi, ViReal64* pPosition, ViReal64* pAmplitude);
ViStatus _VI_FUNC AgXSAn_SAChannelPowerMarkerSearch(ViSession Vi, ViInt32 SearchType);

/*- OccupiedBandwidth */

ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthConfigure(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthConfigureNoPreset(ViSession Vi);

/*- Trace */

ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthTraceFetch(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthTraceRead(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthTraceReadSignal(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViReal64 Frequency, ViReal64 Amplitude, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Traces */

ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthTracesAbort(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthTracesInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthTracesInitiateSignal(ViSession Vi, ViReal64 Frequency, ViReal64 Amplitude);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthTracesFetchOccupiedBandWidth(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthTracesReadOccupiedBandwidth(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthTracesFetchXDB(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthTracesReadXDB(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthTracesFetchTransmitFrequencyError(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthTracesReadTransmitFrequencyError(ViSession Vi, ViReal64* Val);

/*- Frequency */

ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthFrequencyFullSpan(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthFrequencyLastSpan(ViSession Vi);

/*- Marker */

ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthMarkerDisableAll(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthMarkerQuery(ViSession Vi, ViReal64* pPosition, ViReal64* pAmplitude);
ViStatus _VI_FUNC AgXSAn_SAOccupiedBandwidthMarkerSearch(ViSession Vi, ViInt32 SearchType);

/*- PowerStatistics */

ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsConfigure(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsConfigureNoPreset(ViSession Vi);

/*- Trace */

ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsTraceFetch(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsTraceRead(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsTraceReadSignal(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViReal64 Frequency, ViReal64 Amplitude, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Traces */

ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsTracesAbort(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsTracesInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsTracesInitiateSignal(ViSession Vi, ViReal64 Frequency, ViReal64 Amplitude);
ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsTracesStoreAsReference(ViSession Vi);

/*- Display */

ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsDisplayStoreReferenceTrace(ViSession Vi);

/*- Marker */

ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsMarkerConfigureEnabled(ViSession Vi, ViBoolean Enabled, ViInt32 Trace);
ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsMarkerDisableAll(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAPowerStatisticsMarkerQuery(ViSession Vi, ViReal64* pPosition, ViReal64* pAmplitude);

/*- SEMask */

ViStatus _VI_FUNC AgXSAn_SASEMaskConfigure(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SASEMaskConfigureNoPreset(ViSession Vi);

/*- Trace */

ViStatus _VI_FUNC AgXSAn_SASEMaskTraceFetch(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskTraceRead(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskTraceReadSignal(ViSession Vi, ViConstString SASEMaskTrace, ViInt32 MaxTime, ViReal64 Frequency, ViReal64 Amplitude, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Traces */

ViStatus _VI_FUNC AgXSAn_SASEMaskTracesAbort(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SASEMaskTracesInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SASEMaskTracesInitiateSignal(ViSession Vi, ViReal64 Frequency, ViReal64 Amplitude);

/*- Marker */

ViStatus _VI_FUNC AgXSAn_SASEMaskMarkerDisableAll(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SASEMaskMarkerQuery(ViSession Vi, ViReal64* pPosition, ViReal64* pAmplitude);

/*- List */

ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListConfigureEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListQueryEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListConfigureSidebandSelection(ViSession Vi, ViInt32 SidebandBufferSize, ViInt32 Sideband[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListQuerySidebandSelection(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListConfigureRelativeAttenuation(ViSession Vi, ViInt32 AttenuationValueBufferSize, ViReal64 AttenuationValue[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListQueryRelativeAttenuation(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListConfigureSweepTime(ViSession Vi, ViInt32 SweepTimeBufferSize, ViReal64 SweepTime[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListQuerySweepTime(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListConfigureSweepTimeAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListQuerySweepTimeAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListConfigureTest(ViSession Vi, ViInt32 TypeBufferSize, ViInt32 Type[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListQueryTest(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetSweepType(ViSession Vi, ViInt32 ValBufferSize, ViInt32 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListConfigureSweepType(ViSession Vi, ViInt32 SweepTypeBufferSize, ViInt32 SweepType[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListConfigureSweepTypeAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListQuerySweepTypeAutoEnabled(ViSession Vi, ViInt32 ValBufferSize, ViBoolean Val[], ViInt32* ValActualSize);

/*- Bandwidth */

ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthConfigureMeasurementMultiplier(ViSession Vi, ViInt32 MultiplierValueBufferSize, ViInt32 MultiplierValue[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthQueryMeasurementMultiplier(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthConfigureResolution(ViSession Vi, ViInt32 BandwidthBufferSize, ViReal64 Bandwidth[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthQueryResolution(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthConfigureResolutionAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthConfigureVideo(ViSession Vi, ViInt32 BandwidthBufferSize, ViReal64 Bandwidth[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthConfigureVideoAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthQueryResolutionAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthQueryVideo(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthQueryVideoAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthConfigureRatio(ViSession Vi, ViInt32 RatioValueBufferSize, ViReal64 RatioValue[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthQueryRatio(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthConfigureRatioAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListBandwidthQueryRatioAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);

/*- Start */

ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStartConfigureAbsoluteAmplitudeLimit(ViSession Vi, ViInt32 LimitBufferSize, ViReal64 Limit[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStartConfigureRelativeAmplitudeLimit(ViSession Vi, ViInt32 LimitBufferSize, ViReal64 Limit[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStartQueryAbsoluteAmplitudeLimit(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStartQueryRelativeAmplitudeLimit(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStartConfigureFrequency(ViSession Vi, ViInt32 FrequencyBufferSize, ViReal64 Frequency[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStartQueryFrequency(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Stop */

ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStopConfigureAbsoluteAmplitudeLimit(ViSession Vi, ViInt32 LimitBufferSize, ViReal64 Limit[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStopConfigureFrequency(ViSession Vi, ViInt32 FrequencyBufferSize, ViReal64 Frequency[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStopConfigureRelativeAmplitudeLimit(ViSession Vi, ViInt32 LimitBufferSize, ViReal64 Limit[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStopQueryAbsoluteAmplitudeLimit(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStopQueryFrequency(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStopQueryRelativeAmplitudeLimit(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStopConfigureRelativeAmplitudeLimitAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStopQueryRelativeAmplitudeLimitAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStopConfigureAbsoluteAmplitudeLimitCoupleEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASEMaskOffsetListStopQueryAbsoluteAmplitudeLimitCoupleEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);

/*- SpuriousEmissions */

ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsConfigure(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsConfigureIFGainState(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsQueryIFGainState(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsConfigureIFGainAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsQueryIFGainAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsConfigureNoPreset(ViSession Vi);

/*- Trace */

ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsTraceFetch(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsTraceRead(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsTraceReadSignal(ViSession Vi, ViConstString SASpuriousEmissionsTrace, ViInt32 MaxTime, ViReal64 Frequency, ViReal64 Amplitude, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Traces */

ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsTracesAbort(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsTracesInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsTracesInitiateSignal(ViSession Vi, ViReal64 Frequency, ViReal64 Amplitude);

/*- Marker */

ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsMarkerConfigureEnabled(ViSession Vi, ViBoolean Enabled, ViInt32 Trace);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsMarkerDisableAll(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsMarkerQuery(ViSession Vi, ViReal64* pPosition, ViReal64* pAmplitude);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsMarkerSearch(ViSession Vi, ViInt32 SearchType);

/*- RangeTable */

ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableConfigureAttenuation(ViSession Vi, ViInt32 AttenuationValueBufferSize, ViReal64 AttenuationValue[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableQueryAttenuation(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableConfigurePeakExcursion(ViSession Vi, ViInt32 RelativeAmplitudeBufferSize, ViReal64 RelativeAmplitude[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableQueryPeakExcursion(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableConfigurePeakThreshold(ViSession Vi, ViInt32 ThresholdBufferSize, ViReal64 Threshold[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableQueryPeakThreshold(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableConfigureSweepTime(ViSession Vi, ViInt32 SweepTimeBufferSize, ViReal64 SweepTime[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableConfigureSweepTimeAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableQuerySweepTime(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableQuerySweepTimeAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableConfigureSweepPoints(ViSession Vi, ViInt32 SweepPointsBufferSize, ViInt32 SweepPoints[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableQuerySweepPoints(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableConfigureSweepPointsAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableQuerySweepPointsAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableConfigureEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableQueryEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableConfigureSweepTimeAutoRules(ViSession Vi, ViInt32 AutoRulesBufferSize, ViInt32 AutoRules[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableQuerySweepTimeAutoRules(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableConfigureAttenuationAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableQueryAttenuationAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableConfigureDetector1(ViSession Vi, ViInt32 DetectorBufferSize, ViInt32 Detector[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableQueryDetector1(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableConfigureDetector2(ViSession Vi, ViInt32 DetectorBufferSize, ViInt32 Detector[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableQueryDetector2(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);

/*- Start */

ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableStartConfigureAbsoluteAmplitudeLimit(ViSession Vi, ViInt32 LimitBufferSize, ViReal64 Limit[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableStartConfigureFrequency(ViSession Vi, ViInt32 FrequencyBufferSize, ViReal64 Frequency[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableStartQueryAbsoluteAmplitudeLimit(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableStartQueryFrequency(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Stop */

ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableStopConfigureAbsoluteAmplitudeLimit(ViSession Vi, ViInt32 LimitBufferSize, ViReal64 Limit[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableStopConfigureFrequency(ViSession Vi, ViInt32 FrequencyBufferSize, ViReal64 Frequency[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableStopQueryAbsoluteAmplitudeLimit(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableStopQueryFrequency(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableStopConfigureAbsoluteAmplitudeLimitAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableStopQueryAbsoluteAmplitudeLimitAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);

/*- Bandwidth */

ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableBandwidthConfigureResolution(ViSession Vi, ViInt32 BandwidthBufferSize, ViReal64 Bandwidth[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableBandwidthConfigureResolutionAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableBandwidthConfigureShape(ViSession Vi, ViInt32 ShapeBufferSize, ViInt32 Shape[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableBandwidthConfigureVideo(ViSession Vi, ViInt32 BandwidthBufferSize, ViReal64 Bandwidth[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableBandwidthConfigureVideoAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableBandwidthQueryResolution(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableBandwidthQueryResolutionAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableBandwidthQueryShape(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableBandwidthQueryVideo(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SASpuriousEmissionsRangeTableBandwidthQueryVideoAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);

/*- HarmonicDistortion */

ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionConfigure(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionConfigureNoPreset(ViSession Vi);

/*- Trace */

ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTraceFetch(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTraceRead(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTraceReadSignal(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViReal64 Frequency, ViReal64 Amplitude, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Traces */

ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesAbort(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesInitiateSignal(ViSession Vi, ViReal64 Frequency, ViReal64 Amplitude);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesFetchAmplitudeAll(ViSession Vi, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesReadAmplitudeAll(ViSession Vi, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesFetchAmplitude(ViSession Vi, ViInt32 Harmonic, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesReadAmplitude(ViSession Vi, ViInt32 Harmonic, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesFetchFrequencyAll(ViSession Vi, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesReadFrequencyAll(ViSession Vi, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesFetchFrequency(ViSession Vi, ViInt32 Harmonic, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesReadFrequency(ViSession Vi, ViInt32 Harmonic, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesFetchFundamentalFrequency(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesReadFundamentalFrequency(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesFetchHarmonicDistortion(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionTracesReadHarmonicDistortion(ViSession Vi, ViReal64* Val);

/*- RangeTable */

ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableAutoFill(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableConfigureSweepTime(ViSession Vi, ViInt32 SweepTimeBufferSize, ViReal64 SweepTime[]);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableConfigureSweepTimeAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableQuerySweepTime(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableQuerySweepTimeAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableConfigureFrequency(ViSession Vi, ViInt32 FrequencyBufferSize, ViReal64 Frequency[]);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableQueryFrequency(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableConfigureToneEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableQueryToneEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableConfigureSpan(ViSession Vi, ViInt32 SpanBufferSize, ViReal64 Span[]);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableQuerySpan(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Bandwidth */

ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableBandwidthConfigureResolution(ViSession Vi, ViInt32 BandwidthBufferSize, ViReal64 Bandwidth[]);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableBandwidthConfigureResolutionAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableBandwidthConfigureVideo(ViSession Vi, ViInt32 BandwidthBufferSize, ViReal64 Bandwidth[]);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableBandwidthConfigureVideoAutoEnabled(ViSession Vi, ViInt32 StateBufferSize, ViBoolean State[]);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableBandwidthQueryResolution(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableBandwidthQueryResolutionAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableBandwidthQueryVideo(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionRangeTableBandwidthQueryVideoAutoEnabled(ViSession Vi, ViInt32 RetValBufferSize, ViBoolean RetVal[], ViInt32* RetValActualSize);

/*- Tone */

ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneConfigureEnabled(ViSession Vi, ViInt32 HarmonicNumber, ViBoolean State);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneQueryEnabled(ViSession Vi, ViInt32 HarmonicNumber, ViBoolean* RetVal);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneConfigureSweepTime(ViSession Vi, ViInt32 HarmonicNumber, ViReal64 SweepTime);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneQuerySweepTime(ViSession Vi, ViInt32 HarmonicNumber, ViReal64* RetVal);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneConfigureSweepTimeAutoEnabled(ViSession Vi, ViInt32 HarmonicNumber, ViBoolean State);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneQuerySweepTimeAutoEnabled(ViSession Vi, ViInt32 HarmonicNumber, ViBoolean* RetVal);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneConfigureSpan(ViSession Vi, ViInt32 HarmonicNumber, ViReal64 Span);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneQuerySpan(ViSession Vi, ViInt32 HarmonicNumber, ViReal64* RetVal);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneConfigureFrequency(ViSession Vi, ViInt32 HarmonicNumber, ViReal64 Frequency);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneQueryFrequency(ViSession Vi, ViInt32 HarmonicNumber, ViReal64* RetVal);

/*- Bandwidth */

ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneBandwidthConfigureResolutionAutoEnabled(ViSession Vi, ViInt32 HarmonicNumber, ViBoolean State);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneBandwidthConfigureResolution(ViSession Vi, ViInt32 HarmonicNumber, ViReal64 Bandwidth);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneBandwidthQueryResolutionAutoEnabled(ViSession Vi, ViInt32 HarmonicNumber, ViBoolean* RetVal);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneBandwidthQueryResolution(ViSession Vi, ViInt32 HarmonicNumber, ViReal64* RetVal);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneBandwidthConfigureVideoAutoEnabled(ViSession Vi, ViInt32 HarmonicNumber, ViBoolean State);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneBandwidthQueryVideoAutoEnabled(ViSession Vi, ViInt32 HarmonicNumber, ViBoolean* RetVal);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneBandwidthConfigureVideo(ViSession Vi, ViInt32 HarmonicNumber, ViReal64 Bandwidth);
ViStatus _VI_FUNC AgXSAn_SAHarmonicDistortionToneBandwidthQueryVideo(ViSession Vi, ViInt32 HarmonicNumber, ViReal64* RetVal);

/*- ThirdOrderIntercept */

ViStatus _VI_FUNC AgXSAn_SAThirdOrderInterceptConfigure(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAThirdOrderInterceptAutoTune(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAThirdOrderInterceptConfigureNoPreset(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAThirdOrderInterceptFetchInterceptPower(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAThirdOrderInterceptReadInterceptPower(ViSession Vi, ViReal64* Val);

/*- Trace */

ViStatus _VI_FUNC AgXSAn_SAThirdOrderInterceptTraceFetch(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAThirdOrderInterceptTraceRead(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAThirdOrderInterceptTraceReadSignal(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 MaxTime, ViReal64 Frequency, ViReal64 Amplitude, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Traces */

ViStatus _VI_FUNC AgXSAn_SAThirdOrderInterceptTracesAbort(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAThirdOrderInterceptTracesInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAThirdOrderInterceptTracesInitiateSignal(ViSession Vi, ViReal64 Frequency, ViReal64 Amplitude);

/*- Limit */

ViStatus _VI_FUNC AgXSAn_SALimitBuildFromExisting(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 SourceTraceNumber);
ViStatus _VI_FUNC AgXSAn_SALimitConfigureData(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 DataArrayBufferSize, ViReal64 DataArray[]);
ViStatus _VI_FUNC AgXSAn_SALimitCopy(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 SourceLineNumber);
ViStatus _VI_FUNC AgXSAn_SALimitDelete(ViSession Vi, ViConstString RepCapIdentifier);
ViStatus _VI_FUNC AgXSAn_SALimitMergeData(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 DataArrayBufferSize, ViReal64 DataArray[]);
ViStatus _VI_FUNC AgXSAn_SALimitQueryData(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SALimitUpdateOffsets(ViSession Vi, ViConstString RepCapIdentifier);

/*- Limits */

ViStatus _VI_FUNC AgXSAn_SALimitsDeleteAll(ViSession Vi);

/*- ListSweep */

ViStatus _VI_FUNC AgXSAn_SAListSweepAbort(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAListSweepConfigure(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAListSweepConfigureNoPreset(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAListSweepFetch(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAListSweepInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAListSweepMeasure(ViSession Vi, ViInt32 MaxTime, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAListSweepRead(ViSession Vi, ViInt32 MaxTime, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAListSweepConfigureParameters(ViSession Vi, ViBoolean PeakMeasurementEnabled, ViBoolean RMSMeasurementEnabled, ViBoolean AveragingMeasurementEnabled, ViInt32 TriggerSource, ViInt32 TriggerSlope, ViReal64 TriggerOffset, ViReal64 GateLength);

/*- Bandwidth */

ViStatus _VI_FUNC AgXSAn_SAListSweepBandwidthConfigureResolution(ViSession Vi, ViInt32 BandwidthBufferSize, ViReal64 Bandwidth[]);
ViStatus _VI_FUNC AgXSAn_SAListSweepBandwidthConfigureVideo(ViSession Vi, ViInt32 BandwidthBufferSize, ViReal64 Bandwidth[]);
ViStatus _VI_FUNC AgXSAn_SAListSweepBandwidthQueryResolution(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAListSweepBandwidthQueryVideo(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAListSweepBandwidthConfigureResolutionShape(ViSession Vi, ViInt32 ShapeBufferSize, ViInt32 Shape[]);
ViStatus _VI_FUNC AgXSAn_SAListSweepBandwidthQueryResolutionShape(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);

/*- Frequency */

ViStatus _VI_FUNC AgXSAn_SAListSweepFrequencyConfigure(ViSession Vi, ViInt32 FrequencyBufferSize, ViReal64 Frequency[]);
ViStatus _VI_FUNC AgXSAn_SAListSweepFrequencyQuery(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Sequence */

ViStatus _VI_FUNC AgXSAn_SAListSweepSequenceConfigure(ViSession Vi, ViInt32 SequenceBufferSize, ViReal64 Sequence[]);
ViStatus _VI_FUNC AgXSAn_SAListSweepSequenceQuery(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Trigger */

ViStatus _VI_FUNC AgXSAn_SAListSweepTriggerConfigureDelay(ViSession Vi, ViInt32 TimeBufferSize, ViReal64 Time[]);
ViStatus _VI_FUNC AgXSAn_SAListSweepTriggerConfigureHoldoff(ViSession Vi, ViInt32 TimeBufferSize, ViReal64 Time[]);
ViStatus _VI_FUNC AgXSAn_SAListSweepTriggerConfigureLevel(ViSession Vi, ViInt32 AmplitudeBufferSize, ViReal64 Amplitude[]);
ViStatus _VI_FUNC AgXSAn_SAListSweepTriggerQueryDelay(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAListSweepTriggerQueryHoldoff(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAListSweepTriggerQueryLevel(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Time */

ViStatus _VI_FUNC AgXSAn_SAListSweepTimeConfigure(ViSession Vi, ViInt32 TimeBufferSize, ViReal64 Time[]);
ViStatus _VI_FUNC AgXSAn_SAListSweepTimeQuery(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Detector */

ViStatus _VI_FUNC AgXSAn_SAListSweepDetectorConfigure(ViSession Vi, ViInt32 DetectorTypeBufferSize, ViInt32 DetectorType[]);
ViStatus _VI_FUNC AgXSAn_SAListSweepDetectorQuery(ViSession Vi, ViInt32 RetValBufferSize, ViInt32 RetVal[], ViInt32* RetValActualSize);

/*- Attenuation */

ViStatus _VI_FUNC AgXSAn_SAListSweepAttenuationConfigureElectronic(ViSession Vi, ViInt32 PowerBufferSize, ViReal64 Power[]);
ViStatus _VI_FUNC AgXSAn_SAListSweepAttenuationConfigureMechanical(ViSession Vi, ViInt32 PowerBufferSize, ViReal64 Power[]);
ViStatus _VI_FUNC AgXSAn_SAListSweepAttenuationQueryElectronic(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_SAListSweepAttenuationQueryMechanical(ViSession Vi, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);

/*- Marker */

ViStatus _VI_FUNC AgXSAn_SAMarkerConfigureEnabled(ViSession Vi, ViBoolean Enabled, ViInt32 Trace);
ViStatus _VI_FUNC AgXSAn_SAMarkerConfigureSearch(ViSession Vi, ViReal64 PeakExcursion, ViReal64 MarkerThreshold);
ViStatus _VI_FUNC AgXSAn_SAMarkerDisableAll(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SAMarkerMakeDelta(ViSession Vi, ViBoolean DeltaMarker);
ViStatus _VI_FUNC AgXSAn_SAMarkerQuery(ViSession Vi, ViReal64* MarkerPosition, ViReal64* MarkerAmplitude);
ViStatus _VI_FUNC AgXSAn_SAMarkerQueryReference(ViSession Vi, ViReal64* ReferencePosition, ViReal64* ReferenceAmplitude);
ViStatus _VI_FUNC AgXSAn_SAMarkerSearch(ViSession Vi, ViInt32 SearchType);
ViStatus _VI_FUNC AgXSAn_SAMarkerSetInstrumentFromMarker(ViSession Vi, ViInt32 InstrumentSetting);

/*- FrequencyCounter */

ViStatus _VI_FUNC AgXSAn_SAMarkerFrequencyCounterQueryCount(ViSession Vi, ViReal64* RetVal);

/*- MeasureAtMarker */

ViStatus _VI_FUNC AgXSAn_SAMarkerMeasureAtMarkerConfigureDetectorType(ViSession Vi, ViInt32 DetectorIdentifier, ViInt32 DetectorType);
ViStatus _VI_FUNC AgXSAn_SAMarkerMeasureAtMarkerQueryDetectorType(ViSession Vi, ViInt32 DetectorIdentifier, ViInt32* Val);
ViStatus _VI_FUNC AgXSAn_SAMarkerMeasureAtMarkeConfigureDetectorDwellTime(ViSession Vi, ViInt32 DetectorIdentifier, ViReal64 DwellTime);
ViStatus _VI_FUNC AgXSAn_SAMarkerMeasureAtMarkeQueryDetectorDwellTime(ViSession Vi, ViInt32 DetectorIdentifier, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SAMarkerMeasureAtMarkerRead(ViSession Vi, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);

/*- SweptSA */

ViStatus _VI_FUNC AgXSAn_SASweptSAFetch(ViSession Vi, ViConstString SASweptSA, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SASweptSAMeasure(ViSession Vi, ViConstString SASweptSA, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SASweptSARead(ViSession Vi, ViConstString SASweptSA, ViInt32 MaxTime, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);

/*- SweptSAs */

ViStatus _VI_FUNC AgXSAn_SASweptSAsInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SASweptSAsConfigureNoPreset(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SASweptSAsConfigure(ViSession Vi);

/*- Source */

ViStatus _VI_FUNC AgXSAn_SASourcePreset(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SASourceGetSourceSettings(ViSession Vi, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);

/*- Level */

ViStatus _VI_FUNC AgXSAn_SASourceLevelSetTrackingPeak(ViSession Vi);

/*- StateTrigger */

ViStatus _VI_FUNC AgXSAn_StateTriggerConfigure(ViSession Vi, ViConstString RepCapIdentifier, ViBoolean Enabled, ViInt32 Detection, ViConstString Filter, ViConstString Identifier);
ViStatus _VI_FUNC AgXSAn_StateTriggerDisableAllTriggerSources(ViSession Vi, ViConstString RepCapIdentifier);
ViStatus _VI_FUNC AgXSAn_StateTriggerRemoveAllCustomStateTriggerSources(ViSession Vi, ViConstString RepCapIdentifier);

/*- System */

ViStatus _VI_FUNC AgXSAn_SystemDisableLocalControls(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SystemEnableLocalControls(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SystemGetScreenImage(ViSession Vi, ViInt32 ImageBufferSize, ViByte Image[], ViInt32* ImageActualSize);
ViStatus _VI_FUNC AgXSAn_SystemGetState(ViSession Vi, ViInt32 pDataBufferSize, ViByte pData[], ViInt32* pDataActualSize);
ViStatus _VI_FUNC AgXSAn_SystemPutState(ViSession Vi, ViInt32 DataBufferSize, ViByte Data[]);
ViStatus _VI_FUNC AgXSAn_SystemRecallState(ViSession Vi, ViConstString Identifier);
ViStatus _VI_FUNC AgXSAn_SystemSaveState(ViSession Vi, ViConstString Identifier);
ViStatus _VI_FUNC AgXSAn_SystemWaitForOperationComplete(ViSession Vi, ViInt32 MaxTimeMilliseconds);
ViStatus _VI_FUNC AgXSAn_SystemReadBytes(ViSession Vi, ViInt32 ValBufferSize, ViByte Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SystemReadString(ViSession Vi, ViInt32 ValBufferSize, ViChar Val[]);
ViStatus _VI_FUNC AgXSAn_SystemWriteBytes(ViSession Vi, ViInt32 BufferBufferSize, ViByte Buffer[]);
ViStatus _VI_FUNC AgXSAn_SystemWriteString(ViSession Vi, ViConstString Data);
ViStatus _VI_FUNC AgXSAn_SystemClearIO(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_viRead(ViSession Vi, ViInt64 BufferSize, ViByte Buffer[], ViInt64* ReturnCount);
ViStatus _VI_FUNC AgXSAn_viWrite(ViSession Vi, ViInt64 Count, ViByte Buffer[], ViInt64* ReturnCount);
ViStatus _VI_FUNC AgXSAn_SystemModePreset(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SystemUserPresetAllModes(ViSession Vi);

/*- RF */

ViStatus _VI_FUNC AgXSAn_InputRFRangeOptimize(ViSession Vi);

/*- Correction */

ViStatus _VI_FUNC AgXSAn_InputRFCorrectionConfigureData(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 DataArrayBufferSize, ViReal64 DataArray[]);
ViStatus _VI_FUNC AgXSAn_InputRFCorrectionDelete(ViSession Vi, ViConstString RepCapIdentifier);
ViStatus _VI_FUNC AgXSAn_InputRFCorrectionMergeData(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 DataArrayBufferSize, ViReal64 DataArray[]);
ViStatus _VI_FUNC AgXSAn_InputRFCorrectionQueryData(ViSession Vi, ViConstString RepCapIdentifier, ViInt32 RetValBufferSize, ViReal64 RetVal[], ViInt32* RetValActualSize);
ViStatus _VI_FUNC AgXSAn_Copy(ViSession Vi, ViConstString InputRFCorrection, ViInt32 DestinationCorrectionSet);

/*- Corrections */

ViStatus _VI_FUNC AgXSAn_InputRFCorrectionsDeleteAll(ViSession Vi);

/*- Calibration */

ViStatus _VI_FUNC AgXSAn_CalibrationCalibrate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_CalibrateExpiredAlignment(ViSession Vi, ViBoolean* Val);

/*- RFPreselector */

ViStatus _VI_FUNC AgXSAn_CalibrationRFPreselectorCalibrateConductedBand(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_CalibrationRFPreselectorCalibrateRadiatedBand(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_CalibrationRFPreselectorCalibrateFullBand(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_CalibrationRFPreselectorQueryAlignConductedBandTimestamp(ViSession Vi, ViInt32 ValBufferSize, ViChar Val[]);
ViStatus _VI_FUNC AgXSAn_CalibrationRFPreselectorQueryAlignRadiatedBandTimestamp(ViSession Vi, ViInt32 ValBufferSize, ViChar Val[]);
ViStatus _VI_FUNC AgXSAn_CalibrationRFPreselectorQueryAlignConductedBandTemprature(ViSession Vi, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_CalibrationRFPreselectorQueryAlignRadiatedBandTemprature(ViSession Vi, ViReal64* Val);

/*- MemoryOperation */

ViStatus _VI_FUNC AgXSAn_MemoryOperationQueryDirectoryCatalog(ViSession Vi, ViConstString FileName, ViInt32 ValBufferSize, ViChar Val[]);
ViStatus _VI_FUNC AgXSAn_MemoryOperationSetStorageDirectory(ViSession Vi, ViInt32 DirectoryPathBufferSize, ViConstString DirectoryPath);
ViStatus _VI_FUNC AgXSAn_MemoryOperationQueryStorageDirectory(ViSession Vi, ViInt32 ValBufferSize, ViChar Val[]);
ViStatus _VI_FUNC AgXSAn_MemoryOperationCopy(ViSession Vi, ViInt32 SourcePathBufferSize, ViConstString SourcePath, ViInt32 DestinationPathBufferSize, ViConstString DestinationPath);
ViStatus _VI_FUNC AgXSAn_MemoryOperationDelete(ViSession Vi, ViInt32 FilenameBufferSize, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationLoadCorrectionFileData(ViSession Vi, ViInt32 CorrectionIdentifier, ViInt32 FilenameBufferSize, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationLoadLimitFileData(ViSession Vi, ViInt32 LimitLineIdentifier, ViInt32 FilenameBufferSize, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationRecallState(ViSession Vi, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationRecallTraceFromTraceFile(ViSession Vi, ViInt32 TraceNumber, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationRecallTraceFromRegister(ViSession Vi, ViInt32 TraceNumber, ViInt32 RegisterIdentifier);
ViStatus _VI_FUNC AgXSAn_MemoryOperationCreateStorageDirectory(ViSession Vi, ViConstString DirectoryPath);
ViStatus _VI_FUNC AgXSAn_MemoryOperationMove(ViSession Vi, ViConstString SourcePath, ViConstString DestinationPath);
ViStatus _VI_FUNC AgXSAn_MemoryOperationRemoveStorageDirectory(ViSession Vi, ViConstString DirectoryPath);
ViStatus _VI_FUNC AgXSAn_MemoryOperationStoreCorrectionDataToFile(ViSession Vi, ViInt32 CorrectionIdentifier, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationStoreLimitDataToFile(ViSession Vi, ViInt32 LimitLineIdentifier, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationStoreMeasurementResultsToFile(ViSession Vi, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationStoreMarkerTableToFile(ViSession Vi, ViInt32 FilenameBufferSize, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationStorePeakTableToFile(ViSession Vi, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationStoreScreenImageToFile(ViSession Vi, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationStoreState(ViSession Vi, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationStoreTraceToTraceFile(ViSession Vi, ViInt32 TraceNumber, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_MemoryOperationStoreTraceToRegister(ViSession Vi, ViInt32 TraceNumber, ViInt32 RegisterIdentifier);

/*- Traces */

ViStatus _VI_FUNC AgXSAn_TracesInitiateSignal(ViSession Vi, ViConstString Trace, ViReal64 Frequency, ViReal64 Amplitude, ViReal64 Span);
ViStatus _VI_FUNC AgXSAn_TracesClearAverage(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_TracesClearAll(ViSession Vi);

/*- Math */

ViStatus _VI_FUNC AgXSAn_TracesConfigureFunctions(ViSession Vi, ViConstString Trace, ViInt32 Destination, ViInt32 Function, ViInt32 Operand1, ViInt32 Operand2, ViReal64 LogOffset, ViReal64 LogDifferenceReference);

/*- Status */

ViStatus _VI_FUNC AgXSAn_StatusClear(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_StatusConfigureServiceRequest(ViSession Vi, ViInt32 Reason);
ViStatus _VI_FUNC AgXSAn_StatusPreset(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_Status_GetRegister(ViSession Vi, ViInt32 Register, ViInt32 SubRegister, ViInt32* RetVal);
ViStatus _VI_FUNC AgXSAn_Status_SetRegister(ViSession Vi, ViInt32 Register, ViInt32 SubRegister, ViInt32 Val);
ViStatus _VI_FUNC AgXSAn_StatusGetRegister(ViSession Vi, ViInt32 Register, ViInt16* Val);
ViStatus _VI_FUNC AgXSAn_StatusSetRegister(ViSession Vi, ViInt32 Register, ViInt16 Value);

/*- Arb */

ViStatus _VI_FUNC AgXSAn_SSDigitalModulationArbClearAllFileHeader(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SSDigitalModulationArbQueryCatalog(ViSession Vi, ViReal64* MemoryUsed, ViReal64* MemoryFree, ViInt32* NumberOfFiles, ViInt32 WaveformListBufferSize, ViChar WaveformList[]);
ViStatus _VI_FUNC AgXSAn_SSDigitalModulationArbDelete(ViSession Vi, ViConstString Filename);
ViStatus _VI_FUNC AgXSAn_SSDigitalModulationArbDeleteAll(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SSDigitalModulationArbSetMarkerPolarity(ViSession Vi, ViInt32 MarkerIndex, ViInt32 MarkerPolarity);
ViStatus _VI_FUNC AgXSAn_SSDigitalModulationArbGetMarkerPolarity(ViSession Vi, ViInt32 MarkerIndex, ViInt32* Val);
ViStatus _VI_FUNC AgXSAn_SSDigitalModulationArbCalculateRMS(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SSDigitalModulationArbInitiateTrigger(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SSDigitalModulationArbGetHeaderDescription(ViSession Vi, ViInt32 ValBufferSize, ViChar Val[]);
ViStatus _VI_FUNC AgXSAn_SSDigitalModulationArbSaveHeader(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SSDigitalModulationArbQueryLockedWaveformList(ViSession Vi, ViInt32 ListType, ViInt32 ValBufferSize, ViChar Val[]);

/*- ListSequencer */

ViStatus _VI_FUNC AgXSAn_SSListSequencerInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SSListSequencerConfigure(ViSession Vi, ViInt32 StepIndex, ViInt32 TriggerType, ViReal64 TransitionTime, ViInt32 RadioBand, ViInt32 Link, ViReal64 Frequency, ViReal64 Amplitude, ViConstString Waveform, ViInt32 StepDuration, ViInt32 Count, ViBoolean OutputTriggerEnabled, ViReal64 Time);
ViStatus _VI_FUNC AgXSAn_SSListSequencerIsArmed(ViSession Vi, ViBoolean* Val);
ViStatus _VI_FUNC AgXSAn_SSListSequencerQueryConfiguration(ViSession Vi, ViInt32 StepIndex, ViInt32* TriggerType, ViReal64* TransitionTime, ViInt32* RadioBand, ViInt32* Link, ViReal64* Frequency, ViReal64* Amplitude, ViInt32 WaveformBufferSize, ViChar Waveform[], ViInt32* StepDuration, ViReal64* Time, ViInt32* Count, ViBoolean* OutputTriggerEnabled);

/*- Setup */

ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListPower(ViSession Vi, ViInt32 PowerBufferSize, ViReal64 Power[]);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupClearList(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListFrequency(ViSession Vi, ViInt32 FrequencyBufferSize, ViReal64 Frequency[]);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListDurationTime(ViSession Vi, ViInt32 TimeBufferSize, ViReal64 Time[]);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListDurationTime(ViSession Vi, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListDurationType(ViSession Vi, ViInt32 DurationTypeBufferSize, ViInt32 DurationType[]);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListDurationType(ViSession Vi, ViInt32 ValBufferSize, ViInt32 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListRadioBand(ViSession Vi, ViInt32 RadioBandBufferSize, ViInt32 RadioBand[]);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListRadioBand(ViSession Vi, ViInt32 ValBufferSize, ViInt32 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListRadioBandLink(ViSession Vi, ViInt32 LinkBufferSize, ViInt32 Link[]);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListRadioBandLink(ViSession Vi, ViInt32 ValBufferSize, ViInt32 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListStepDurationTime(ViSession Vi, ViInt32 StepIndex, ViReal64 Time);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListStepDurationType(ViSession Vi, ViInt32 StepIndex, ViInt32 StepDuartionType);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListStepFrequency(ViSession Vi, ViInt32 StepIndex, ViReal64 Frequency);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListStepRadioBand(ViSession Vi, ViInt32 StepIndex, ViInt32 RadioBand);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListStepRadioBandLink(ViSession Vi, ViInt32 StepIndex, ViInt32 Link);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListStepTransitionTime(ViSession Vi, ViInt32 StepIndex, ViReal64 TranisitionTime);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupConfigureListStepWaveform(ViSession Vi, ViInt32 StepIndex, ViConstString Waveform);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListFrequency(ViSession Vi, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListPower(ViSession Vi, ViInt32 ValBufferSize, ViReal64 Val[], ViInt32* ValActualSize);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListStepDurationTime(ViSession Vi, ViInt32 StepIndex, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListStepDurationType(ViSession Vi, ViInt32 StepIndex, ViInt32* Val);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListStepFrequency(ViSession Vi, ViInt32 StepIndex, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListStepRadioBand(ViSession Vi, ViInt32 StepIndex, ViInt32* Val);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListStepRadioBandLink(ViSession Vi, ViInt32 StepIndex, ViInt32* Val);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListStepTransitionTime(ViSession Vi, ViInt32 StepIndex, ViReal64* Val);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupQueryListStepWaveform(ViSession Vi, ViInt32 StepIndex, ViInt32 ValBufferSize, ViChar Val[]);

/*- Trigger */

ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupTriggerInitiate(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupTriggerConfigureStepInputTriggerType(ViSession Vi, ViInt32 StepIndex, ViInt32 TriggerType);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupTriggerQueryStepInputTriggerType(ViSession Vi, ViInt32 StepIndex, ViInt32* Val);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupTriggerConfigureDataMarker(ViSession Vi, ViInt32 DataMarker);
ViStatus _VI_FUNC AgXSAn_SSListSequencerSetupTriggerQueryDataMarker(ViSession Vi, ViInt32* Val);

/*- RFGenerator */

ViStatus _VI_FUNC AgXSAn_SSRFGeneratorSetReferenceFrequency(ViSession Vi);
ViStatus _VI_FUNC AgXSAn_SSRFGeneratorConfigure(ViSession Vi, ViReal64 Frequency, ViReal64 PowerLevel);

/*- Digital */

ViStatus _VI_FUNC AgXSAn_SSRFGeneratorModulationDigitalConfigureModulationFormatTestPattern(ViSession Vi, ViInt32 ModulationType, ViInt32 TestPattern);
ViStatus _VI_FUNC AgXSAn_SSRFGeneratorModulationDigitalQueryModulationFormatTestPattern(ViSession Vi, ViInt32* ModulationType, ViInt32* TestPattern);


/**************************************************************************** 
 *----------------- Instrument Error And Completion Codes ------------------* 
 ****************************************************************************/
#ifndef _IVIC_ERROR_BASE_DEFINES_
#define _IVIC_ERROR_BASE_DEFINES_

#define IVIC_WARN_BASE                           (0x3FFA0000L)
#define IVIC_CROSS_CLASS_WARN_BASE               (IVIC_WARN_BASE + 0x1000)
#define IVIC_CLASS_WARN_BASE                     (IVIC_WARN_BASE + 0x2000)
#define IVIC_SPECIFIC_WARN_BASE                  (IVIC_WARN_BASE + 0x4000)

#define IVIC_ERROR_BASE                          (0xBFFA0000L)
#define IVIC_CROSS_CLASS_ERROR_BASE              (IVIC_ERROR_BASE + 0x1000)
#define IVIC_CLASS_ERROR_BASE                    (IVIC_ERROR_BASE + 0x2000)
#define IVIC_SPECIFIC_ERROR_BASE                 (IVIC_ERROR_BASE + 0x4000)
#define IVIC_LXISYNC_ERROR_BASE                  (IVIC_ERROR_BASE + 0x2000)

#endif


#define AGXSAN_ERROR_CANNOT_RECOVER                         (IVIC_ERROR_BASE + 0x0000)
#define AGXSAN_ERROR_INSTRUMENT_STATUS                      (IVIC_ERROR_BASE + 0x0001)
#define AGXSAN_ERROR_CANNOT_OPEN_FILE                       (IVIC_ERROR_BASE + 0x0002)
#define AGXSAN_ERROR_READING_FILE                           (IVIC_ERROR_BASE + 0x0003)
#define AGXSAN_ERROR_WRITING_FILE                           (IVIC_ERROR_BASE + 0x0004)
#define AGXSAN_ERROR_INVALID_PATHNAME                       (IVIC_ERROR_BASE + 0x000B)
#define AGXSAN_ERROR_INVALID_VALUE                          (IVIC_ERROR_BASE + 0x0010)
#define AGXSAN_ERROR_FUNCTION_NOT_SUPPORTED                 (IVIC_ERROR_BASE + 0x0011)
#define AGXSAN_ERROR_ATTRIBUTE_NOT_SUPPORTED                (IVIC_ERROR_BASE + 0x0012)
#define AGXSAN_ERROR_VALUE_NOT_SUPPORTED                    (IVIC_ERROR_BASE + 0x0013)
#define AGXSAN_ERROR_NOT_INITIALIZED                        (IVIC_ERROR_BASE + 0x001D)
#define AGXSAN_ERROR_UNKNOWN_CHANNEL_NAME                   (IVIC_ERROR_BASE + 0x0020)
#define AGXSAN_ERROR_TOO_MANY_OPEN_FILES                    (IVIC_ERROR_BASE + 0x0023)
#define AGXSAN_ERROR_CHANNEL_NAME_REQUIRED                  (IVIC_ERROR_BASE + 0x0044)
#define AGXSAN_ERROR_MISSING_OPTION_NAME                    (IVIC_ERROR_BASE + 0x0049)
#define AGXSAN_ERROR_MISSING_OPTION_VALUE                   (IVIC_ERROR_BASE + 0x004A)
#define AGXSAN_ERROR_BAD_OPTION_NAME                        (IVIC_ERROR_BASE + 0x004B)
#define AGXSAN_ERROR_BAD_OPTION_VALUE                       (IVIC_ERROR_BASE + 0x004C)
#define AGXSAN_ERROR_OUT_OF_MEMORY                          (IVIC_ERROR_BASE + 0x0056)
#define AGXSAN_ERROR_OPERATION_PENDING                      (IVIC_ERROR_BASE + 0x0057)
#define AGXSAN_ERROR_NULL_POINTER                           (IVIC_ERROR_BASE + 0x0058)
#define AGXSAN_ERROR_UNEXPECTED_RESPONSE                    (IVIC_ERROR_BASE + 0x0059)
#define AGXSAN_ERROR_FILE_NOT_FOUND                         (IVIC_ERROR_BASE + 0x005B)
#define AGXSAN_ERROR_INVALID_FILE_FORMAT                    (IVIC_ERROR_BASE + 0x005C)
#define AGXSAN_ERROR_STATUS_NOT_AVAILABLE                   (IVIC_ERROR_BASE + 0x005D)
#define AGXSAN_ERROR_ID_QUERY_FAILED                        (IVIC_ERROR_BASE + 0x005E)
#define AGXSAN_ERROR_RESET_FAILED                           (IVIC_ERROR_BASE + 0x005F)
#define AGXSAN_ERROR_RESOURCE_UNKNOWN                       (IVIC_ERROR_BASE + 0x0060)
#define AGXSAN_ERROR_ALREADY_INITIALIZED                    (IVIC_ERROR_BASE + 0x0061)
#define AGXSAN_ERROR_CANNOT_CHANGE_SIMULATION_STATE         (IVIC_ERROR_BASE + 0x0062)
#define AGXSAN_ERROR_INVALID_NUMBER_OF_LEVELS_IN_SELECTOR   (IVIC_ERROR_BASE + 0x0063)
#define AGXSAN_ERROR_INVALID_RANGE_IN_SELECTOR              (IVIC_ERROR_BASE + 0x0064)
#define AGXSAN_ERROR_UNKOWN_NAME_IN_SELECTOR                (IVIC_ERROR_BASE + 0x0065)
#define AGXSAN_ERROR_BADLY_FORMED_SELECTOR                  (IVIC_ERROR_BASE + 0x0066)
#define AGXSAN_ERROR_UNKNOWN_PHYSICAL_IDENTIFIER            (IVIC_ERROR_BASE + 0x0067)
#define AGXSAN_ERROR_INVALID_ATTRIBUTE                      (IVIC_ERROR_BASE + 0x000C)
#define AGXSAN_ERROR_TYPES_DO_NOT_MATCH                     (IVIC_ERROR_BASE + 0x0015)
#define AGXSAN_ERROR_IVI_ATTR_NOT_WRITABLE                  (IVIC_ERROR_BASE + 0x000D)
#define AGXSAN_ERROR_IVI_ATTR_NOT_READABLE                  (IVIC_ERROR_BASE + 0x000E)
#define AGXSAN_ERROR_INVALID_SESSION_HANDLE                 (IVIC_ERROR_BASE + 0x1190)



#define AGXSAN_SUCCESS                                      0
#define AGXSAN_WARN_NSUP_ID_QUERY                           (IVIC_WARN_BASE + 0x0065)
#define AGXSAN_WARN_NSUP_RESET                              (IVIC_WARN_BASE + 0x0066)
#define AGXSAN_WARN_NSUP_SELF_TEST                          (IVIC_WARN_BASE + 0x0067)
#define AGXSAN_WARN_NSUP_ERROR_QUERY                        (IVIC_WARN_BASE + 0x0068)
#define AGXSAN_WARN_NSUP_REV_QUERY                          (IVIC_WARN_BASE + 0x0069)



#define AGXSAN_ERROR_TRIGGER_NOT_SOFTWARE                     (IVIC_CROSS_CLASS_ERROR_BASE + 0x0001)
#define AGXSAN_ERROR_MARKER_NOT_ENABLED                       (IVIC_CLASS_ERROR_BASE + 0x0001)
#define AGXSAN_ERROR_NOT_DELTA_MARKER                         (IVIC_CLASS_ERROR_BASE + 0x0002)
#define AGXSAN_ERROR_MAX_TIME_EXCEEDED                        (IVIC_CLASS_ERROR_BASE + 0x0003)
#define AGXSAN_ERROR_ALARM_TIME_INVALID                       (IVIC_LXISYNC_ERROR_BASE + 0x0001)
#define AGXSAN_ERROR_EVENT_SOURCE_EXISTS                      (IVIC_LXISYNC_ERROR_BASE + 0x0002)
#define AGXSAN_ERROR_OUT_OF_EVENT_RESOURCES                   (IVIC_LXISYNC_ERROR_BASE + 0x0003)
#define AGXSAN_ERROR_EVENT_SOURCE_DOES_NOT_EXIST              (IVIC_LXISYNC_ERROR_BASE + 0x0004)
#define AGXSAN_ERROR_EVENT_SOURCE_NOT_SET                     (IVIC_LXISYNC_ERROR_BASE + 0x0005)
#define AGXSAN_ERROR_INVALID_EVENT_SOURCE                     (IVIC_LXISYNC_ERROR_BASE + 0x0006)
#define AGXSAN_ERROR_ALARM_EXISTS                             (IVIC_LXISYNC_ERROR_BASE + 0x0007)
#define AGXSAN_ERROR_ALARM_DOES_NOT_EXIST                     (IVIC_LXISYNC_ERROR_BASE + 0x0008)
#define AGXSAN_ERROR_WIRED_OR_MODE_INVALID                    (IVIC_LXISYNC_ERROR_BASE + 0x0009)
#define AGXSAN_ERROR_CANT_REMOVE_RESERVED_REPEATED_CAPABILITY (IVIC_LXISYNC_ERROR_BASE + 0x0010)
#define AGXSAN_ERROR_PERSONALITY_NOT_ACTIVE                   (IVIC_SPECIFIC_ERROR_BASE + 0x0211)
#define AGXSAN_ERROR_PERSONALITY_NOT_INSTALLED                (IVIC_SPECIFIC_ERROR_BASE + 0x0212)
#define AGXSAN_ERROR_PERSONALITY_NOT_LICENSED                 (IVIC_SPECIFIC_ERROR_BASE + 0x0213)
#define AGXSAN_ERROR_IO_GENERAL                               (IVIC_SPECIFIC_ERROR_BASE + 0x0214)
#define AGXSAN_ERROR_IO_TIMEOUT                               (IVIC_SPECIFIC_ERROR_BASE + 0x0215)
#define AGXSAN_ERROR_MODEL_NOT_SUPPORTED                      (IVIC_SPECIFIC_ERROR_BASE + 0x0216)
#define AGXSAN_ERROR_WRAPPED_DRIVER_ERROR                     (IVIC_SPECIFIC_ERROR_BASE + 0x0218)
#define AGXSAN_ERROR_TRACE_METHOD_NOT_SUPPORTED               (IVIC_SPECIFIC_ERROR_BASE + 0x0002)



#define AGXSAN_WARN_MEASURE_UNCALIBRATED                    (IVIC_CLASS_WARN_BASE + 0x0001)
#define AGXSAN_WARN_OVER_RANGE                              (IVIC_CLASS_WARN_BASE + 0x0002)


/**************************************************************************** 
 *---------------------------- End Include File ----------------------------* 
 ****************************************************************************/
#if defined(__cplusplus) || defined(__cplusplus__)
}
#endif
#endif // __AGXSAN_HEADER
