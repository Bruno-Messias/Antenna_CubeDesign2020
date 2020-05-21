opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F689
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_delay_x10ms
	FNCALL	_main,_port_init
	FNCALL	_main,_nop_10
	FNCALL	_main,_timer1_init
	FNCALL	_main,_sdn_reset
	FNCALL	_main,_SI4463_init
	FNCALL	_main,_rx_init
	FNCALL	_main,_tx_data
	FNCALL	_main,_clr_interrupt
	FNCALL	_main,_spi_read_fifo
	FNCALL	_main,_fifo_reset
	FNCALL	_tx_data,_fifo_reset
	FNCALL	_tx_data,_spi_write_fifo
	FNCALL	_tx_data,_enable_tx_interrupt
	FNCALL	_tx_data,_clr_interrupt
	FNCALL	_tx_data,_tx_start
	FNCALL	_tx_data,_sdn_reset
	FNCALL	_tx_data,_SI4463_init
	FNCALL	_rx_init,_fifo_reset
	FNCALL	_rx_init,_enable_rx_interrupt
	FNCALL	_rx_init,_clr_interrupt
	FNCALL	_rx_init,_rx_start
	FNCALL	_clr_interrupt,_spi_write
	FNCALL	_clr_interrupt,_spi_read
	FNCALL	_rx_start,_spi_write
	FNCALL	_tx_start,_spi_write
	FNCALL	_enable_tx_interrupt,_spi_write
	FNCALL	_enable_rx_interrupt,_spi_write
	FNCALL	_spi_read,_check_cts
	FNCALL	_spi_read,_spi_write
	FNCALL	_spi_read,_spi_byte
	FNCALL	_fifo_reset,_spi_write
	FNCALL	_SI4463_init,_spi_write
	FNCALL	_spi_write_fifo,_check_cts
	FNCALL	_spi_write_fifo,_spi_byte
	FNCALL	_spi_write,_check_cts
	FNCALL	_spi_write,_spi_byte
	FNCALL	_spi_read_fifo,_check_cts
	FNCALL	_spi_read_fifo,_spi_byte
	FNCALL	_check_cts,_spi_byte
	FNCALL	_sdn_reset,_delay_1ms
	FNCALL	_sdn_reset,_spi_byte
	FNCALL	_delay_x10ms,_delay_10ms
	FNROOT	_main
	FNCALL	intlevel1,_ISR_timer
	global	intlevel1
	FNROOT	intlevel1
	global	_tx_ph_data
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	82
_tx_ph_data:
	retlw	073h
	retlw	077h
	retlw	077h
	retlw	078h
	retlw	041h
	retlw	042h
	retlw	043h
	retlw	044h
	retlw	045h
	retlw	046h
	retlw	047h
	retlw	048h
	retlw	049h
	retlw	06Dh
	global	_RF_POWER_UP_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	63
_RF_POWER_UP_data:
	retlw	02h
	retlw	01h
	retlw	0
	retlw	01h
	retlw	0C9h
	retlw	0C3h
	retlw	080h
	global	_AGC_WINDOW_SIZE_12_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	73
_AGC_WINDOW_SIZE_12_data:
	retlw	011h
	retlw	020h
	retlw	0Ch
	retlw	038h
	retlw	011h
	retlw	0ABh
	retlw	0ABh
	retlw	080h
	retlw	01Ah
	retlw	0FFh
	retlw	0FFh
	retlw	0
	retlw	02Bh
	retlw	0Ch
	retlw	0A4h
	retlw	022h
	global	_BCR_NCO_OFFSET_2_12_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	71
_BCR_NCO_OFFSET_2_12_data:
	retlw	011h
	retlw	020h
	retlw	0Ch
	retlw	024h
	retlw	0
	retlw	0A7h
	retlw	0C6h
	retlw	0
	retlw	054h
	retlw	02h
	retlw	0C2h
	retlw	0
	retlw	04h
	retlw	032h
	retlw	080h
	retlw	07h
	global	_COE13_7_0_12_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	75
_COE13_7_0_12_data:
	retlw	011h
	retlw	021h
	retlw	0Ch
	retlw	0
	retlw	0FFh
	retlw	0BAh
	retlw	0Fh
	retlw	051h
	retlw	0CFh
	retlw	0A9h
	retlw	0C9h
	retlw	0FCh
	retlw	01Bh
	retlw	01Eh
	retlw	0Fh
	retlw	01h
	global	_COE1_7_0_12_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	76
_COE1_7_0_12_data:
	retlw	011h
	retlw	021h
	retlw	0Ch
	retlw	0Ch
	retlw	0FCh
	retlw	0FDh
	retlw	015h
	retlw	0FFh
	retlw	0
	retlw	0Fh
	retlw	0FFh
	retlw	0BAh
	retlw	0Fh
	retlw	051h
	retlw	0CFh
	retlw	0A9h
	global	_COE7_7_0_12_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	77
_COE7_7_0_12_data:
	retlw	011h
	retlw	021h
	retlw	0Ch
	retlw	018h
	retlw	0C9h
	retlw	0FCh
	retlw	01Bh
	retlw	01Eh
	retlw	0Fh
	retlw	01h
	retlw	0FCh
	retlw	0FDh
	retlw	015h
	retlw	0FFh
	retlw	0
	retlw	0Fh
	global	_RF_MODEM_MOD_TYPE_12_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	69
_RF_MODEM_MOD_TYPE_12_data:
	retlw	011h
	retlw	020h
	retlw	0Ch
	retlw	0
	retlw	02h
	retlw	0
	retlw	07h
	retlw	0
	retlw	02Eh
	retlw	0E0h
	retlw	01h
	retlw	0C9h
	retlw	0C3h
	retlw	080h
	retlw	0
	retlw	01h
	global	_RF_MODEM_TX_RAMP_DELAY_12_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	70
_RF_MODEM_TX_RAMP_DELAY_12_data:
	retlw	011h
	retlw	020h
	retlw	0Ch
	retlw	018h
	retlw	01h
	retlw	080h
	retlw	08h
	retlw	03h
	retlw	080h
	retlw	0
	retlw	070h
	retlw	020h
	retlw	0Ch
	retlw	0E8h
	retlw	03h
	retlw	0Dh
	global	_RF_FREQ_CONTROL_INTE_8_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	62
_RF_FREQ_CONTROL_INTE_8_data:
	retlw	011h
	retlw	040h
	retlw	08h
	retlw	0
	retlw	038h
	retlw	0Eh
	retlw	066h
	retlw	066h
	retlw	044h
	retlw	044h
	retlw	020h
	retlw	0FEh
	global	_RF_MODEM_RAW_CONTROL_8_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	74
_RF_MODEM_RAW_CONTROL_8_data:
	retlw	011h
	retlw	020h
	retlw	08h
	retlw	045h
	retlw	083h
	retlw	01h
	retlw	055h
	retlw	02h
	retlw	080h
	retlw	0FFh
	retlw	08h
	retlw	0
	global	_RF_SYNTH_PFDCP_CPFF_7_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	78
_RF_SYNTH_PFDCP_CPFF_7_data:
	retlw	011h
	retlw	023h
	retlw	07h
	retlw	0
	retlw	02Ch
	retlw	0Eh
	retlw	0Bh
	retlw	04h
	retlw	0Ch
	retlw	073h
	retlw	03h
	global	_RF_FRR_CTL_A_MODE_4_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	65
_RF_FRR_CTL_A_MODE_4_data:
	retlw	011h
	retlw	02h
	retlw	04h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	_RF_MODEM_AFC_LIMITER_1_3_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	72
_RF_MODEM_AFC_LIMITER_1_3_data:
	retlw	011h
	retlw	020h
	retlw	03h
	retlw	030h
	retlw	017h
	retlw	02Ah
	retlw	080h
	global	_RF_MODEM_RAW_SEARCH2_2_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	79
_RF_MODEM_RAW_SEARCH2_2_data:
	retlw	011h
	retlw	020h
	retlw	02h
	retlw	050h
	retlw	084h
	retlw	0Ah
	global	_RF_MODEM_AGC_CONTROL_1_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	68
_RF_MODEM_AGC_CONTROL_1_data:
	retlw	011h
	retlw	020h
	retlw	01h
	retlw	035h
	retlw	0E2h
	global	_RF_MODEM_FREQ_DEV_0_1_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	67
_RF_MODEM_FREQ_DEV_0_1_data:
	retlw	011h
	retlw	020h
	retlw	01h
	retlw	0Ch
	retlw	05Eh
	global	_tx_ph_data
	global	_RF_POWER_UP_data
	global	_AGC_WINDOW_SIZE_12_data
	global	_BCR_NCO_OFFSET_2_12_data
	global	_COE13_7_0_12_data
	global	_COE1_7_0_12_data
	global	_COE7_7_0_12_data
	global	_RF_MODEM_MOD_TYPE_12_data
	global	_RF_MODEM_TX_RAMP_DELAY_12_data
	global	_RF_FREQ_CONTROL_INTE_8_data
	global	_RF_MODEM_RAW_CONTROL_8_data
	global	_RF_SYNTH_PFDCP_CPFF_7_data
	global	_RF_FRR_CTL_A_MODE_4_data
	global	_RF_MODEM_AFC_LIMITER_1_3_data
	global	_RF_MODEM_RAW_SEARCH2_2_data
	global	_RF_MODEM_AGC_CONTROL_1_data
	global	_RF_MODEM_FREQ_DEV_0_1_data
	global	_rx_buf
	global	_spi_read_buf
	global	_count_1hz
	global	_rf_timeout
	global	_Flag
	global	_INTCON
_INTCON	set	11
	global	_PORTC
_PORTC	set	7
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RC6
_RC6	set	62
	global	_RC7
_RC7	set	63
	global	_TMR1IF
_TMR1IF	set	96
	global	_IOCA
_IOCA	set	150
	global	_OSCCON
_OSCCON	set	143
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WDTCON
_WDTCON	set	151
	global	_WPUA
_WPUA	set	149
	global	_TMR1IE
_TMR1IE	set	1120
	global	_ANSEL
_ANSEL	set	286
	global	_ANSELH
_ANSELH	set	287
	file	"master.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_rx_buf:
       ds      25

_spi_read_buf:
       ds      20

_count_1hz:
       ds      2

_rf_timeout:
       ds      2

_Flag:
       ds      1

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+032h)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_port_init
?_port_init:	; 0 bytes @ 0x0
	global	?_nop_10
?_nop_10:	; 0 bytes @ 0x0
	global	?_timer1_init
?_timer1_init:	; 0 bytes @ 0x0
	global	?_sdn_reset
?_sdn_reset:	; 0 bytes @ 0x0
	global	?_SI4463_init
?_SI4463_init:	; 0 bytes @ 0x0
	global	?_rx_init
?_rx_init:	; 0 bytes @ 0x0
	global	?_tx_data
?_tx_data:	; 0 bytes @ 0x0
	global	?_clr_interrupt
?_clr_interrupt:	; 0 bytes @ 0x0
	global	?_spi_read_fifo
?_spi_read_fifo:	; 0 bytes @ 0x0
	global	?_fifo_reset
?_fifo_reset:	; 0 bytes @ 0x0
	global	?_spi_write_fifo
?_spi_write_fifo:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_enable_rx_interrupt
?_enable_rx_interrupt:	; 0 bytes @ 0x0
	global	?_enable_tx_interrupt
?_enable_tx_interrupt:	; 0 bytes @ 0x0
	global	?_tx_start
?_tx_start:	; 0 bytes @ 0x0
	global	?_rx_start
?_rx_start:	; 0 bytes @ 0x0
	global	?_delay_10ms
?_delay_10ms:	; 0 bytes @ 0x0
	global	?_ISR_timer
?_ISR_timer:	; 0 bytes @ 0x0
	global	??_ISR_timer
??_ISR_timer:	; 0 bytes @ 0x0
	global	?_check_cts
?_check_cts:	; 1 bytes @ 0x0
	global	?_spi_byte
