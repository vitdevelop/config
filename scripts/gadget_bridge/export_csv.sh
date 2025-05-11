#!/bin/bash

DATA=("HEART_RATE" "STEPS" "ACTIVE_CALORIES")
DB='Gadgetbridge.db'
FILE=test.csv
HEADER="-header"
TIMESTAMP_SECONDS_SELECT="strftime('%Y-%m-%d %H:%M:%S', datetime(TIMESTAMP, 'unixepoch', 'localtime')) as TIME"
TIMESTAMP_MILLESECONDS_SELECT="strftime('%Y-%m-%d %H:%M:%S', datetime(TIMESTAMP / 1000, 'unixepoch', 'localtime')) as TIME"

for TYPE in ${DATA[@]}; do
  sqlite3 ${HEADER} -csv -separator "," ${DB} "select '${TYPE}' as TYPE,
  ${TIMESTAMP_SECONDS_SELECT},
  ${TYPE} as DATA
  from GARMIN_ACTIVITY_SAMPLE where ${TYPE} > 0;" >> ${FILE}

   HEADER=''
done

TYPE="DISTANCE_CM"
sqlite3 ${HEADER} -csv -separator "," ${DB} "select 'DISTANCE_M' as TYPE,
  ${TIMESTAMP_SECONDS_SELECT},
  (${TYPE} / 100) as DATA
  from GARMIN_ACTIVITY_SAMPLE where ${TYPE} > 0;" >> ${FILE}


TYPE="STRESS"
sqlite3 ${HEADER} -csv -separator "," ${DB} "select '${TYPE}' as TYPE,
  ${TIMESTAMP_MILLESECONDS_SELECT},
  ${TYPE} as DATA
  from GARMIN_${TYPE}_SAMPLE where ${TYPE} > 0;" >> ${FILE}


TYPE="ENERGY"
sqlite3 ${HEADER} -csv -separator "," ${DB} "select '${TYPE}' as TYPE,
  ${TIMESTAMP_MILLESECONDS_SELECT},
  ${TYPE} as DATA
  from GARMIN_BODY_${TYPE}_SAMPLE where ${TYPE} > 0;" >> ${FILE}


TYPE="RESPIRATORY_RATE"
sqlite3 ${HEADER} -csv -separator "," ${DB} "select '${TYPE}' as TYPE,
  ${TIMESTAMP_MILLESECONDS_SELECT},
  ${TYPE} as DATA
  from GARMIN_${TYPE}_SAMPLE where ${TYPE} > 0;" >> ${FILE}
