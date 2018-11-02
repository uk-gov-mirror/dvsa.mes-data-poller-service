-- Subset of TARS tables, used by Journal Extract

CREATE TABLE EXAMINER
(	"STAFF_NUMBER" VARCHAR2(10 BYTE) NOT NULL ENABLE,
	"GRADE_CODE" VARCHAR2(4 BYTE),
	"PROB_PER_START_DATE" DATE,
	"PROB_PER_END_DATE" DATE,
	"DSA_BIKE_IND" NUMBER(1,0),
	"DSA_RADIO_IND" NUMBER(1,0),
	"WELSH_SPKG_CODE" NUMBER(1,0) DEFAULT 1 NOT NULL ENABLE,
	"DEPLOY_IND" NUMBER(6,0),
	"NON_DEPLOY_TEXT" VARCHAR2(255 BYTE),
	"SKILL_TEXT" VARCHAR2(400 BYTE),
	"MAN_PROG_START_DATE" DATE,
	"MAN_PROG_END_DATE" DATE,
	"UPDATED_ON" DATE DEFAULT NULL NOT NULL ENABLE,
	"CREATED_ON" DATE DEFAULT NULL NOT NULL ENABLE,
	"UPDATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE,
	"CREATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE,
	"INDIVIDUAL_ID" NUMBER(12,0) NOT NULL ENABLE,
	"MOBILE_IND" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE,
	"EMAIL_JOURNALS_IND" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE,
	"DVSA_EMAIL" VARCHAR2(100 BYTE),
	"STOP_JOURNALS_IND" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE,
	CONSTRAINT "EXAM_IND_ID_PK" PRIMARY KEY ("INDIVIDUAL_ID"),
	CONSTRAINT "EXAM_STAFF_NO_UQ" UNIQUE ("STAFF_NUMBER"),
	CONSTRAINT "EMAIL_JOURNALS_IND_CHECK" CHECK (EMAIL_JOURNALS_IND IN (0, 1)) ENABLE,
	CONSTRAINT "STOP_JOURNALS_IND_CHECK" CHECK (STOP_JOURNALS_IND IN (0, 1)) ENABLE,
	CONSTRAINT "EXAM_MOBILE_CHECK" CHECK (MOBILE_IND IN (0, 1)) ENABLE,
	CONSTRAINT "EXA_DSAUSER_CR_BY_FK" FOREIGN KEY ("CREATED_BY")
	    REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE,
	CONSTRAINT "EXA_DSAUSER_UP_BY_FK" FOREIGN KEY ("UPDATED_BY")
	    REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE,
	CONSTRAINT "EXA_GRADE_FK" FOREIGN KEY ("GRADE_CODE")
	    REFERENCES "TARSUAT"."EXAMINER_GRADE" ("EXAMINER_GRADE_CODE") ENABLE
);