?_spi_byte:	; 1 bytes @ 0x0
	ds	2
	global	??_port_init
??_port_init:	; 0 bytes @ 0x2
	global	??_nop_10
??_nop_10:	; 0 bytes @ 0x2
	global	??_timer1_init
??_timer1_init:	; 0 bytes @ 0x2
	global	?_delay_1ms
?_delay_1ms:	; 0 bytes @ 0x2
	global	??_spi_byte
??_spi_byte:	; 0 bytes @ 0x2
	global	??_delay_10ms
??_delay_10ms:	; 0 bytes @ 0x2
	global	spi_byte@i
spi_byte@i:	; 1 bytes @ 0x2
	global	delay_1ms@delay_time
delay_1ms@delay_time:	; 2 bytes @ 0x2
	global	delay_10ms@i
delay_10ms@i:	; 2 bytes @ 0x2
	ds	1
	global	spi_byte@data
spi_byte@data:	; 1 bytes @ 0x3
	ds	1
	global	?_delay_x10ms
?_delay_x10ms:	; 0 bytes @ 0x4
	global	??_check_cts
??_check_cts:	; 0 bytes @ 0x4
	global	??_delay_1ms
??_delay_1ms:	; 0 bytes @ 0x4
	global	check_cts@i
check_cts@i:	; 1 bytes @ 0x4
	global	delay_1ms@i
delay_1ms@i:	; 2 bytes @ 0x4
	global	delay_x10ms@dx10ms
delay_x10ms@dx10ms:	; 2 bytes @ 0x4
	ds	1
	global	??_spi_read_fifo
??_spi_read_fifo:	; 0 bytes @ 0x5
	global	?_spi_write
?_spi_write:	; 0 bytes @ 0x5
	global	??_spi_write_fifo
??_spi_write_fifo:	; 0 bytes @ 0x5
	global	spi_write_fifo@i
spi_write_fifo@i:	; 1 bytes @ 0x5
	global	spi_read_fifo@i
spi_read_fifo@i:	; 1 bytes @ 0x5
	global	spi_write@p
spi_write@p:	; 2 bytes @ 0x5
	ds	1
	global	??_delay_x10ms
??_delay_x10ms:	; 0 bytes @ 0x6
	global	??_sdn_reset
??_sdn_reset:	; 0 bytes @ 0x6
	global	sdn_reset@i
sdn_reset@i:	; 1 bytes @ 0x6
	global	delay_x10ms@j
delay_x10ms@j:	; 2 bytes @ 0x6
	ds	1
	global	??_spi_write
??_spi_write:	; 0 bytes @ 0x7
	global	spi_write@tx_length
spi_write@tx_length:	; 1 bytes @ 0x7
	ds	1
	global	spi_write@j
spi_write@j:	; 1 bytes @ 0x8
	ds	1
	global	spi_write@i
spi_write@i:	; 1 bytes @ 0x9
	ds	1
	global	??_SI4463_init
??_SI4463_init:	; 0 bytes @ 0xA
	global	??_fifo_reset
??_fifo_reset:	; 0 bytes @ 0xA
	global	?_spi_read
?_spi_read:	; 0 bytes @ 0xA
	global	??_enable_rx_interrupt
??_enable_rx_interrupt:	; 0 bytes @ 0xA
	global	??_enable_tx_interrupt
??_enable_tx_interrupt:	; 0 bytes @ 0xA
	global	??_tx_start
??_tx_start:	; 0 bytes @ 0xA
	global	??_rx_start
??_rx_start:	; 0 bytes @ 0xA
	global	spi_read@api_command
spi_read@api_command:	; 1 bytes @ 0xA
	global	fifo_reset@p
fifo_reset@p:	; 2 bytes @ 0xA
	ds	1
	global	??_clr_interrupt
??_clr_interrupt:	; 0 bytes @ 0xB
	global	??_spi_read
??_spi_read:	; 0 bytes @ 0xB
	ds	1
	global	??_rx_init
??_rx_init:	; 0 bytes @ 0xC
	global	??_tx_data
??_tx_data:	; 0 bytes @ 0xC
	global	??_main
??_main:	; 0 bytes @ 0xC
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	spi_read@data_length
spi_read@data_length:	; 1 bytes @ 0x0
	global	tx_start@p
tx_start@p:	; 5 bytes @ 0x0
	global	enable_tx_interrupt@p
enable_tx_interrupt@p:	; 6 bytes @ 0x0
	global	enable_rx_interrupt@p
enable_rx_interrupt@p:	; 7 bytes @ 0x0
	global	rx_start@p
rx_start@p:	; 8 bytes @ 0x0
	global	SI4463_init@app_command_buf
SI4463_init@app_command_buf:	; 20 bytes @ 0x0
	ds	1
	global	spi_read@p
spi_read@p:	; 1 bytes @ 0x1
	ds	1
	global	spi_read@i
spi_read@i:	; 1 bytes @ 0x2
	ds	1
	global	clr_interrupt@p
clr_interrupt@p:	; 4 bytes @ 0x3
	ds	17
	global	main@chksum
main@chksum:	; 1 bytes @ 0x14
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0x15
	ds	1