CREATE TABLE INDIVIDUAL
(	"INDIVIDUAL_ID" NUMBER(12,0),
   	"DRIVER_NUMBER" VARCHAR2(24 BYTE),
   	"DATE_OF_BIRTH" DATE,
   	"TEST_CENTRE_ID" NUMBER(8,0),
   	"TITLE_CODE" NUMBER(12,0),
   	"PREVIOUS_TEST_CENTRE_ID" NUMBER(8,0),
   	"FAMILY_NAME" VARCHAR2(50 BYTE),
   	"FIRST_FORENAME" VARCHAR2(50 BYTE),
   	"SECOND_FORENAME" VARCHAR2(50 BYTE),
   	"THIRD_FORENAME" VARCHAR2(50 BYTE),
   	"PERSON_INITIALS" VARCHAR2(8 BYTE),
   	"PERSON_FULL_NAME" VARCHAR2(100 BYTE),
   	"PERSON_REQUESTED_NAME" VARCHAR2(50 BYTE),
   	"VAT_REGISTERED" NUMBER(1,0),
   	"DEFAULT_ADDRESS_CODE" NUMBER(12,0),
   	"GENDER_CODE" NUMBER(12,0),
   	"TOTAL_POINTS" NUMBER(8,2),
   	"DATE_OF_FIRST_LICENCE" DATE,
   	"LICENCE_EXPIRY_DATE" DATE,
   	"LAST_UPDATED_BY_DVLA" DATE,
   	"PP_STATUS_CODE" NUMBER(12,0),
   	"PP_DATE_FIRST_ISSUED" DATE,
   	"PP_CERTS_ISSUED" NUMBER(8,0),
   	"PP_PACKS_ORDERED" NUMBER(8,0),
   	"PP_DESPATCH_ADD" VARCHAR2(20 BYTE),
   	"PP_CONSENT_MARKER" NUMBER(5,0),
   	"PP_STARTER_FEE_PAID" NUMBER(8,2),
   	"BAD_DEBT_IND" NUMBER(1,0),
   	"EXTERNAL_MAIL_CONSENT_IND" NUMBER(1,0),
   	"ID_CONFIRMATION_STATUS_CODE" NUMBER(12,0),
   	"IS_ORGAN_DONOR" NUMBER(1,0),
   	"IS_TITLE_ADDRESS" NUMBER(1,0),
   	"DISABLED_MARKER" NUMBER(1,0),
   	"DATE_OF_BIRTH_VERIFIED_CODE" VARCHAR2(10 BYTE),
   	"DATE_OF_DEATH" DATE,
   	"NOTIFIED_DECEASED_CODE" NUMBER(12,0),
   	"DATE_ENTERED" DATE,
   	"DATE_MOVED" DATE,
   	"COUNTRY_OF_BIRTH" VARCHAR2(50 BYTE),
   	"COUNTRY_OF_BIRTH_INTERNAL_CODE" NUMBER(12,0),
   	"NATIONALITY_CODE" NUMBER(12,0),
   	"PREFERRED_LANGUAGE_CODE" NUMBER(12,0),
   	"REASON_CODE" NUMBER(12,0),
   	"STATE_CODE" NUMBER(12,0),
   	"COMMUNICATION_PREF_CODE" NUMBER(12,0),
   	"NOTES" VARCHAR2(255 BYTE),
   	"CREATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE,
   	"CREATED_ON" DATE DEFAULT NULL NOT NULL ENABLE,
   	"UPDATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE,
   	"UPDATED_ON" DATE DEFAULT NULL NOT NULL ENABLE,
   	"INCREASE_FEE_IND" NUMBER(1,0),
   	"BOOKING_REVIEW_IND" NUMBER(1,0),
   	"INTEGRITY_IND" NUMBER(1,0),
   	"NO_MAILINGS" NUMBER(1,0),
   	"WEB_IND_CODE" NUMBER(9,0),
   	"ETHNIC_ORIGIN_CODE" NUMBER(9,0),
   	"EU_LICENCE_IND" NUMBER(1,0),
   	"DVLA_PHOTO_AUTH" NUMBER(1,0),
   	"SC_PUBLISH_IND" NUMBER(1,0),
   	CONSTRAINT "INDV_INDVID_PK" PRIMARY KEY ("INDIVIDUAL_ID"),
   	CONSTRAINT "FK_INDIVIDUAL_TEST_CENTRE" FOREIGN KEY ("TEST_CENTRE_ID")
   	    REFERENCES "TARSUAT"."TEST_CENTRE" ("TC_ID") ENABLE,
   	CONSTRAINT "IN_DU_CREATED_BY_FK" FOREIGN KEY ("CREATED_BY")
   	    REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE,
   	CONSTRAINT "IN_DU_UPDATED_BY_FK" FOREIGN KEY ("UPDATED_BY")
   	    REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE
);

CREATE TABLE REF_DATA_ITEM_MASTER
(	"ITEM_ID" NUMBER(12,0),
	"ITEM_DESC1" VARCHAR2(255 BYTE),
	"ITEM_DESC2" VARCHAR2(255 BYTE),
	"EXT_DESC" VARCHAR2(255 BYTE),
	"CATEGORY_ID" NUMBER(12,0),
	"VALID_FROM_DATE" DATE,
	"VALID_TO_DATE" DATE,
	"PARENT_ITEM_ID" NUMBER(12,0),
	"SORTING_ORDER" NUMBER(38,0) DEFAULT 0,
	"ACTIVE_FLG" VARCHAR2(1 BYTE),
	"CREATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE,
	"CREATED_ON" DATE DEFAULT NULL NOT NULL ENABLE,
	"UPDATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE,
	"UPDATED_ON" DATE DEFAULT NULL NOT NULL ENABLE,
	"DSA_UPDATABLE" VARCHAR2(2 BYTE),
	CONSTRAINT "PK_REF_DATA_ITEM_MASTER" PRIMARY KEY ("CATEGORY_ID", "ITEM_ID"),
	CONSTRAINT "FK_REF_ITEM_CATEGORY" FOREIGN KEY ("CATEGORY_ID")
	    REFERENCES "TARSUAT"."REF_DATA_CATEGORY_MASTER" ("CATEGORY_ID") ENABLE,
	CONSTRAINT "RDIM_DU_CREATED_BY_FK" FOREIGN KEY ("CREATED_BY")
	    REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE,
	CONSTRAINT "RDIM_DU_UPDATED_BY_FK" FOREIGN KEY ("UPDATED_BY")
	    REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE
);

CREATE TABLE POSTING
(	"TC_ID" NUMBER(12,0) CONSTRAINT "POSTING_C_356" NOT NULL ENABLE,
	"INDIVIDUAL_ID" NUMBER(12,0),
	"START_DATE" DATE CONSTRAINT "POSTING_C_358" NOT NULL ENABLE,
	"END_DATE" DATE,
	"CURRENT_FLOAT_IND" NUMBER(1,0) CONSTRAINT "POSTING_C_351" NOT NULL ENABLE,
	"CREATED_BY" NUMBER(12,0) DEFAULT NULL CONSTRAINT "POSTING_C_352" NOT NULL ENABLE,
	"CREATED_ON" DATE DEFAULT NULL CONSTRAINT "POSTING_C_353" NOT NULL ENABLE,
	"UPDATED_BY" NUMBER(12,0) DEFAULT NULL CONSTRAINT "POSTING_C_354" NOT NULL ENABLE,
	"UPDATED_ON" DATE DEFAULT NULL CONSTRAINT "POSTING_C_355" NOT NULL ENABLE,
	CONSTRAINT "PO_TI_II_WD_PK" PRIMARY KEY ("TC_ID", "INDIVIDUAL_ID", "START_DATE"),
	CONSTRAINT "POST_DSAUSER_CR_BY_FK" FOREIGN KEY ("CREATED_BY")
	    REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE,
	CONSTRAINT "POST_DSAUSER_UP_BY_FK" FOREIGN KEY ("UPDATED_BY")
	    REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE,
	CONSTRAINT "POST_IND_INDVID" FOREIGN KEY ("INDIVIDUAL_ID")
	    REFERENCES "TARSUAT"."INDIVIDUAL" ("INDIVIDUAL_ID") ENABLE,
	CONSTRAINT "POST_TES_CE_TCID" FOREIGN KEY ("TC_ID")
	    REFERENCES "TARSUAT"."TEST_CENTRE" ("TC_ID") ENABLE
);

CREATE TABLE TEST_CENTRE
(	"TC_ID" NUMBER(12,0) NOT NULL ENABLE,
	"TC_COST_CENTRE_CODE" VARCHAR2(6 BYTE) NOT NULL ENABLE,
	"OPENING_TIME" DATE,
	"CLOSING_TIME" DATE,
	"COMMISSION_DATE" DATE NOT NULL ENABLE,
	"DECOMMISSION_DATE" DATE,
	"TC_TYPE_CODE" NUMBER(1,0) NOT NULL ENABLE,
	"MAIN_TEST_CENTRE_ID" NUMBER(9,0),
	"EXAMINER_CAPACITY_COUNT" NUMBER(3,0),
	"TEST_ROUTE_CAPACITY_COUNT" NUMBER(3,0),
	"WAITING_ROOM_CAPACITY_COUNT" NUMBER(3,0),
	"FWD_PROGRAM_CREATE_WEEKS" NUMBER(3,0),
	"DIRECTION_TEXT" VARCHAR2(255 BYTE),
	"BAD_WEATHER_INSTR_TEXT" VARCHAR2(255 BYTE),
	"MALE_WC_COUNT" NUMBER(3,0),
	"FEMALE_WC_COUNT" NUMBER(3,0),
	"MALE_STAFF_WC_COUNT" NUMBER(3,0),
	"FEMALE_STAFF_WC_COUNT" NUMBER(3,0),
	"PARKING_CAPACITY_COUNT" NUMBER(3,0),
	"RESERVE_PROGRAM_COUNT" NUMBER(3,0),
	"OPEN_RESERVE_PROGRAM_DAYS" NUMBER(3,0),
	"TC_PROG_PERIOD_END_DATE" DATE,
	"PLANNED_MGMT_SLOT_COUNT" NUMBER(3,0),
	"SPECIAL_MESSAGE_TEXT" VARCHAR2(255 BYTE),
	"MAX_REMOTE_WAIT_WEEKS" NUMBER(3,0),
	"MIN_REMOTE_TEST_COUNT" NUMBER(3,0),
	"REMOTE_TC_LAST_OPEN_DATE" DATE,
	"DEPLOY_CREATED_TO_DATE" DATE,
	"COUNTRY_ID" NUMBER(9,0) NOT NULL ENABLE,
	"SECTOR_ID" NUMBER(9,0) NOT NULL ENABLE,
	"INDIVIDUAL_ID" NUMBER(12,0),
	"TEST_CATEGORY_REF" VARCHAR2(10 BYTE),
	"AUTOFILL_IND" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE,
	"TB_DAY_OF_WEEK" NUMBER(1,0) DEFAULT 1 NOT NULL ENABLE,
	"SPECIAL_NEEDS_INFORMATION" VARCHAR2(255 BYTE),
	"LA_ID" NUMBER(9,0),
	"PWL_IND" NUMBER(1,0) DEFAULT 0 NOT NULL ENABLE,
	"UPDATED_ON" DATE DEFAULT NULL NOT NULL ENABLE,
	"CREATED_ON" DATE DEFAULT NULL NOT NULL ENABLE,
	"CREATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE,
	"UPDATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE,
	"UPDATE_FLAG" NUMBER(1,0),
	"SECURITY_COMPANY_ID" NUMBER(12,0),
	"BRANCH_PRINTER_ID" NUMBER(12,0) DEFAULT 0,
	"TC_RESOURCE_PERIOD_END_DATE" DATE,
	"LAST_NOTIF_PRODUCED_DATE" DATE,
	"LAST_SCHEDULE_PRODUCED_DATE" DATE,
	"DISABLED_WC_COUNT" NUMBER(3,0),
	"LATITUDE" NUMBER(10,8),
	"LONGITUDE" NUMBER(11,8),
	CONSTRAINT "TC_COST_CENTRE_CODE_UQ" UNIQUE ("TC_COST_CENTRE_CODE"),
	CONSTRAINT "TEST_CENTRE_TB_DAY_OF_WEEK_CHK" CHECK (tb_day_of_week IN (1,2,3,4,5)) ENABLE,
	CONSTRAINT "TC_TC_ID_PK" PRIMARY KEY ("TC_ID"),
	CONSTRAINT "BRANCH_PRINTER_ID_FK" FOREIGN KEY ("BRANCH_PRINTER_ID")
	    REFERENCES "TARSUAT"."BRANCH_PRINTER" ("BP_ID") ENABLE,
	CONSTRAINT "TES_CN_DSAUSER_CR_BY_FK" FOREIGN KEY ("CREATED_BY")
	    REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE,
	CONSTRAINT "TES_CN_DSAUSER_UP_BY_FK" FOREIGN KEY ("UPDATED_BY")
	    REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE
);