;;Data sizes: Strings 0, constant 199, data 0, bss 50, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     12      12
;; BANK0           80     22      72
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; spi_write@p	PTR unsigned char  size(2) Largest target is 20
;;		 -> spi_read@p(BANK0[1]), rx_start@p(BANK0[8]), tx_start@p(BANK0[5]), rf_standby@p(COMMON[2]), 
;;		 -> enable_tx_interrupt@p(BANK0[6]), enable_rx_interrupt@p(BANK0[7]), clr_interrupt@p(BANK0[4]), fifo_reset@p(COMMON[2]), 
;;		 -> RF_FREQ_CONTROL_INTE_8_data(CODE[12]), RF_MODEM_RAW_SEARCH2_2_data(CODE[6]), RF_SYNTH_PFDCP_CPFF_7_data(CODE[11]), COE7_7_0_12_data(CODE[16]), 
;;		 -> COE1_7_0_12_data(CODE[16]), COE13_7_0_12_data(CODE[16]), RF_MODEM_RAW_CONTROL_8_data(CODE[12]), AGC_WINDOW_SIZE_12_data(CODE[16]), 
;;		 -> RF_MODEM_AGC_CONTROL_1_data(CODE[5]), RF_MODEM_AFC_LIMITER_1_3_data(CODE[7]), BCR_NCO_OFFSET_2_12_data(CODE[16]), RF_MODEM_TX_RAMP_DELAY_12_data(CODE[16]), 
;;		 -> RF_MODEM_FREQ_DEV_0_1_data(CODE[5]), RF_MODEM_MOD_TYPE_12_data(CODE[16]), RF_FRR_CTL_A_MODE_4_data(CODE[8]), SI4463_init@app_command_buf(BANK0[20]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_fifo_reset
;;   _tx_data->_fifo_reset
;;   _rx_init->_fifo_reset
;;   _clr_interrupt->_spi_read
;;   _rx_start->_spi_write
;;   _tx_start->_spi_write
;;   _enable_tx_interrupt->_spi_write
;;   _enable_rx_interrupt->_spi_write
;;   _spi_read->_spi_write
;;   _fifo_reset->_spi_write
;;   _SI4463_init->_spi_write
;;   _spi_write_fifo->_check_cts
;;   _spi_write->_check_cts
;;   _spi_read_fifo->_check_cts
;;   _check_cts->_spi_byte
;;   _sdn_reset->_delay_1ms
;;   _delay_x10ms->_delay_10ms
;;
;; Critical Paths under _ISR_timer in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_SI4463_init
;;   _tx_data->_SI4463_init
;;   _rx_init->_rx_start
;;   _clr_interrupt->_spi_read
;;
;; Critical Paths under _ISR_timer in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR_timer in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _ISR_timer in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0   14005
;;                                             20 BANK0      2     2      0
;;                        _delay_x10ms
;;                          _port_init
;;                             _nop_10
;;                        _timer1_init
;;                          _sdn_reset
;;                        _SI4463_init
;;                            _rx_init
;;                            _tx_data
;;                      _clr_interrupt
;;                      _spi_read_fifo
;;                         _fifo_reset
;; ---------------------------------------------------------------------------------
;; (1) _tx_data                                              0     0      0    6086
;;                         _fifo_reset
;;                     _spi_write_fifo
;;                _enable_tx_interrupt
;;                      _clr_interrupt
;;                           _tx_start
;;                          _sdn_reset
;;                        _SI4463_init
;; ---------------------------------------------------------------------------------
;; (1) _rx_init                                              0     0      0    2605
;;                         _fifo_reset
;;                _enable_rx_interrupt
;;                      _clr_interrupt
;;                           _rx_start
;; ---------------------------------------------------------------------------------
;; (1) _clr_interrupt                                        4     4      0    1159
;;                                              3 BANK0      4     4      0
;;                          _spi_write
;;                           _spi_read
;; ---------------------------------------------------------------------------------
;; (2) _rx_start                                             8     8      0     538
;;                                              0 BANK0      8     8      0
;;                          _spi_write
;; ---------------------------------------------------------------------------------
;; (2) _tx_start                                             5     5      0     466
;;                                              0 BANK0      5     5      0
;;                          _spi_write
;; ---------------------------------------------------------------------------------
;; (2) _enable_tx_interrupt                                  6     6      0     490
;;                                              0 BANK0      6     6      0
;;                          _spi_write
;; ---------------------------------------------------------------------------------
;; (2) _enable_rx_interrupt                                  7     7      0     514
;;                                              0 BANK0      7     7      0
;;                          _spi_write
;; ---------------------------------------------------------------------------------
;; (2) _spi_read                                             4     3      1     717
;;                                             10 COMMON     1     0      1
;;                                              0 BANK0      3     3      0
;;                          _check_cts
;;                          _spi_write
;;                           _spi_byte
;; ---------------------------------------------------------------------------------
;; (1) _fifo_reset                                           2     2      0     394
;;                                             10 COMMON     2     2      0
;;                          _spi_write
;; ---------------------------------------------------------------------------------
;; (2) _SI4463_init                                         20    20      0    3046
;;                                              0 BANK0     20    20      0
;;                          _spi_write
;; ---------------------------------------------------------------------------------
;; (2) _spi_write_fifo                                       1     1      0     301
;;                                              5 COMMON     1     1      0
;;                          _check_cts
;;                           _spi_byte
;; ---------------------------------------------------------------------------------
;; (2) _spi_write                                            5     3      2     346
;;                                              5 COMMON     5     3      2
;;                          _check_cts
;;                           _spi_byte
;; ---------------------------------------------------------------------------------
;; (1) _spi_read_fifo                                        1     1      0     301
;;                                              5 COMMON     1     1      0
;;                          _check_cts
;;                           _spi_byte
;; ---------------------------------------------------------------------------------
;; (3) _check_cts                                            1     1      0     116
;;                                              4 COMMON     1     1      0
;;                           _spi_byte
;; ---------------------------------------------------------------------------------
;; (2) _sdn_reset                                            1     1      0     230
;;                                              6 COMMON     1     1      0
;;                          _delay_1ms
;;                           _spi_byte
;; ---------------------------------------------------------------------------------
;; (1) _delay_x10ms                                          4     2      2      92
;;                                              4 COMMON     4     2      2
;;                         _delay_10ms
;; ---------------------------------------------------------------------------------
;; (2) _delay_10ms                                           2     2      0      46
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _delay_1ms                                            4     2      2      69
;;                                              2 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (3) _spi_byte                                             2     2      0      93
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _timer1_init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _nop_10                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _port_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (7) _ISR_timer                                            2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 7
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _delay_x10ms
;;     _delay_10ms
;;   _port_init
;;   _nop_10
;;   _timer1_init
;;   _sdn_reset
;;     _delay_1ms
;;     _spi_byte
;;   _SI4463_init
;;     _spi_write
;;       _check_cts
;;         _spi_byte
;;       _spi_byte
;;   _rx_init
;;     _fifo_reset
;;       _spi_write
;;         _check_cts
;;           _spi_byte
;;         _spi_byte
;;     _enable_rx_interrupt
;;       _spi_write
;;         _check_cts
;;           _spi_byte
;;         _spi_byte
;;     _clr_interrupt
;;       _spi_write
;;         _check_cts
;;           _spi_byte
;;         _spi_byte
;;       _spi_read
;;         _check_cts
;;           _spi_byte
;;         _spi_write
;;           _check_cts
;;             _spi_byte
;;           _spi_byte
;;         _spi_byte
;;     _rx_start
;;       _spi_write
;;         _check_cts
;;           _spi_byte
;;         _spi_byte
;;   _tx_data
;;     _fifo_reset
;;       _spi_write
;;         _check_cts
;;           _spi_byte
;;         _spi_byte
;;     _spi_write_fifo
;;       _check_cts
;;         _spi_byte
;;       _spi_byte
;;     _enable_tx_interrupt
;;       _spi_write
;;         _check_cts
;;           _spi_byte
;;         _spi_byte
;;     _clr_interrupt
;;       _spi_write
;;         _check_cts
;;           _spi_byte
;;         _spi_byte
;;       _spi_read
;;         _check_cts
;;           _spi_byte
;;         _spi_write
;;           _check_cts
;;             _spi_byte
;;           _spi_byte
;;         _spi_byte
;;     _tx_start
;;       _spi_write
;;         _check_cts
;;           _spi_byte
;;         _spi_byte
;;     _sdn_reset
;;       _delay_1ms
;;       _spi_byte
;;     _SI4463_init
;;       _spi_write
;;         _check_cts
;;           _spi_byte
;;         _spi_byte
;;   _clr_interrupt
;;     _spi_write
;;       _check_cts
;;         _spi_byte
;;       _spi_byte
;;     _spi_read
;;       _check_cts
;;         _spi_byte
;;       _spi_write
;;         _check_cts
;;           _spi_byte
;;         _spi_byte
;;       _spi_byte
;;   _spi_read_fifo
;;     _check_cts
;;       _spi_byte
;;     _spi_byte
;;   _fifo_reset
;;     _spi_write
;;       _check_cts
;;         _spi_byte
;;       _spi_byte
;;
;; _ISR_timer (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      C       C       1       85.7%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       6       2        0.0%
;;BANK0               50     16      48       3       90.0%
;;BITBANK1            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK1               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;BANK2               50      0       0       7        0.0%
;;ABS                  0      0      54       8        0.0%
;;BITBANK0            50      0       0       9        0.0%
;;DATA                 0      0      5A      10        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 119 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   21[BANK0 ] unsigned char 
;;  chksum          1   20[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_delay_x10ms
;;		_port_init
;;		_nop_10
;;		_timer1_init
;;		_sdn_reset
;;		_SI4463_init
;;		_rx_init
;;		_tx_data
;;		_clr_interrupt
;;		_spi_read_fifo
;;		_fifo_reset
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	119
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	121
	
l3218:	
;master.c: 120: unsigned char i,chksum;
;master.c: 121: OSCCON = 0X70;
	movlw	(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	123
	
l3220:	
;master.c: 123: WDTCON = 0X00;
	clrf	(151)^080h	;volatile
	line	124
	
l3222:	
;master.c: 124: delay_x10ms(50);
	movlw	032h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	126
	
l3224:	
;master.c: 126: port_init();
	fcall	_port_init
	line	127
	
l3226:	
;master.c: 127: nop_10();
	fcall	_nop_10
	line	129
	
l3228:	
;master.c: 129: RA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	130
	
l3230:	
;master.c: 130: RA1 = 0;
	bcf	(41/8),(41)&7
	line	131
	
l3232:	
;master.c: 131: timer1_init();
	fcall	_timer1_init
	line	133
	
l3234:	
# 133 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
nop ;#
psect	maintext
	line	135
	
l3236:	
;master.c: 135: sdn_reset();
	fcall	_sdn_reset
	line	136
	
l3238:	
;master.c: 136: SI4463_init();
	fcall	_SI4463_init
	line	137
	
l3240:	
;master.c: 137: rx_init();
	fcall	_rx_init
	line	139
	
l3242:	
;master.c: 139: count_1hz = 0;
	clrf	(_count_1hz)
	clrf	(_count_1hz+1)
	line	140
	
l3244:	
;master.c: 140: Flag.reach_1s = 0;
	bcf	(_Flag),0
	line	141
	
l3246:	
;master.c: 141: INTCON = 0xc0;
	movlw	(0C0h)
	movwf	(11)	;volatile
	line	144
	
l3248:	
;master.c: 143: {
;master.c: 144: if(Flag.reach_1s)
	btfss	(_Flag),0
	goto	u521
	goto	u520
u521:
	goto	l3254
u520:
	line	146
	
l3250:	
;master.c: 145: {
;master.c: 146: Flag.reach_1s = 0;
	bcf	(_Flag),0
	line	147
	
l3252:	
;master.c: 147: tx_data();
	fcall	_tx_data
	line	148
;master.c: 148: rx_init();
	fcall	_rx_init
	line	151
	
l3254:	
;master.c: 149: }
;master.c: 151: if(!Flag.is_tx)
	btfsc	(_Flag),1
	goto	u531
	goto	u530
u531:
	goto	l3248
u530:
	line	153
	
l3256:	
;master.c: 152: {
;master.c: 153: if(!RC2)
	btfsc	(58/8),(58)&7
	goto	u541
	goto	u540
u541:
	goto	l3248
u540:
	line	155
	
l3258:	
;master.c: 154: {
;master.c: 155: clr_interrupt();
	fcall	_clr_interrupt
	line	157
	
l3260:	
;master.c: 157: if((spi_read_buf[4] &0x08) == 0)
	btfsc	0+(_spi_read_buf)+04h,(3)&7
	goto	u551
	goto	u550
u551:
	goto	l3286
u550:
	line	159
	
l3262:	
;master.c: 158: {
;master.c: 159: spi_read_fifo();
	fcall	_spi_read_fifo
	line	160
	
l3264:	
;master.c: 160: fifo_reset();
	fcall	_fifo_reset
	line	162
	
l3266:	
;master.c: 162: chksum = 0;
	clrf	(main@chksum)
	line	163
	
l3268:	
;master.c: 163: for(i=4;i<14-1;i++)
	movlw	(04h)
	movwf	(main@i)
	line	164
	
l3274:	
;master.c: 164: chksum += rx_buf[i];
	movf	(main@i),w
	addlw	_rx_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	addwf	(main@chksum),f
	line	163
	
l3276:	
	incf	(main@i),f
	
l3278:	
	movlw	(0Dh)
	subwf	(main@i),w
	skipc
	goto	u561
	goto	u560
u561:
	goto	l3274
u560:
	line	166
	
l3280:	
;master.c: 166: if(( chksum == rx_buf[14-1] )&&( rx_buf[4] == 0x41 ))
	movf	0+(_rx_buf)+0Dh,w
	xorwf	(main@chksum),w
	skipz
	goto	u571
	goto	u570
u571:
	goto	l3286
u570:
	
l3282:	
	movf	0+(_rx_buf)+04h,w
	xorlw	041h
	skipz
	goto	u581
	goto	u580
u581:
	goto	l3286
u580:
	line	168
	
l3284:	
;master.c: 167: {
;master.c: 168: RA0 ^= 1;
	movlw	1<<((40)&7)
	xorwf	((40)/8),f
	line	169
;master.c: 169: }
	goto	l3248
	line	171
	
l3286:	
;master.c: 170: else
;master.c: 171: rx_init();
	fcall	_rx_init
	goto	l3248
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	180
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_tx_data
psect	text449,local,class=CODE,delta=2
global __ptext449
__ptext449:

;; *************** function _tx_data *****************
;; Defined at:
;;		line 457 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_fifo_reset
;;		_spi_write_fifo
;;		_enable_tx_interrupt
;;		_clr_interrupt
;;		_tx_start
;;		_sdn_reset
;;		_SI4463_init
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text449
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	457
	global	__size_of_tx_data
	__size_of_tx_data	equ	__end_of_tx_data-_tx_data
	
_tx_data:	
	opt	stack 1
; Regs used in _tx_data: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	459
	
l3196:	
;master.c: 459: Flag.is_tx = 1;
	bsf	(_Flag),1
	line	460
	
l3198:	
;master.c: 460: RA1 ^= 1;
	movlw	1<<((41)&7)
	xorwf	((41)/8),f
	line	461
	
l3200:	
;master.c: 461: fifo_reset();
	fcall	_fifo_reset
	line	462
	
l3202:	
;master.c: 462: spi_write_fifo();
	fcall	_spi_write_fifo
	line	463
	
l3204:	
;master.c: 463: enable_tx_interrupt();
	fcall	_enable_tx_interrupt
	line	464
	
l3206:	
;master.c: 464: clr_interrupt();
	fcall	_clr_interrupt
	line	465
	
l3208:	
;master.c: 465: tx_start();
	fcall	_tx_start
	line	466
	
l3210:	
;master.c: 466: rf_timeout = 0;
	clrf	(_rf_timeout)
	clrf	(_rf_timeout+1)
	line	467
	
l3212:	
;master.c: 467: Flag.rf_reach_timeout = 0;
	bcf	(_Flag),2
	line	469
;master.c: 469: while(RC2)
	goto	l891
	
l892:	
	line	471
# 471 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
CLRWDT ;#
psect	text449
	line	472
;master.c: 472: if(Flag.rf_reach_timeout)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_Flag),2
	goto	u501
	goto	u500
u501:
	goto	l891
u500:
	line	474
	
l3214:	
;master.c: 473: {
;master.c: 474: sdn_reset();
	fcall	_sdn_reset
	line	475
	
l3216:	
;master.c: 475: SI4463_init();
	fcall	_SI4463_init
	line	476
;master.c: 476: break;
	goto	l895
	line	478
	
l891:	
	line	469
	btfsc	(58/8),(58)&7
	goto	u511
	goto	u510
u511:
	goto	l892
u510:
	line	479
	
l895:	
	return
	opt stack 0
GLOBAL	__end_of_tx_data
	__end_of_tx_data:
;; =============== function _tx_data ends ============

	signat	_tx_data,88
	global	_rx_init
psect	text450,local,class=CODE,delta=2
global __ptext450
__ptext450:

;; *************** function _rx_init *****************
;; Defined at:
;;		line 448 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_fifo_reset
;;		_enable_rx_interrupt
;;		_clr_interrupt
;;		_rx_start
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text450
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	448
	global	__size_of_rx_init
	__size_of_rx_init	equ	__end_of_rx_init-_rx_init
	
_rx_init:	
	opt	stack 1
; Regs used in _rx_init: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	449
	
l3192:	
;master.c: 449: Flag.is_tx = 0;
	bcf	(_Flag),1
	line	450
	
l3194:	
;master.c: 450: fifo_reset();
	fcall	_fifo_reset
	line	451
;master.c: 451: enable_rx_interrupt();
	fcall	_enable_rx_interrupt
	line	452
;master.c: 452: clr_interrupt();
	fcall	_clr_interrupt
	line	453
;master.c: 453: rx_start();
	fcall	_rx_start
	line	454
	
l888:	
	return
	opt stack 0
GLOBAL	__end_of_rx_init
	__end_of_rx_init:
;; =============== function _rx_init ends ============

	signat	_rx_init,88
	global	_clr_interrupt
psect	text451,local,class=CODE,delta=2
global __ptext451
__ptext451:

;; *************** function _clr_interrupt *****************
;; Defined at:
;;		line 373 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  p               4    3[BANK0 ] unsigned char [4]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       4       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_spi_write
;;		_spi_read
;; This function is called by:
;;		_main
;;		_rx_init
;;		_tx_data
;; This function uses a non-reentrant model
;;
psect	text451
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	373
	global	__size_of_clr_interrupt
	__size_of_clr_interrupt	equ	__end_of_clr_interrupt-_clr_interrupt
	
_clr_interrupt:	
	opt	stack 2
; Regs used in _clr_interrupt: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	376
	
l3180:	
;master.c: 374: U8 p[4];
;master.c: 376: p[0] = 0x20;
	movlw	(020h)
	movwf	(clr_interrupt@p)
	line	377
	
l3182:	
;master.c: 377: p[1] = 0;
	clrf	0+(clr_interrupt@p)+01h
	line	378
	
l3184:	
;master.c: 378: p[2] = 0;
	clrf	0+(clr_interrupt@p)+02h
	line	379
	
l3186:	
;master.c: 379: p[3] = 0;
	clrf	0+(clr_interrupt@p)+03h
	line	380
	
l3188:	
;master.c: 380: spi_write(4,p);
	movlw	(clr_interrupt@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(04h)
	fcall	_spi_write
	line	381
	
l3190:	
;master.c: 381: spi_read(9,0x20);
	movlw	(020h)
	movwf	(?_spi_read)
	movlw	(09h)
	fcall	_spi_read
	line	382
	
l870:	
	return
	opt stack 0
GLOBAL	__end_of_clr_interrupt
	__end_of_clr_interrupt:
;; =============== function _clr_interrupt ends ============

	signat	_clr_interrupt,88
	global	_rx_start
psect	text452,local,class=CODE,delta=2
global __ptext452
__ptext452:

;; *************** function _rx_start *****************
;; Defined at:
;;		line 433 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  p               8    0[BANK0 ] unsigned char [8]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       8       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_spi_write
;; This function is called by:
;;		_rx_init
;; This function uses a non-reentrant model
;;
psect	text452
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	433
	global	__size_of_rx_start
	__size_of_rx_start	equ	__end_of_rx_start-_rx_start
	
_rx_start:	
	opt	stack 2
; Regs used in _rx_start: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	436
	
l3162:	
;master.c: 434: U8 p[8];
;master.c: 436: p[0] = 0x32 ;
	movlw	(032h)
	movwf	(rx_start@p)
	line	437
	
l3164:	
;master.c: 437: p[1] = 0 ;
	clrf	0+(rx_start@p)+01h
	line	438
	
l3166:	
;master.c: 438: p[2] = 0x00;
	clrf	0+(rx_start@p)+02h
	line	439
	
l3168:	
;master.c: 439: p[3] = 0;
	clrf	0+(rx_start@p)+03h
	line	440
	
l3170:	
;master.c: 440: p[4] = 0;
	clrf	0+(rx_start@p)+04h
	line	441
	
l3172:	
;master.c: 441: p[5] = 0;
	clrf	0+(rx_start@p)+05h
	line	442
	
l3174:	
;master.c: 442: p[6] = 0x08;
	movlw	(08h)
	movwf	0+(rx_start@p)+06h
	line	443
	
l3176:	
;master.c: 443: p[7] = 0x08;
	movlw	(08h)
	movwf	0+(rx_start@p)+07h
	line	444
	
l3178:	
;master.c: 444: spi_write(8, p);
	movlw	(rx_start@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(08h)
	fcall	_spi_write
	line	445
	
l885:	
	return
	opt stack 0
GLOBAL	__end_of_rx_start
	__end_of_rx_start:
;; =============== function _rx_start ends ============

	signat	_rx_start,88
	global	_tx_start
psect	text453,local,class=CODE,delta=2
global __ptext453
__ptext453:

;; *************** function _tx_start *****************
;; Defined at:
;;		line 421 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  p               5    0[BANK0 ] unsigned char [5]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       5       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_spi_write
;; This function is called by:
;;		_tx_data
;; This function uses a non-reentrant model
;;
psect	text453
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	421
	global	__size_of_tx_start
	__size_of_tx_start	equ	__end_of_tx_start-_tx_start
	
_tx_start:	
	opt	stack 2
; Regs used in _tx_start: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	424
	
l3154:	
;master.c: 422: U8 p[5];
;master.c: 424: p[0] = 0x31 ;
	movlw	(031h)
	movwf	(tx_start@p)
	line	425
	
l3156:	
;master.c: 425: p[1] = 0 ;
	clrf	0+(tx_start@p)+01h
	line	426
	
l3158:	
;master.c: 426: p[2] = 0x30;
	movlw	(030h)
	movwf	0+(tx_start@p)+02h
	line	427
;master.c: 427: p[3] = 0;
	clrf	0+(tx_start@p)+03h
	line	428
;master.c: 428: p[4] = 0;
	clrf	0+(tx_start@p)+04h
	line	429
	
l3160:	
;master.c: 429: spi_write(5, p);
	movlw	(tx_start@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	430
	
l882:	
	return
	opt stack 0
GLOBAL	__end_of_tx_start
	__end_of_tx_start:
;; =============== function _tx_start ends ============

	signat	_tx_start,88
	global	_enable_tx_interrupt
psect	text454,local,class=CODE,delta=2
global __ptext454
__ptext454:

;; *************** function _enable_tx_interrupt *****************
;; Defined at:
;;		line 399 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  p               6    0[BANK0 ] unsigned char [6]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       6       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_spi_write
;; This function is called by:
;;		_tx_data
;; This function uses a non-reentrant model
;;
psect	text454
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	399
	global	__size_of_enable_tx_interrupt
	__size_of_enable_tx_interrupt	equ	__end_of_enable_tx_interrupt-_enable_tx_interrupt
	
_enable_tx_interrupt:	
	opt	stack 2
; Regs used in _enable_tx_interrupt: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	402
	
l3142:	
;master.c: 400: U8 p[6];
;master.c: 402: p[0] = 0x11;
	movlw	(011h)
	movwf	(enable_tx_interrupt@p)
	line	403
	
l3144:	
;master.c: 403: p[1] = 0x01;
	clrf	0+(enable_tx_interrupt@p)+01h
	incf	0+(enable_tx_interrupt@p)+01h,f
	line	404
;master.c: 404: p[2] = 0x02;
	movlw	(02h)
	movwf	0+(enable_tx_interrupt@p)+02h
	line	405
	
l3146:	
;master.c: 405: p[3] = 0x00;
	clrf	0+(enable_tx_interrupt@p)+03h
	line	406
	
l3148:	
;master.c: 406: p[4] = 0x01;
	clrf	0+(enable_tx_interrupt@p)+04h
	incf	0+(enable_tx_interrupt@p)+04h,f
	line	407
	
l3150:	
;master.c: 407: p[5] = 0x20;
	movlw	(020h)
	movwf	0+(enable_tx_interrupt@p)+05h
	line	408
	
l3152:	
;master.c: 408: spi_write(0x06, p);
	movlw	(enable_tx_interrupt@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(06h)
	fcall	_spi_write
	line	409
	
l876:	
	return
	opt stack 0
GLOBAL	__end_of_enable_tx_interrupt
	__end_of_enable_tx_interrupt:
;; =============== function _enable_tx_interrupt ends ============

	signat	_enable_tx_interrupt,88
	global	_enable_rx_interrupt
psect	text455,local,class=CODE,delta=2
global __ptext455
__ptext455:

;; *************** function _enable_rx_interrupt *****************
;; Defined at:
;;		line 385 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  p               7    0[BANK0 ] unsigned char [7]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       7       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_spi_write
;; This function is called by:
;;		_rx_init
;; This function uses a non-reentrant model
;;
psect	text455
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	385
	global	__size_of_enable_rx_interrupt
	__size_of_enable_rx_interrupt	equ	__end_of_enable_rx_interrupt-_enable_rx_interrupt
	
_enable_rx_interrupt:	
	opt	stack 2
; Regs used in _enable_rx_interrupt: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	388
	
l3128:	
;master.c: 386: U8 p[7];
;master.c: 388: p[0] = 0x11;
	movlw	(011h)
	movwf	(enable_rx_interrupt@p)
	line	389
	
l3130:	
;master.c: 389: p[1] = 0x01;
	clrf	0+(enable_rx_interrupt@p)+01h
	incf	0+(enable_rx_interrupt@p)+01h,f
	line	390
;master.c: 390: p[2] = 0x03;
	movlw	(03h)
	movwf	0+(enable_rx_interrupt@p)+02h
	line	391
	
l3132:	
;master.c: 391: p[3] = 0x00;
	clrf	0+(enable_rx_interrupt@p)+03h
	line	392
	
l3134:	
;master.c: 392: p[4] = 0x03;
	movlw	(03h)
	movwf	0+(enable_rx_interrupt@p)+04h
	line	393
	
l3136:	
;master.c: 393: p[5] = 0x18;
	movlw	(018h)
	movwf	0+(enable_rx_interrupt@p)+05h
	line	394
	
l3138:	
;master.c: 394: p[6] = 0x00;
	clrf	0+(enable_rx_interrupt@p)+06h
	line	395
	
l3140:	
;master.c: 395: spi_write(0x07, p);
	movlw	(enable_rx_interrupt@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(07h)
	fcall	_spi_write
	line	396
	
l873:	
	return
	opt stack 0
GLOBAL	__end_of_enable_rx_interrupt
	__end_of_enable_rx_interrupt:
;; =============== function _enable_rx_interrupt ends ============

	signat	_enable_rx_interrupt,88
	global	_spi_read
psect	text456,local,class=CODE,delta=2
global __ptext456
__ptext456:

;; *************** function _spi_read *****************
;; Defined at:
;;		line 539 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;  data_length     1    wreg     unsigned char 
;;  api_command     1   10[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  data_length     1    0[BANK0 ] unsigned char 
;;  i               1    2[BANK0 ] unsigned char 
;;  p               1    1[BANK0 ] unsigned char [1]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         1       0       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       3       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_check_cts
;;		_spi_write
;;		_spi_byte
;; This function is called by:
;;		_clr_interrupt
;; This function uses a non-reentrant model
;;
psect	text456
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	539
	global	__size_of_spi_read
	__size_of_spi_read	equ	__end_of_spi_read-_spi_read
	
_spi_read:	
	opt	stack 2
; Regs used in _spi_read: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;spi_read@data_length stored from wreg
	line	543
	movwf	(spi_read@data_length)
	
l3102:	
;master.c: 540: U8 i;
;master.c: 542: U8 p[1];
;master.c: 543: p[0] = api_command;
	movf	(spi_read@api_command),w
	movwf	(spi_read@p)
	line	544
	
l3104:	
;master.c: 544: i = 0;
	clrf	(spi_read@i)
	line	545
;master.c: 545: while(i!=0xff)
	goto	l3108
	line	546
	
l3106:	
;master.c: 546: i = check_cts();
	fcall	_check_cts
	movwf	(spi_read@i)
	line	545
	
l3108:	
	movf	(spi_read@i),w
	xorlw	0FFh
	skipz
	goto	u471
	goto	u470
u471:
	goto	l3106
u470:
	line	548
	
l3110:	
;master.c: 548: spi_write(1, p);
	movlw	(spi_read@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(01h)
	fcall	_spi_write
	line	550
	
l3112:	
;master.c: 550: i = 0;
	clrf	(spi_read@i)
	line	551
;master.c: 551: while(i!=0xff)
	goto	l3116
	line	552
	
l3114:	
;master.c: 552: i = check_cts();
	fcall	_check_cts
	movwf	(spi_read@i)
	line	551
	
l3116:	
	movf	(spi_read@i),w
	xorlw	0FFh
	skipz
	goto	u481
	goto	u480
u481:
	goto	l3114
u480:
	
l924:	
	line	554
;master.c: 554: RC6 = 1;
	bsf	(62/8),(62)&7
	line	555
;master.c: 555: RC7 = 0;
	bcf	(63/8),(63)&7
	line	556
;master.c: 556: RC6 = 0;
	bcf	(62/8),(62)&7
	line	557
	
l3118:	
;master.c: 557: spi_byte(0x44);
	movlw	(044h)
	fcall	_spi_byte
	line	558
	
l3120:	
;master.c: 558: for (i = 0; i< data_length; i++)
	clrf	(spi_read@i)
	goto	l3126
	line	559
	
l3122:	
;master.c: 559: spi_read_buf[i] = spi_byte(0xff);
	movf	(spi_read@i),w
	addlw	_spi_read_buf&0ffh
	movwf	fsr0
	movlw	(0FFh)
	fcall	_spi_byte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	558
	
l3124:	
	incf	(spi_read@i),f
	
l3126:	
	movf	(spi_read@data_length),w
	subwf	(spi_read@i),w
	skipc
	goto	u491
	goto	u490
u491:
	goto	l3122
u490:
	
l927:	
	line	560
;master.c: 560: RC6 = 1;
	bsf	(62/8),(62)&7
	line	561
	
l928:	
	return
	opt stack 0
GLOBAL	__end_of_spi_read
	__end_of_spi_read:
;; =============== function _spi_read ends ============

	signat	_spi_read,8312
	global	_fifo_reset
psect	text457,local,class=CODE,delta=2
global __ptext457
__ptext457:

;; *************** function _fifo_reset *****************
;; Defined at:
;;		line 364 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  p               2   10[COMMON] unsigned char [2]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_spi_write
;; This function is called by:
;;		_main
;;		_rx_init
;;		_tx_data
;; This function uses a non-reentrant model
;;
psect	text457
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	364
	global	__size_of_fifo_reset
	__size_of_fifo_reset	equ	__end_of_fifo_reset-_fifo_reset
	
_fifo_reset:	
	opt	stack 3
; Regs used in _fifo_reset: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	367
	
l3098:	
;master.c: 365: U8 p[2];
;master.c: 367: p[0] = 0x15;
	movlw	(015h)
	movwf	(fifo_reset@p)
	line	368
;master.c: 368: p[1] = 0x03;
	movlw	(03h)
	movwf	0+(fifo_reset@p)+01h
	line	369
	
l3100:	
;master.c: 369: spi_write(2,p);
	movlw	(fifo_reset@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x00/2)
	movwf	(?_spi_write+1)
	movlw	(02h)
	fcall	_spi_write
	line	370
	
l867:	
	return
	opt stack 0
GLOBAL	__end_of_fifo_reset
	__end_of_fifo_reset:
;; =============== function _fifo_reset ends ============

	signat	_fifo_reset,88
	global	_SI4463_init
psect	text458,local,class=CODE,delta=2
global __ptext458
__ptext458:

;; *************** function _SI4463_init *****************
;; Defined at:
;;		line 183 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  app_command_   20    0[BANK0 ] unsigned char [20]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0      20       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0      20       0       0
;;Total ram usage:       20 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_spi_write
;; This function is called by:
;;		_main
;;		_tx_data
;; This function uses a non-reentrant model
;;
psect	text458
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	183
	global	__size_of_SI4463_init
	__size_of_SI4463_init	equ	__end_of_SI4463_init-_SI4463_init
	
_SI4463_init:	
	opt	stack 2
; Regs used in _SI4463_init: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	187
	
l2880:	
;master.c: 184: U8 app_command_buf[20];
;master.c: 187: app_command_buf[0] = 0x13;
	movlw	(013h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(SI4463_init@app_command_buf)
	line	188
;master.c: 188: app_command_buf[1] = 0x14;
	movlw	(014h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	189
;master.c: 189: app_command_buf[2] = 0x02;
	movlw	(02h)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	190
;master.c: 190: app_command_buf[3] = 0x21;
	movlw	(021h)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	191
;master.c: 191: app_command_buf[4] = 0x20;
	movlw	(020h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	192
;master.c: 192: app_command_buf[5] = 0x27;
	movlw	(027h)
	movwf	0+(SI4463_init@app_command_buf)+05h
	line	193
;master.c: 193: app_command_buf[6] = 0x0b;
	movlw	(0Bh)
	movwf	0+(SI4463_init@app_command_buf)+06h
	line	194
	
l2882:	
;master.c: 194: spi_write(7, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(07h)
	fcall	_spi_write
	line	197
	
l2884:	
;master.c: 197: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	198
	
l2886:	
;master.c: 198: app_command_buf[1] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+01h
	line	199
	
l2888:	
;master.c: 199: app_command_buf[2] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+02h
	incf	0+(SI4463_init@app_command_buf)+02h,f
	line	200
	
l2890:	
;master.c: 200: app_command_buf[3] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+03h
	line	201
	
l2892:	
;master.c: 201: app_command_buf[4] = 98;
	movlw	(062h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	202
	
l2894:	
;master.c: 202: spi_write(5, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	205
;master.c: 205: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	206
	
l2896:	
;master.c: 206: app_command_buf[1] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+01h
	line	207
	
l2898:	
;master.c: 207: app_command_buf[2] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+02h
	incf	0+(SI4463_init@app_command_buf)+02h,f
	line	208
	
l2900:	
;master.c: 208: app_command_buf[3] = 0x03;
	movlw	(03h)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	209
	
l2902:	
;master.c: 209: app_command_buf[4] = 0x40;
	movlw	(040h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	210
	
l2904:	
;master.c: 210: spi_write(5, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	212
	
l2906:	
;master.c: 212: spi_write(0x08, RF_FRR_CTL_A_MODE_4_data);
	movlw	low((_RF_FRR_CTL_A_MODE_4_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(08h)
	fcall	_spi_write
	line	215
	
l2908:	
;master.c: 215: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	216
	
l2910:	
;master.c: 216: app_command_buf[1] = 0x10;
	movlw	(010h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	217
	
l2912:	
;master.c: 217: app_command_buf[2] = 0x09;
	movlw	(09h)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	218
;master.c: 218: app_command_buf[3] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+03h
	line	219
	
l2914:	
;master.c: 219: app_command_buf[4] = 0x08;
	movlw	(08h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	220
	
l2916:	
;master.c: 220: app_command_buf[5] = 0x14;
	movlw	(014h)
	movwf	0+(SI4463_init@app_command_buf)+05h
	line	221
;master.c: 221: app_command_buf[6] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+06h
	line	222
	
l2918:	
;master.c: 222: app_command_buf[7] = 0x0f;
	movlw	(0Fh)
	movwf	0+(SI4463_init@app_command_buf)+07h
	line	223
	
l2920:	
;master.c: 223: app_command_buf[8] = 0x31;
	movlw	(031h)
	movwf	0+(SI4463_init@app_command_buf)+08h
	line	224
;master.c: 224: app_command_buf[9] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+09h
	line	225
;master.c: 225: app_command_buf[10] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Ah
	line	226
;master.c: 226: app_command_buf[11] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Bh
	line	227
;master.c: 227: app_command_buf[12] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Ch
	line	228
	
l2922:	
;master.c: 228: spi_write(13, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(0Dh)
	fcall	_spi_write
	line	231
	
l2924:	
;master.c: 231: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	232
	
l2926:	
;master.c: 232: app_command_buf[1] = 0x11;
	movlw	(011h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	233
	
l2928:	
;master.c: 233: app_command_buf[2] = 0x05;
	movlw	(05h)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	234
	
l2930:	
;master.c: 234: app_command_buf[3] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+03h
	line	235
	
l2932:	
;master.c: 235: app_command_buf[4] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+04h
	incf	0+(SI4463_init@app_command_buf)+04h,f
	line	236
	
l2934:	
;master.c: 236: app_command_buf[5] = 0x2d;
	movlw	(02Dh)
	movwf	0+(SI4463_init@app_command_buf)+05h
	line	237
	
l2936:	
;master.c: 237: app_command_buf[6] = 0xd4;
	movlw	(0D4h)
	movwf	0+(SI4463_init@app_command_buf)+06h
	line	238
	
l2938:	
;master.c: 238: app_command_buf[7] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+07h
	line	239
	
l2940:	
;master.c: 239: app_command_buf[8] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+08h
	line	240
	
l2942:	
;master.c: 240: spi_write(9, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(09h)
	fcall	_spi_write
	line	243
;master.c: 243: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	244
;master.c: 244: app_command_buf[1] = 0x12;
	movlw	(012h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	245
	
l2944:	
;master.c: 245: app_command_buf[2] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+02h
	incf	0+(SI4463_init@app_command_buf)+02h,f
	line	246
	
l2946:	
;master.c: 246: app_command_buf[3] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+03h
	line	247
	
l2948:	
;master.c: 247: app_command_buf[4] = 0x81;
	movlw	(081h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	248
	
l2950:	
;master.c: 248: spi_write(5, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	251
	
l2952:	
;master.c: 251: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	252
	
l2954:	
;master.c: 252: app_command_buf[1] = 0x12;
	movlw	(012h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	253
	
l2956:	
;master.c: 253: app_command_buf[2] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+02h
	incf	0+(SI4463_init@app_command_buf)+02h,f
	line	254
	
l2958:	
;master.c: 254: app_command_buf[3] = 0x06;
	movlw	(06h)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	255
	
l2960:	
;master.c: 255: app_command_buf[4] = 0x02;
	movlw	(02h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	256
	
l2962:	
;master.c: 256: spi_write(5, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	259
	
l2964:	
;master.c: 259: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	260
	
l2966:	
;master.c: 260: app_command_buf[1] = 0x12;
	movlw	(012h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	261
	
l2968:	
;master.c: 261: app_command_buf[2] = 0x03;
	movlw	(03h)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	262
	
l2970:	
;master.c: 262: app_command_buf[3] = 0x08;
	movlw	(08h)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	263
;master.c: 263: app_command_buf[4] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+04h
	line	264
;master.c: 264: app_command_buf[5] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+05h
	line	265
;master.c: 265: app_command_buf[6] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+06h
	line	266
	
l2972:	
;master.c: 266: spi_write(7, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(07h)
	fcall	_spi_write
	line	268
	
l2974:	
;master.c: 268: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	269
	
l2976:	
;master.c: 269: app_command_buf[1] = 0x12;
	movlw	(012h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	270
	
l2978:	
;master.c: 270: app_command_buf[2] = 0x0c;
	movlw	(0Ch)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	271
	
l2980:	
;master.c: 271: app_command_buf[3] = 0x0d;
	movlw	(0Dh)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	272
	
l2982:	
;master.c: 272: app_command_buf[4] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+04h
	line	273
	
l2984:	
;master.c: 273: app_command_buf[5] = 14;
	movlw	(0Eh)
	movwf	0+(SI4463_init@app_command_buf)+05h
	line	274
	
l2986:	
;master.c: 274: app_command_buf[6] = 0x04;
	movlw	(04h)
	movwf	0+(SI4463_init@app_command_buf)+06h
	line	275
	
l2988:	
;master.c: 275: app_command_buf[7] = 0xaa;
	movlw	(0AAh)
	movwf	0+(SI4463_init@app_command_buf)+07h
	line	276
	
l2990:	
;master.c: 276: app_command_buf[8] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+08h
	line	277
	
l2992:	
;master.c: 277: app_command_buf[9] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+09h
	line	278
	
l2994:	
;master.c: 278: app_command_buf[10] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Ah
	line	279
	
l2996:	
;master.c: 279: app_command_buf[11] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Bh
	line	280
	
l2998:	
;master.c: 280: app_command_buf[12] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Ch
	line	281
	
l3000:	
;master.c: 281: app_command_buf[13] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Dh
	line	282
	
l3002:	
;master.c: 282: app_command_buf[14] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Eh
	line	283
	
l3004:	
;master.c: 283: app_command_buf[15] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Fh
	line	284
	
l3006:	
;master.c: 284: spi_write(16, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	287
;master.c: 287: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	288
;master.c: 288: app_command_buf[1] = 0x12;
	movlw	(012h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	289
;master.c: 289: app_command_buf[2] = 0x08;
	movlw	(08h)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	290
;master.c: 290: app_command_buf[3] = 0x19;
	movlw	(019h)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	291
	
l3008:	
;master.c: 291: app_command_buf[4] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+04h
	line	292
	
l3010:	
;master.c: 292: app_command_buf[5] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+05h
	line	293
	
l3012:	
;master.c: 293: app_command_buf[6] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+06h
	line	294
	
l3014:	
;master.c: 294: app_command_buf[7] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+07h
	line	295
	
l3016:	
;master.c: 295: app_command_buf[8] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+08h
	line	296
	
l3018:	
;master.c: 296: app_command_buf[9] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+09h
	line	297
	
l3020:	
;master.c: 297: app_command_buf[10] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Ah
	line	298
	
l3022:	
;master.c: 298: app_command_buf[11] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Bh
	line	299
	
l3024:	
;master.c: 299: spi_write(12, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(0Ch)
	fcall	_spi_write
	line	301
	
l3026:	
;master.c: 301: spi_write(0x10, RF_MODEM_MOD_TYPE_12_data);
	movlw	low((_RF_MODEM_MOD_TYPE_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	302
	
l3028:	
;master.c: 302: spi_write(0x05, RF_MODEM_FREQ_DEV_0_1_data);
	movlw	low((_RF_MODEM_FREQ_DEV_0_1_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	304
	
l3030:	
;master.c: 304: spi_write(0x10, RF_MODEM_TX_RAMP_DELAY_12_data);
	movlw	low((_RF_MODEM_TX_RAMP_DELAY_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	305
	
l3032:	
;master.c: 305: spi_write(0x10, BCR_NCO_OFFSET_2_12_data);
	movlw	low((_BCR_NCO_OFFSET_2_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	306
	
l3034:	
;master.c: 306: spi_write(0x10, RF_MODEM_TX_RAMP_DELAY_12_data);
	movlw	low((_RF_MODEM_TX_RAMP_DELAY_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	307
	
l3036:	
;master.c: 307: spi_write(0x07, RF_MODEM_AFC_LIMITER_1_3_data);
	movlw	low((_RF_MODEM_AFC_LIMITER_1_3_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(07h)
	fcall	_spi_write
	line	310
	
l3038:	
;master.c: 310: spi_write(0x05, RF_MODEM_AGC_CONTROL_1_data);
	movlw	low((_RF_MODEM_AGC_CONTROL_1_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	311
	
l3040:	
;master.c: 311: spi_write(0x10, AGC_WINDOW_SIZE_12_data);
	movlw	low((_AGC_WINDOW_SIZE_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	312
	
l3042:	
;master.c: 312: spi_write(0x0c, RF_MODEM_RAW_CONTROL_8_data);
	movlw	low((_RF_MODEM_RAW_CONTROL_8_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(0Ch)
	fcall	_spi_write
	line	316
;master.c: 316: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	317
;master.c: 317: app_command_buf[1] = 0x20;
	movlw	(020h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	318
	
l3044:	
;master.c: 318: app_command_buf[2] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+02h
	incf	0+(SI4463_init@app_command_buf)+02h,f
	line	319
;master.c: 319: app_command_buf[3] = 0x4e;
	movlw	(04Eh)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	320
;master.c: 320: app_command_buf[4] = 0x40;
	movlw	(040h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	321
	
l3046:	
;master.c: 321: spi_write(5, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	323
	
l3048:	
;master.c: 323: spi_write(0x10, COE13_7_0_12_data);
	movlw	low((_COE13_7_0_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	324
	
l3050:	
;master.c: 324: spi_write(0x10, COE1_7_0_12_data);
	movlw	low((_COE1_7_0_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	325
	
l3052:	
;master.c: 325: spi_write(0x10, COE7_7_0_12_data);
	movlw	low((_COE7_7_0_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	328
;master.c: 328: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	329
;master.c: 329: app_command_buf[1] = 0x22;
	movlw	(022h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	330
;master.c: 330: app_command_buf[2] = 0x04;
	movlw	(04h)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	331
	
l3054:	
;master.c: 331: app_command_buf[3] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+03h
	line	332
	
l3056:	
;master.c: 332: app_command_buf[4] = 0x08;
	movlw	(08h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	333
	
l3058:	
;master.c: 333: app_command_buf[5] = 127;
	movlw	(07Fh)
	movwf	0+(SI4463_init@app_command_buf)+05h
	line	334
	
l3060:	
;master.c: 334: app_command_buf[6] =0x00;
	clrf	0+(SI4463_init@app_command_buf)+06h
	line	335
;master.c: 335: app_command_buf[7] = 0x3d;
	movlw	(03Dh)
	movwf	0+(SI4463_init@app_command_buf)+07h
	line	336
	
l3062:	
;master.c: 336: spi_write(8, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(08h)
	fcall	_spi_write
	line	338
	
l3064:	
;master.c: 338: spi_write(0x0B, RF_SYNTH_PFDCP_CPFF_7_data);
	movlw	low((_RF_SYNTH_PFDCP_CPFF_7_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(0Bh)
	fcall	_spi_write
	line	341
;master.c: 341: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	342
;master.c: 342: app_command_buf[1] = 0x30;
	movlw	(030h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	343
;master.c: 343: app_command_buf[2] = 0x0c;
	movlw	(0Ch)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	344
	
l3066:	
;master.c: 344: app_command_buf[3] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+03h
	line	345
	
l3068:	
;master.c: 345: app_command_buf[4] = 's';
	movlw	(073h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	346
	
l3070:	
;master.c: 346: app_command_buf[5] = 0xff;
	movlw	(0FFh)
	movwf	0+(SI4463_init@app_command_buf)+05h
	line	347
	
l3072:	
;master.c: 347: app_command_buf[6] = 0x40;
	movlw	(040h)
	movwf	0+(SI4463_init@app_command_buf)+06h
	line	348
	
l3074:	
;master.c: 348: app_command_buf[7] = 'w';
	movlw	(077h)
	movwf	0+(SI4463_init@app_command_buf)+07h
	line	349
	
l3076:	
;master.c: 349: app_command_buf[8] = 0xff;
	movlw	(0FFh)
	movwf	0+(SI4463_init@app_command_buf)+08h
	line	350
	
l3078:	
;master.c: 350: app_command_buf[9] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+09h
	incf	0+(SI4463_init@app_command_buf)+09h,f
	line	351
	
l3080:	
;master.c: 351: app_command_buf[10] = 'w';
	movlw	(077h)
	movwf	0+(SI4463_init@app_command_buf)+0Ah
	line	352
	
l3082:	
;master.c: 352: app_command_buf[11] =0xff;
	movlw	(0FFh)
	movwf	0+(SI4463_init@app_command_buf)+0Bh
	line	353
	
l3084:	
;master.c: 353: app_command_buf[12] =0x02;
	movlw	(02h)
	movwf	0+(SI4463_init@app_command_buf)+0Ch
	line	354
	
l3086:	
;master.c: 354: app_command_buf[13] = 'x';
	movlw	(078h)
	movwf	0+(SI4463_init@app_command_buf)+0Dh
	line	355
	
l3088:	
;master.c: 355: app_command_buf[14] = 0xff;
	movlw	(0FFh)
	movwf	0+(SI4463_init@app_command_buf)+0Eh
	line	356
	
l3090:	
;master.c: 356: app_command_buf[15] =0x03;
	movlw	(03h)
	movwf	0+(SI4463_init@app_command_buf)+0Fh
	line	357
	
l3092:	
;master.c: 357: spi_write(16, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	359
	
l3094:	
;master.c: 359: spi_write(6, RF_MODEM_RAW_SEARCH2_2_data);
	movlw	low((_RF_MODEM_RAW_SEARCH2_2_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(06h)
	fcall	_spi_write
	line	360
	
l3096:	
;master.c: 360: spi_write(12, RF_FREQ_CONTROL_INTE_8_data);
	movlw	low((_RF_FREQ_CONTROL_INTE_8_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(0Ch)
	fcall	_spi_write
	line	361
	
l864:	
	return
	opt stack 0
GLOBAL	__end_of_SI4463_init
	__end_of_SI4463_init:
;; =============== function _SI4463_init ends ============

	signat	_SI4463_init,88
	global	_spi_write_fifo
psect	text459,local,class=CODE,delta=2
global __ptext459
__ptext459:

;; *************** function _spi_write_fifo *****************
;; Defined at:
;;		line 564 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_check_cts
;;		_spi_byte
;; This function is called by:
;;		_tx_data
;; This function uses a non-reentrant model
;;
psect	text459
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	564
	global	__size_of_spi_write_fifo
	__size_of_spi_write_fifo	equ	__end_of_spi_write_fifo-_spi_write_fifo
	
_spi_write_fifo:	
	opt	stack 3
; Regs used in _spi_write_fifo: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	567
	
l2860:	
;master.c: 565: U8 i;
;master.c: 567: i = 0;
	clrf	(spi_write_fifo@i)
	line	568
;master.c: 568: while(i!=0xff)
	goto	l2864
	line	569
	
l2862:	
;master.c: 569: i = check_cts();
	fcall	_check_cts
	movwf	(spi_write_fifo@i)
	line	568
	
l2864:	
	movf	(spi_write_fifo@i),w
	xorlw	0FFh
	skipz
	goto	u451
	goto	u450
u451:
	goto	l2862
u450:
	
l933:	
	line	570
;master.c: 570: RC6 = 1;
	bsf	(62/8),(62)&7
	line	571
;master.c: 571: RC7 = 0;
	bcf	(63/8),(63)&7
	line	572
;master.c: 572: RC6 = 0;
	bcf	(62/8),(62)&7
	line	573
	
l2866:	
;master.c: 573: spi_byte(0x66);
	movlw	(066h)
	fcall	_spi_byte
	line	574
	
l2868:	
;master.c: 574: for (i = 0; i< 14; i++)
	clrf	(spi_write_fifo@i)
	line	576
	
l2874:	
;master.c: 575: {
;master.c: 576: spi_byte(tx_ph_data[i]);
	movf	(spi_write_fifo@i),w
	addlw	low((_tx_ph_data-__stringbase))
	movwf	fsr0
	fcall	stringdir
	fcall	_spi_byte
	line	574
	
l2876:	
	incf	(spi_write_fifo@i),f
	
l2878:	
	movlw	(0Eh)
	subwf	(spi_write_fifo@i),w
	skipc
	goto	u461
	goto	u460
u461:
	goto	l2874
u460:
	
l935:	
	line	578
;master.c: 577: }
;master.c: 578: RC6 = 1;
	bsf	(62/8),(62)&7
	line	579
	
l936:	
	return
	opt stack 0
GLOBAL	__end_of_spi_write_fifo
	__end_of_spi_write_fifo:
;; =============== function _spi_write_fifo ends ============

	signat	_spi_write_fifo,88
	global	_spi_write
psect	text460,local,class=CODE,delta=2
global __ptext460
__ptext460:

;; *************** function _spi_write *****************
;; Defined at:
;;		line 506 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;  tx_length       1    wreg     unsigned char 
;;  p               2    5[COMMON] PTR unsigned char 
;;		 -> spi_read@p(1), rx_start@p(8), tx_start@p(5), rf_standby@p(2), 
;;		 -> enable_tx_interrupt@p(6), enable_rx_interrupt@p(7), clr_interrupt@p(4), fifo_reset@p(2), 
;;		 -> RF_FREQ_CONTROL_INTE_8_data(12), RF_MODEM_RAW_SEARCH2_2_data(6), RF_SYNTH_PFDCP_CPFF_7_data(11), COE7_7_0_12_data(16), 
;;		 -> COE1_7_0_12_data(16), COE13_7_0_12_data(16), RF_MODEM_RAW_CONTROL_8_data(12), AGC_WINDOW_SIZE_12_data(16), 
;;		 -> RF_MODEM_AGC_CONTROL_1_data(5), RF_MODEM_AFC_LIMITER_1_3_data(7), BCR_NCO_OFFSET_2_12_data(16), RF_MODEM_TX_RAMP_DELAY_12_data(16), 
;;		 -> RF_MODEM_FREQ_DEV_0_1_data(5), RF_MODEM_MOD_TYPE_12_data(16), RF_FRR_CTL_A_MODE_4_data(8), SI4463_init@app_command_buf(20), 
;; Auto vars:     Size  Location     Type
;;  tx_length       1    7[COMMON] unsigned char 
;;  i               1    9[COMMON] unsigned char 
;;  j               1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         3       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_check_cts
;;		_spi_byte
;; This function is called by:
;;		_SI4463_init
;;		_fifo_reset
;;		_clr_interrupt
;;		_enable_rx_interrupt
;;		_enable_tx_interrupt
;;		_tx_start
;;		_rx_start
;;		_spi_read
;; This function uses a non-reentrant model
;;
psect	text460
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	506
	global	__size_of_spi_write
	__size_of_spi_write	equ	__end_of_spi_write-_spi_write
	
_spi_write:	
	opt	stack 3
; Regs used in _spi_write: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;spi_write@tx_length stored from wreg
	line	509
	movwf	(spi_write@tx_length)
	
l2844:	
;master.c: 507: unsigned char i,j;
;master.c: 509: i = 0;
	clrf	(spi_write@i)
	line	510
;master.c: 510: while(i!=0xff)
	goto	l2848
	line	511
	
l2846:	
;master.c: 511: i = check_cts();
	fcall	_check_cts
	movwf	(spi_write@i)
	line	510
	
l2848:	
	movf	(spi_write@i),w
	xorlw	0FFh
	skipz
	goto	u431
	goto	u430
u431:
	goto	l2846
u430:
	
l909:	
	line	513
;master.c: 513: RC7 = 0;
	bcf	(63/8),(63)&7
	line	514
;master.c: 514: RC6 = 0;
	bcf	(62/8),(62)&7
	line	516
	
l2850:	
;master.c: 516: for (i = 0; i < tx_length; i++)
	clrf	(spi_write@i)
	goto	l2858
	line	518
	
l2852:	
;master.c: 517: {
;master.c: 518: j = *(p+i);
	movf	(spi_write@i),w
	addwf	(spi_write@p),w
	movwf	fsr0
	movf	(spi_write@p+1),w
	skipnc
	incf	(spi_write@p+1),w
	movwf	btemp+1
	fcall	stringtab
	movwf	(spi_write@j)
	line	519
	
l2854:	
;master.c: 519: spi_byte(j);
	movf	(spi_write@j),w
	fcall	_spi_byte
	line	516
	
l2856:	
	incf	(spi_write@i),f
	
l2858:	
	movf	(spi_write@tx_length),w
	subwf	(spi_write@i),w
	skipc
	goto	u441
	goto	u440
u441:
	goto	l2852
u440:
	
l912:	
	line	522
;master.c: 520: }
;master.c: 522: RC6 = 1;
	bsf	(62/8),(62)&7
	line	523
	
l913:	
	return
	opt stack 0
GLOBAL	__end_of_spi_write
	__end_of_spi_write:
;; =============== function _spi_write ends ============

	signat	_spi_write,8312
	global	_spi_read_fifo
psect	text461,local,class=CODE,delta=2
global __ptext461
__ptext461:

;; *************** function _spi_read_fifo *****************
;; Defined at:
;;		line 582 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_check_cts
;;		_spi_byte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text461
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	582
	global	__size_of_spi_read_fifo
	__size_of_spi_read_fifo	equ	__end_of_spi_read_fifo-_spi_read_fifo
	
_spi_read_fifo:	
	opt	stack 4
; Regs used in _spi_read_fifo: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	585
	
l2824:	
;master.c: 583: U8 i;
;master.c: 585: i = 0;
	clrf	(spi_read_fifo@i)
	line	586
;master.c: 586: while(i!=0xff)
	goto	l2828
	line	587
	
l2826:	
;master.c: 587: i = check_cts();
	fcall	_check_cts
	movwf	(spi_read_fifo@i)
	line	586
	
l2828:	
	movf	(spi_read_fifo@i),w
	xorlw	0FFh
	skipz
	goto	u411
	goto	u410
u411:
	goto	l2826
u410:
	
l941:	
	line	589
;master.c: 589: RC6 = 1;
	bsf	(62/8),(62)&7
	line	590
;master.c: 590: RC7 = 0;
	bcf	(63/8),(63)&7
	line	591
;master.c: 591: RC6 = 0;
	bcf	(62/8),(62)&7
	line	592
	
l2830:	
;master.c: 592: spi_byte(0x77);
	movlw	(077h)
	fcall	_spi_byte
	line	593
	
l2832:	
;master.c: 593: for (i = 0; i< 14; i++)
	clrf	(spi_read_fifo@i)
	line	594
	
l2838:	
;master.c: 594: rx_buf[i] = spi_byte(0xff);
	movf	(spi_read_fifo@i),w
	addlw	_rx_buf&0ffh
	movwf	fsr0
	movlw	(0FFh)
	fcall	_spi_byte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	593
	
l2840:	
	incf	(spi_read_fifo@i),f
	
l2842:	
	movlw	(0Eh)
	subwf	(spi_read_fifo@i),w
	skipc
	goto	u421
	goto	u420
u421:
	goto	l2838
u420:
	
l943:	
	line	595
;master.c: 595: RC6 = 1;
	bsf	(62/8),(62)&7
	line	596
	
l944:	
	return
	opt stack 0
GLOBAL	__end_of_spi_read_fifo
	__end_of_spi_read_fifo:
;; =============== function _spi_read_fifo ends ============

	signat	_spi_read_fifo,88
	global	_check_cts
psect	text462,local,class=CODE,delta=2
global __ptext462
__ptext462:

;; *************** function _check_cts *****************
;; Defined at:
;;		line 526 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_spi_byte
;; This function is called by:
;;		_spi_write
;;		_spi_read
;;		_spi_write_fifo
;;		_spi_read_fifo
;; This function uses a non-reentrant model
;;
psect	text462
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	526
	global	__size_of_check_cts
	__size_of_check_cts	equ	__end_of_check_cts-_check_cts
	
_check_cts:	
	opt	stack 3
; Regs used in _check_cts: [wreg+status,2+status,0+pclath+cstack]
	line	529
	
l2814:	
;master.c: 527: U8 i;
;master.c: 529: RC6 = 1;
	bsf	(62/8),(62)&7
	line	530
;master.c: 530: RC7 = 0;
	bcf	(63/8),(63)&7
	line	531
;master.c: 531: RC6 = 0;
	bcf	(62/8),(62)&7
	line	532
	
l2816:	
;master.c: 532: spi_byte(0x44);
	movlw	(044h)
	fcall	_spi_byte
	line	533
;master.c: 533: i = spi_byte(0);
	movlw	(0)
	fcall	_spi_byte
	movwf	(check_cts@i)
	line	534
	
l2818:	
;master.c: 534: RC6 = 1;
	bsf	(62/8),(62)&7
	line	535
	
l2820:	
;master.c: 535: return (i);
	movf	(check_cts@i),w
	line	536
	
l916:	
	return
	opt stack 0
GLOBAL	__end_of_check_cts
	__end_of_check_cts:
;; =============== function _check_cts ends ============

	signat	_check_cts,89
	global	_sdn_reset
psect	text463,local,class=CODE,delta=2
global __ptext463
__ptext463:

;; *************** function _sdn_reset *****************
;; Defined at:
;;		line 599 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_1ms
;;		_spi_byte
;; This function is called by:
;;		_main
;;		_tx_data
;; This function uses a non-reentrant model
;;
psect	text463
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	599
	global	__size_of_sdn_reset
	__size_of_sdn_reset	equ	__end_of_sdn_reset-_sdn_reset
	
_sdn_reset:	
	opt	stack 4
; Regs used in _sdn_reset: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	602
	
l2788:	
;master.c: 600: U8 i;
;master.c: 602: RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(57/8),(57)&7
	line	603
	
l2790:	
;master.c: 603: delay_1ms(2);
	movlw	02h
	movwf	(?_delay_1ms)
	clrf	(?_delay_1ms+1)
	fcall	_delay_1ms
	line	604
	
l2792:	
;master.c: 604: RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(57/8),(57)&7
	line	605
;master.c: 605: delay_1ms(10);
	movlw	0Ah
	movwf	(?_delay_1ms)
	clrf	(?_delay_1ms+1)
	fcall	_delay_1ms
	line	607
	
l2794:	
;master.c: 607: RC6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	608
	
l2796:	
;master.c: 608: RC7 = 0;
	bcf	(63/8),(63)&7
	line	609
	
l2798:	
;master.c: 609: RC6 = 0;
	bcf	(62/8),(62)&7
	line	610
	
l2800:	
;master.c: 610: for (i = 0; i< 7; i++)
	clrf	(sdn_reset@i)
	line	611
	
l2806:	
;master.c: 611: spi_byte(RF_POWER_UP_data[i]);
	movf	(sdn_reset@i),w
	addlw	low((_RF_POWER_UP_data-__stringbase))
	movwf	fsr0
	fcall	stringdir
	fcall	_spi_byte
	line	610
	
l2808:	
	incf	(sdn_reset@i),f
	
l2810:	
	movlw	(07h)
	subwf	(sdn_reset@i),w
	skipc
	goto	u401
	goto	u400
u401:
	goto	l2806
u400:
	
l948:	
	line	612
;master.c: 612: RC6 = 1;
	bsf	(62/8),(62)&7
	line	614
	
l2812:	
;master.c: 614: delay_1ms(20);
	movlw	014h
	movwf	(?_delay_1ms)
	clrf	(?_delay_1ms+1)
	fcall	_delay_1ms
	line	615
	
l949:	
	return
	opt stack 0
GLOBAL	__end_of_sdn_reset
	__end_of_sdn_reset:
;; =============== function _sdn_reset ends ============

	signat	_sdn_reset,88
	global	_delay_x10ms
psect	text464,local,class=CODE,delta=2
global __ptext464
__ptext464:

;; *************** function _delay_x10ms *****************
;; Defined at:
;;		line 658 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;  dx10ms          2    4[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  j               2    6[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_10ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text464
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	658
	global	__size_of_delay_x10ms
	__size_of_delay_x10ms	equ	__end_of_delay_x10ms-_delay_x10ms
	
_delay_x10ms:	
	opt	stack 5
; Regs used in _delay_x10ms: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	661
	
l2780:	
;master.c: 659: unsigned int j;
;master.c: 661: for(j = 0; j<dx10ms; j++)
	clrf	(delay_x10ms@j)
	clrf	(delay_x10ms@j+1)
	goto	l2786
	line	662
	
l2782:	
;master.c: 662: delay_10ms();
	fcall	_delay_10ms
	line	661
	
l2784:	
	incf	(delay_x10ms@j),f
	skipnz
	incf	(delay_x10ms@j+1),f
	
l2786:	
	movf	(delay_x10ms@dx10ms+1),w
	subwf	(delay_x10ms@j+1),w
	skipz
	goto	u395
	movf	(delay_x10ms@dx10ms),w
	subwf	(delay_x10ms@j),w
u395:
	skipc
	goto	u391
	goto	u390
u391:
	goto	l2782
u390:
	line	663
	
l971:	
	return
	opt stack 0
GLOBAL	__end_of_delay_x10ms
	__end_of_delay_x10ms:
;; =============== function _delay_x10ms ends ============

	signat	_delay_x10ms,4216
	global	_delay_10ms
psect	text465,local,class=CODE,delta=2
global __ptext465
__ptext465:

;; *************** function _delay_10ms *****************
;; Defined at:
;;		line 644 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    2[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_delay_x10ms
;; This function uses a non-reentrant model
;;
psect	text465
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	644
	global	__size_of_delay_10ms
	__size_of_delay_10ms	equ	__end_of_delay_10ms-_delay_10ms
	
_delay_10ms:	
	opt	stack 5
; Regs used in _delay_10ms: [wreg+status,2+status,0+btemp+1]
	line	647
	
l2748:	
;master.c: 645: int i;
;master.c: 647: for(i = 0; i<2472; i++)
	clrf	(delay_10ms@i)
	clrf	(delay_10ms@i+1)
	
l2754:	
;master.c: 648: {
;master.c: 649: ;
	incf	(delay_10ms@i),f
	skipnz
	incf	(delay_10ms@i+1),f
	
l2756:	
	movf	(delay_10ms@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(09A8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u355
	movlw	low(09A8h)
	subwf	(delay_10ms@i),w
u355:

	skipc
	goto	u351
	goto	u350
u351:
	goto	l2754
u350:
	
l964:	
	line	652
# 652 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
CLRWDT ;#
psect	text465
	line	654
	
l965:	
	return
	opt stack 0
GLOBAL	__end_of_delay_10ms
	__end_of_delay_10ms:
;; =============== function _delay_10ms ends ============

	signat	_delay_10ms,88
	global	_delay_1ms
psect	text466,local,class=CODE,delta=2
global __ptext466
__ptext466:

;; *************** function _delay_1ms *****************
;; Defined at:
;;		line 630 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;  delay_time      2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  i               2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         2       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_sdn_reset
;; This function uses a non-reentrant model
;;
psect	text466
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	630
	global	__size_of_delay_1ms
	__size_of_delay_1ms	equ	__end_of_delay_1ms-_delay_1ms
	
_delay_1ms:	
	opt	stack 4
; Regs used in _delay_1ms: [wreg+status,2+status,0]
	line	632
	
l2732:	
;master.c: 631: unsigned int i;
;master.c: 632: while(delay_time !=0)
	goto	l2746
	line	634
	
l2734:	
;master.c: 633: {
;master.c: 634: for (i =380; i!=0; i--)
	movlw	low(017Ch)
	movwf	(delay_1ms@i)
	movlw	high(017Ch)
	movwf	((delay_1ms@i))+1
	line	635
	
l957:	
	line	636
# 636 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
NOP ;#
	line	637
# 637 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
NOP ;#
psect	text466
	line	634
	
l2740:	
	movlw	low(01h)
	subwf	(delay_1ms@i),f
	movlw	high(01h)
	skipc
	decf	(delay_1ms@i+1),f
	subwf	(delay_1ms@i+1),f
	
l2742:	
	movf	((delay_1ms@i+1)),w
	iorwf	((delay_1ms@i)),w
	skipz
	goto	u331
	goto	u330
u331:
	goto	l957
u330:
	line	639
	
l2744:	
;master.c: 638: }
;master.c: 639: delay_time--;
	movlw	low(01h)
	subwf	(delay_1ms@delay_time),f
	movlw	high(01h)
	skipc
	decf	(delay_1ms@delay_time+1),f
	subwf	(delay_1ms@delay_time+1),f
	line	632
	
l2746:	
	movf	((delay_1ms@delay_time+1)),w
	iorwf	((delay_1ms@delay_time)),w
	skipz
	goto	u341
	goto	u340
u341:
	goto	l2734
u340:
	line	641
	
l960:	
	return
	opt stack 0
GLOBAL	__end_of_delay_1ms
	__end_of_delay_1ms:
;; =============== function _delay_1ms ends ============

	signat	_delay_1ms,4216
	global	_spi_byte
psect	text467,local,class=CODE,delta=2
global __ptext467
__ptext467:

;; *************** function _spi_byte *****************
;; Defined at:
;;		line 482 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    3[COMMON] unsigned char 
;;  i               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_spi_write
;;		_check_cts
;;		_spi_read
;;		_spi_write_fifo
;;		_spi_read_fifo
;;		_sdn_reset
;; This function uses a non-reentrant model
;;
psect	text467
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	482
	global	__size_of_spi_byte
	__size_of_spi_byte	equ	__end_of_spi_byte-_spi_byte
	
_spi_byte:	
	opt	stack 4
; Regs used in _spi_byte: [wreg+status,2+status,0]
;spi_byte@data stored from wreg
	line	485
	movwf	(spi_byte@data)
	
l2714:	
;master.c: 483: unsigned char i;
;master.c: 485: for (i = 0; i < 8; i++)
	clrf	(spi_byte@i)
	line	486
	
l898:	
	line	487
;master.c: 486: {
;master.c: 487: if (data & 0x80)
	btfss	(spi_byte@data),(7)&7
	goto	u301
	goto	u300
u301:
	goto	l900
u300:
	line	488
	
l2720:	
;master.c: 488: RC5 = 1;
	bsf	(61/8),(61)&7
	goto	l901
	line	489
	
l900:	
	line	490
;master.c: 489: else
;master.c: 490: RC5 = 0;
	bcf	(61/8),(61)&7
	
l901:	
	line	492
;master.c: 492: data <<= 1;
	clrc
	rlf	(spi_byte@data),f
	line	493
;master.c: 493: RC7 = 1;
	bsf	(63/8),(63)&7
	line	495
;master.c: 495: if (RC4)
	btfss	(60/8),(60)&7
	goto	u311
	goto	u310
u311:
	goto	l902
u310:
	line	496
	
l2722:	
;master.c: 496: data |= 0x01;
	bsf	(spi_byte@data)+(0/8),(0)&7
	goto	l903
	line	497
	
l902:	
	line	498
;master.c: 497: else
;master.c: 498: data &= 0xfe;
	bcf	(spi_byte@data)+(0/8),(0)&7
	
l903:	
	line	500
;master.c: 500: RC7 = 0;
	bcf	(63/8),(63)&7
	line	485
	
l2724:	
	incf	(spi_byte@i),f
	
l2726:	
	movlw	(08h)
	subwf	(spi_byte@i),w
	skipc
	goto	u321
	goto	u320
u321:
	goto	l898
u320:
	line	502
	
l2728:	
;master.c: 501: }
;master.c: 502: return (data);
	movf	(spi_byte@data),w
	line	503
	
l904:	
	return
	opt stack 0
GLOBAL	__end_of_spi_byte
	__end_of_spi_byte:
;; =============== function _spi_byte ends ============

	signat	_spi_byte,4217
	global	_timer1_init
psect	text468,local,class=CODE,delta=2
global __ptext468
__ptext468:

;; *************** function _timer1_init *****************
;; Defined at:
;;		line 680 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text468
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	680
	global	__size_of_timer1_init
	__size_of_timer1_init	equ	__end_of_timer1_init-_timer1_init
	
_timer1_init:	
	opt	stack 6
; Regs used in _timer1_init: [wreg]
	line	681
	
l2710:	
;master.c: 681: T1CON = 0x31;
	movlw	(031h)
	movwf	(16)	;volatile
	line	682
	
l2712:	
;master.c: 682: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	683
;master.c: 683: TMR1L = 0x78;
	movlw	(078h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(14)	;volatile
	line	684
;master.c: 684: TMR1H = 0xec;
	movlw	(0ECh)
	movwf	(15)	;volatile
	line	686
	
l977:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_init
	__end_of_timer1_init:
;; =============== function _timer1_init ends ============

	signat	_timer1_init,88
	global	_nop_10
psect	text469,local,class=CODE,delta=2
global __ptext469
__ptext469:

;; *************** function _nop_10 *****************
;; Defined at:
;;		line 666 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text469
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	666
	global	__size_of_nop_10
	__size_of_nop_10	equ	__end_of_nop_10-_nop_10
	
_nop_10:	
	opt	stack 6
; Regs used in _nop_10: []
	line	667
	
l2708:	
# 667 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
NOP ;#
	line	668
# 668 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
NOP ;#
	line	669
# 669 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
NOP ;#
	line	670
# 670 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
NOP ;#
	line	671
# 671 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
NOP ;#
	line	672
# 672 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
NOP ;#
	line	673
# 673 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
NOP ;#
	line	674
# 674 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
NOP ;#
	line	675
# 675 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
NOP ;#
	line	676
# 676 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
NOP ;#
psect	text469
	line	677
	
l974:	
	return
	opt stack 0
GLOBAL	__end_of_nop_10
	__end_of_nop_10:
;; =============== function _nop_10 ends ============

	signat	_nop_10,88
	global	_port_init
psect	text470,local,class=CODE,delta=2
global __ptext470
__ptext470:

;; *************** function _port_init *****************
;; Defined at:
;;		line 619 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text470
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	619
	global	__size_of_port_init
	__size_of_port_init	equ	__end_of_port_init-_port_init
	
_port_init:	
	opt	stack 6
; Regs used in _port_init: [wreg+status,2]
	line	620
	
l2696:	
;master.c: 620: ANSEL=0X00;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(286)^0100h	;volatile
	line	621
;master.c: 621: ANSELH=0X00;
	clrf	(287)^0100h	;volatile
	line	622
	
l2698:	
;master.c: 622: WPUA=0X17;
	movlw	(017h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	623
	
l2700:	
;master.c: 623: IOCA=0X00;
	clrf	(150)^080h	;volatile
	line	624
	
l2702:	
;master.c: 624: TRISA=0X00;
	clrf	(133)^080h	;volatile
	line	625
	
l2704:	
;master.c: 625: TRISC=0X1D;
	movlw	(01Dh)
	movwf	(135)^080h	;volatile
	line	626
	
l2706:	
;master.c: 626: PORTC=0X80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	627
	
l952:	
	return
	opt stack 0
GLOBAL	__end_of_port_init
	__end_of_port_init:
;; =============== function _port_init ends ============

	signat	_port_init,88
	global	_ISR_timer
psect	text471,local,class=CODE,delta=2
global __ptext471
__ptext471:

;; *************** function _ISR_timer *****************
;; Defined at:
;;		line 689 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          2       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text471
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\master\master.c"
	line	689
	global	__size_of_ISR_timer
	__size_of_ISR_timer	equ	__end_of_ISR_timer-_ISR_timer
	
_ISR_timer:	
	opt	stack 1
; Regs used in _ISR_timer: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR_timer+0)
	movf	pclath,w
	movwf	(??_ISR_timer+1)
	ljmp	_ISR_timer
psect	text471
	line	690
	
i1l2758:	
;master.c: 690: if(TMR1IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u36_21
	goto	u36_20
u36_21:
	goto	i1l983
u36_20:
	line	693
	
i1l2760:	
;master.c: 691: {
;master.c: 693: TMR1L = 0x78;
	movlw	(078h)
	movwf	(14)	;volatile
	line	694
;master.c: 694: TMR1H = 0xec;
	movlw	(0ECh)
	movwf	(15)	;volatile
	line	696
	
i1l2762:	
;master.c: 696: rf_timeout++;
	incf	(_rf_timeout),f
	skipnz
	incf	(_rf_timeout+1),f
	line	697
	
i1l2764:	
;master.c: 697: if(rf_timeout == 20)
		movf	(_rf_timeout),w
	xorlw	20
	iorwf	(_rf_timeout+1),w

	skipz
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l2770
u37_20:
	line	699
	
i1l2766:	
;master.c: 698: {
;master.c: 699: rf_timeout=0;
	clrf	(_rf_timeout)
	clrf	(_rf_timeout+1)
	line	700
	
i1l2768:	
;master.c: 700: Flag.rf_reach_timeout = 1;
	bsf	(_Flag),2
	line	703
	
i1l2770:	
;master.c: 701: }
;master.c: 703: count_1hz++;
	incf	(_count_1hz),f
	skipnz
	incf	(_count_1hz+1),f
	line	704
	
i1l2772:	
;master.c: 704: if(count_1hz==60)
		movf	(_count_1hz),w
	xorlw	60
	iorwf	(_count_1hz+1),w

	skipz
	goto	u38_21
	goto	u38_20
u38_21:
	goto	i1l2778
u38_20:
	line	706
	
i1l2774:	
;master.c: 705: {
;master.c: 706: count_1hz=0;
	clrf	(_count_1hz)
	clrf	(_count_1hz+1)
	line	707
	
i1l2776:	
;master.c: 707: Flag.reach_1s = 1;
	bsf	(_Flag),0
	line	711
	
i1l2778:	
;master.c: 709: }
;master.c: 711: TMR1IF=0;
	bcf	(96/8),(96)&7
	line	714
	
i1l983:	
	movf	(??_ISR_timer+1),w
	movwf	pclath
	swapf	(??_ISR_timer+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR_timer
	__end_of_ISR_timer:
;; =============== function _ISR_timer ends ============

	signat	_ISR_timer,88
psect	text472,local,class=CODE,delta=2
global __ptext472
__ptext472:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