CREATE TABLE TEST_CENTRE_NAME
(	"TC_ID" NUMBER(12,0) NOT NULL ENABLE,
   	"TC_NAME" VARCHAR2(50 BYTE) NOT NULL ENABLE,
   	"DISPLAY_ORDER" NUMBER(1,0) NOT NULL ENABLE,
   	"UPDATED_ON" DATE DEFAULT NULL NOT NULL ENABLE,
   	"CREATED_ON" DATE DEFAULT NULL NOT NULL ENABLE,
   	"CREATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE,
   	"UPDATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE,
   	CONSTRAINT "TCN_TC_NAME_UQ" UNIQUE ("TC_NAME"),
   	CONSTRAINT "TCN_TC_ID_PK" PRIMARY KEY ("TC_ID", "DISPLAY_ORDER"),
   	CONSTRAINT "TES_CNAME_DSAUSER_CR_BY_FK" FOREIGN KEY ("CREATED_BY")
   	    REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE,
   	CONSTRAINT "TES_CNAME_DSAUSER_UP_BY_FK" FOREIGN KEY ("UPDATED_BY")
   	    REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE
);

CREATE TABLE EXAMINER_STATUS
(	"INDIVIDUAL_ID" NUMBER(12,0),
    "START_DATE" DATE CONSTRAINT "EXA_ST_C_197" NOT NULL ENABLE,
    "END_DATE" DATE,
    "EXAMINER_STATUS_TYPE_CODE" VARCHAR2(1 BYTE) CONSTRAINT "EXA_ST_C_198" NOT NULL ENABLE,
    "CONTRACT_TYPE_CODE" VARCHAR2(2 BYTE),
    "AREA_ID" NUMBER(9,0),
    "CREATED_BY" NUMBER(12,0) DEFAULT NULL CONSTRAINT "EXA_ST_C_199" NOT NULL ENABLE,
    "CREATED_ON" DATE DEFAULT NULL CONSTRAINT "EXA_ST_C_200" NOT NULL ENABLE,
    "UPDATED_BY" NUMBER(12,0) DEFAULT NULL CONSTRAINT "EXA_ST_C_201" NOT NULL ENABLE,
    "UPDATED_ON" DATE DEFAULT NULL CONSTRAINT "EXA_ST_C_202" NOT NULL ENABLE,
    CONSTRAINT "ES_II_SD_PK" PRIMARY KEY ("INDIVIDUAL_ID", "START_DATE"),
    CONSTRAINT "EXA_ST_AREA_AREA_ID_FK" FOREIGN KEY ("AREA_ID")
        REFERENCES "TARSUAT"."AREA" ("AREA_ID") ENABLE,
    CONSTRAINT "EXA_ST_DSAUSER_CR_BY_FK" FOREIGN KEY ("CREATED_BY")
        REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE,
    CONSTRAINT "EXA_ST_DSAUSER_UP_BY_FK" FOREIGN KEY ("UPDATED_BY")
        REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE
);

CREATE TABLE "TARSUAT"."PROGRAMME"
(	"INDIVIDUAL_ID" NUMBER(12,0) NOT NULL ENABLE,
	"PROGRAMME_DATE" DATE CONSTRAINT "PRGM_C_392" NOT NULL ENABLE,
	"TC_ID" NUMBER(12,0) CONSTRAINT "PRGM_C_393" NOT NULL ENABLE,
	"CHANGE_IND" NUMBER(1,0) CONSTRAINT "PRGM_C_394" NOT NULL ENABLE,
	"STATE_CODE" NUMBER(6,0) CONSTRAINT "PRGM_C_395" NOT NULL ENABLE,
	"MODIFICATION_SEQ_NUMBER" NUMBER(12,0),
	CONSTRAINT "PRO_II_PD_TI_PK" PRIMARY KEY ("INDIVIDUAL_ID", "PROGRAMME_DATE", "TC_ID")
	CONSTRAINT "PROG_IND_INDID_FK" FOREIGN KEY ("INDIVIDUAL_ID")
	    REFERENCES "TARSUAT"."INDIVIDUAL" ("INDIVIDUAL_ID") ENABLE,
	CONSTRAINT "PROG_TES_CN_TCID_FK" FOREIGN KEY ("TC_ID")
	    REFERENCES "TARSUAT"."TEST_CENTRE" ("TC_ID") ENABLE
);

CREATE TABLE "TARSUAT"."PROGRAMME_SLOT"
(	"SLOT_ID" NUMBER(12,0) CONSTRAINT "PRG_SL_C_409" NOT NULL ENABLE,
   	"START_TIME" DATE CONSTRAINT "PRG_SL_C_410" NOT NULL ENABLE,
   	"MINUTES" NUMBER(3,0) CONSTRAINT "PRG_SL_C_411" NOT NULL ENABLE,
   	"STATE_CODE" NUMBER(6,0) CONSTRAINT "PRG_SL_C_412" NOT NULL ENABLE,
   	"GHOST_IND" NUMBER(1,0) CONSTRAINT "PRG_SL_C_413" NOT NULL ENABLE,
   	"SLOT_TYPE_CODE" NUMBER(1,0) CONSTRAINT "PRG_SL_C_414" NOT NULL ENABLE,
   	"VST_CODE" NUMBER(9,0),
   	"NON_TEST_ACTIVITY_CODE" VARCHAR2(4 BYTE),
   	"INDIVIDUAL_ID" NUMBER(12,0) NOT NULL ENABLE,
   	"PROGRAMME_DATE" DATE CONSTRAINT "PRG_SL_C_416" NOT NULL ENABLE,
   	"TC_ID" NUMBER(12,0) CONSTRAINT "PRG_SL_C_417" NOT NULL ENABLE,
   	"DEPLOYED_TO_FROM_CODE" NUMBER(1,0),
   	"DEPLOYED_TO_FROM_TC_COST_CODE" VARCHAR2(6 BYTE),
   	"CLOSURE_CODE" NUMBER(6,0),
   	"REPEATED_CLOSURE_CODE" NUMBER(6,0),
   	"SUSPENDED_IND" NUMBER(1,0) CONSTRAINT "PRG_SL_C_418" NOT NULL ENABLE,
   	"DEPLOYMENT_ID" NUMBER(12,0),
   	"TC_CLOSED_IND" NUMBER(1,0) CONSTRAINT "PRG_SL_C_419" NOT NULL ENABLE,
   	"INSTRUCTOR_ID" NUMBER(12,0),
   	"RESERVED_USER_NAME" VARCHAR2(50 BYTE),
   	"RESERVED_DATE_TIME" DATE,
   	"CANCELLED_DEPLOYMENT_IND" NUMBER(1,0),
   	"MODIFICATION_SEQ_NUMBER" NUMBER(12,0) DEFAULT 1 NOT NULL ENABLE,
   	CONSTRAINT "PS_SLOT_ID_PK" PRIMARY KEY ("SLOT_ID")
   	CONSTRAINT "PROG_SL_DEPL_DEPL_ID_TCID_FK" FOREIGN KEY ("DEPLOYMENT_ID")
   	    REFERENCES "TARSUAT"."DEPLOYMENT" ("DEPLOYMENT_ID") ENABLE,
   	CONSTRAINT "PROG_SL_TES_CN_TCID_FK" FOREIGN KEY ("TC_ID")
   	    REFERENCES "TARSUAT"."TEST_CENTRE" ("TC_ID") ENABLE
);

CREATE TABLE "TARSUAT"."BOOKING"
(	"BOOKING_ID" NUMBER(12,0) CONSTRAINT "BOOK_C_69" NOT NULL ENABLE,
    "APP_ID" NUMBER(12,0) CONSTRAINT "BOOK_C_70" NOT NULL ENABLE,
    "ACTUAL_TEST_FEE_AMOUNT" NUMBER(5,2) CONSTRAINT "BOOK_C_71" NOT NULL ENABLE,
    "BOOKED_DATE" DATE,
    "BOOKING_CANCEL_REASON_CODE" NUMBER(6,0),
    "CANCELLED_DATE_TIME" DATE,
    "CANCELLED_TC_ID" NUMBER(9,0),
    "LOST_FEE_IND" NUMBER(1,0),
    "NO_CANCEL_ACCEPT_IND" NUMBER(1,0) CONSTRAINT "BOOK_C_72" NOT NULL ENABLE,
    "NON_COMPLETION_CODE" NUMBER(6,0),
    "RETEST_REFUND_IND" NUMBER(1,0) CONSTRAINT "BOOK_C_73" NOT NULL ENABLE,
    "STATE_CODE" NUMBER(6,0) CONSTRAINT "BOOK_C_74" NOT NULL ENABLE,
    "TEST_SERVICE_ITEM_ID" NUMBER(9,0) CONSTRAINT "BOOK_C_75" NOT NULL ENABLE,
    "INCOME_ACCRUED_IND" NUMBER(1,0),
    "SLOT_ID" NUMBER(12,0),
    "FULL_TEST_FEE_AMOUNT" NUMBER(10,2),
    "EXPECTED_TEST_FEE_AMOUNT" NUMBER(10,2),
    "ACCRUED_FIN_TRAN_ID" NUMBER(9,0),
    "CREATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE,
    "CREATED_ON" DATE DEFAULT NULL NOT NULL ENABLE,
    "UPDATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE,
    "UPDATED_ON" DATE DEFAULT NULL NOT NULL ENABLE,
    "RESOURCE_SLOT_ID" NUMBER(12,0),
    CONSTRAINT "BO_AI_BSN_PK" PRIMARY KEY ("BOOKING_ID")
    CONSTRAINT "BKG_SLOT_ID_UNIQUE" UNIQUE ("SLOT_ID")
        USING INDEX (CREATE INDEX "TARSUAT"."BOOKING_SLOT_ID_IDX" ON "TARSUAT"."BOOKING" ("SLOT_ID")
    CONSTRAINT "BO_AP_APP_ID_FK" FOREIGN KEY ("APP_ID")
        REFERENCES "TARSUAT"."APPLICATION" ("APP_ID") ENABLE,
    CONSTRAINT "BO_BCR_BCRC_FK" FOREIGN KEY ("BOOKING_CANCEL_REASON_CODE")
        REFERENCES "TARSUAT"."BOOKING_CANCELLATION_REASON" ("BOOKING_CANCEL_REASON_CODE") ENABLE,
    CONSTRAINT "BO_TSI_TSII_FK" FOREIGN KEY ("TEST_SERVICE_ITEM_ID")
        REFERENCES "TARSUAT"."TEST_SERVICE_ITEM" ("TEST_SERVICE_ITEM_ID") ENABLE,
    CONSTRAINT "BOOK_DSAUSER_CR_BY_FK" FOREIGN KEY ("CREATED_BY")
        REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE,
    CONSTRAINT "BOOK_DSAUSER_UP_BY_FK" FOREIGN KEY ("UPDATED_BY")
        REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE,
    CONSTRAINT "BOOK_PRO_SL_SLOT_ID_FK" FOREIGN KEY ("SLOT_ID")
        REFERENCES "TARSUAT"."PROGRAMME_SLOT" ("SLOT_ID") ENABLE,
    CONSTRAINT "BOOK_RES_SLOT_ID_FK" FOREIGN KEY ("RESOURCE_SLOT_ID")
        REFERENCES "TARSUAT"."RESOURCE_SLOTS" ("SLOT_ID") ENABLE,
    CONSTRAINT "BOOK_TES_CE_CANCLEID_TCID_FK" FOREIGN KEY ("CANCELLED_TC_ID")
        REFERENCES "TARSUAT"."TEST_CENTRE" ("TC_ID") ENABLE
);


  CREATE TABLE "TARSUAT"."PERSONAL_COMMITMENT" 
   (	"COMMITMENT_ID" NUMBER(12,0) CONSTRAINT "PER_CO_C_341" NOT NULL ENABLE, 
	"COMMITMENT_TEXT" VARCHAR2(255 BYTE), 
	"END_DATE_TIME" DATE CONSTRAINT "PER_CO_C_342" NOT NULL ENABLE, 
	"INDIVIDUAL_ID" NUMBER(12,0) NOT NULL ENABLE, 
	"NON_TEST_ACTIVITY_CODE" VARCHAR2(4 BYTE) CONSTRAINT "PER_CO_C_344" NOT NULL ENABLE, 
	"START_DATE_TIME" DATE CONSTRAINT "PER_CO_C_345" NOT NULL ENABLE, 
	"STATE_CODE" NUMBER(6,0) CONSTRAINT "PER_CO_C_346" NOT NULL ENABLE, 
	"CREATED_BY" NUMBER(12,0) DEFAULT NULL CONSTRAINT "PER_CO_C_347" NOT NULL ENABLE, 
	"CREATED_ON" DATE DEFAULT NULL CONSTRAINT "PER_CO_C_348" NOT NULL ENABLE, 
	"UPDATED_BY" NUMBER(12,0) DEFAULT NULL CONSTRAINT "PER_CO_C_349" NOT NULL ENABLE, 
	"UPDATED_ON" DATE DEFAULT NULL CONSTRAINT "PER_CO_C_350" NOT NULL ENABLE, 
	 CONSTRAINT "PC_COMMITMENT_ID_PK" PRIMARY KEY ("COMMITMENT_ID"), 
	 CONSTRAINT "PER_CO_DSAUSER_CR_BY_FK" FOREIGN KEY ("CREATED_BY")
	  REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE, 
	 CONSTRAINT "PER_CO_DSAUSER_UP_BY_FK" FOREIGN KEY ("UPDATED_BY")
	  REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE, 
	 CONSTRAINT "PER_CO_IND_INDID_FK" FOREIGN KEY ("INDIVIDUAL_ID")
	  REFERENCES "TARSUAT"."INDIVIDUAL" ("INDIVIDUAL_ID") ENABLE
   );

  CREATE TABLE "TARSUAT"."NON_TEST_ACTIVITY_REASON" 
   (	"NON_TEST_ACTIVITY_CODE" VARCHAR2(4 BYTE) CONSTRAINT "NON_TR_C_316" NOT NULL ENABLE, 
	"DEPLOYMENT_PRIORITY_NUMBER" NUMBER(9,0) CONSTRAINT "NON_TR_C_317" NOT NULL ENABLE, 
	"PAYABLE_IND" NUMBER(1,0) CONSTRAINT "NON_TR_C_318" NOT NULL ENABLE, 
	"REASON_DESC" VARCHAR2(50 BYTE) CONSTRAINT "NON_TR_C_319" NOT NULL ENABLE, 
	"WORK_PATTERN_IND" NUMBER(1,0) CONSTRAINT "NON_TR_C_320" NOT NULL ENABLE, 
	"CREATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE, 
	"CREATED_ON" DATE DEFAULT NULL NOT NULL ENABLE, 
	"UPDATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE, 
	"UPDATED_ON" DATE DEFAULT NULL NOT NULL ENABLE, 
	"START_DATE" DATE, 
	"END_DATE" DATE, 
	"QUALIFICATION_IND" NUMBER(1,0), 
	"SKILL_THRESHOLD_DAYS" NUMBER(6,0), 
	 CONSTRAINT "NTAR_NTAC_PK" PRIMARY KEY ("NON_TEST_ACTIVITY_CODE"), 
	 CONSTRAINT "NON_AR_DSAUSER_CR_BY_FK" FOREIGN KEY ("CREATED_BY")
	  REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE, 
	 CONSTRAINT "NON_AR_DSAUSER_UP_BY_FK" FOREIGN KEY ("UPDATED_BY")
	  REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE
   );


  CREATE TABLE "TARSUAT"."VEHICLE_SLOT_TYPE" 
   (	"VST_CODE" NUMBER(12,0) CONSTRAINT "VEH_SL_C_573" NOT NULL ENABLE, 
	"VEHICLE_TYPE_CODE" VARCHAR2(2 BYTE) CONSTRAINT "VEH_SL_C_574" NOT NULL ENABLE, 
	"MINUTES" NUMBER(3,0) CONSTRAINT "VEH_SL_C_575" NOT NULL ENABLE, 
	"VST_DESC" VARCHAR2(50 BYTE) CONSTRAINT "VEH_SL_C_576" NOT NULL ENABLE, 
	"CREATED_ON" DATE DEFAULT NULL NOT NULL ENABLE, 
	"CREATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE, 
	"UPDATED_ON" DATE DEFAULT NULL NOT NULL ENABLE, 
	"UPDATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE, 
	"SHORT_VST_DESC" VARCHAR2(11 CHAR), 
	 CONSTRAINT "VST_VC_VTC_PK" PRIMARY KEY ("VST_CODE"), 
	 CONSTRAINT "VEH_ST_DSAUSER_CR_BY_FK" FOREIGN KEY ("CREATED_BY")
	  REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE, 
	 CONSTRAINT "VEH_ST_DSAUSER_UP_BY_FK" FOREIGN KEY ("UPDATED_BY")
	  REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE, 
	 CONSTRAINT "VST_VT_VEHICLE_TYPE_CODE_FK" FOREIGN KEY ("VEHICLE_TYPE_CODE")
	  REFERENCES "TARSUAT"."VEHICLE_TYPE" ("VEHICLE_TYPE_CODE") ENABLE
   ) ;


  CREATE TABLE "TARSUAT"."DEPLOYMENT" 
   (	"DEPLOYMENT_ID" NUMBER(12,0) CONSTRAINT "DPLY_C_150" NOT NULL ENABLE, 
	"START_DATE" DATE CONSTRAINT "DPLY_C_151" NOT NULL ENABLE, 
	"END_DATE" DATE CONSTRAINT "DPLY_C_152" NOT NULL ENABLE, 
	"STATE_CODE" NUMBER(6,0) CONSTRAINT "DPLY_C_153" NOT NULL ENABLE, 
	"REQUEST_DATE" DATE CONSTRAINT "DPLY_C_154" NOT NULL ENABLE, 
	"DEPLOYMENT_TYPE_CODE" NUMBER(1,0) CONSTRAINT "DPLY_C_155" NOT NULL ENABLE, 
	"ALLOWED_TRAVEL_MINUTES" NUMBER(3,0), 
	"AREA_ID" NUMBER(9,0) CONSTRAINT "DPLY_C_156" NOT NULL ENABLE, 
	"AREA_DEPLOYMENT_NUMBER" VARCHAR2(16 BYTE), 
	"CANCELLED_DATE" DATE, 
	"FINANCIAL_YEAR" NUMBER(4,0), 
	"VERSION_NUMBER" NUMBER(2,0) CONSTRAINT "DPLY_C_157" NOT NULL ENABLE, 
	"WELSH_IND" NUMBER(1,0) CONSTRAINT "DPLY_C_158" NOT NULL ENABLE, 
	"COMMENTS_TEXT" VARCHAR2(255 BYTE), 
	"TC_ID" NUMBER(12,0) CONSTRAINT "DPLY_C_159" NOT NULL ENABLE, 
	"INDIVIDUAL_ID" NUMBER(12,0), 
	"AREA_DECISION_DATE" DATE CONSTRAINT "DPLY_C_161" NOT NULL ENABLE, 
	"CREATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE, 
	"CREATED_ON" DATE DEFAULT NULL NOT NULL ENABLE, 
	"UPDATED_BY" NUMBER(12,0) DEFAULT NULL NOT NULL ENABLE, 
	"UPDATED_ON" DATE DEFAULT NULL NOT NULL ENABLE, 
	"DEPLOYMENT_REASON_ID" NUMBER(12,0), 
	"NUM_CANCELLATIONS_SAVED" NUMBER(3,0), 
	 CONSTRAINT "DE_DEPLOYMENT_ID_PK" PRIMARY KEY ("DEPLOYMENT_ID"), 
	 CONSTRAINT "DEP_AREA_AREA_ID_FK" FOREIGN KEY ("AREA_ID")
	  REFERENCES "TARSUAT"."AREA" ("AREA_ID") ENABLE, 
	 CONSTRAINT "DEP_DSAUSER_CR_BY_FK" FOREIGN KEY ("CREATED_BY")
	  REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE, 
	 CONSTRAINT "DEP_DSAUSER_UP_BY_FK" FOREIGN KEY ("UPDATED_BY")
	  REFERENCES "TARSUAT"."DSAUSER" ("USER_ID") ENABLE, 
	 CONSTRAINT "DEPL_INDV_INDVID_FK" FOREIGN KEY ("INDIVIDUAL_ID")
	  REFERENCES "TARSUAT"."INDIVIDUAL" ("INDIVIDUAL_ID") ENABLE, 
	 CONSTRAINT "DEPL_TES_CN_TCID_FK" FOREIGN KEY ("TC_ID")
	  REFERENCES "TARSUAT"."TEST_CENTRE" ("TC_ID") ENABLE
   );
