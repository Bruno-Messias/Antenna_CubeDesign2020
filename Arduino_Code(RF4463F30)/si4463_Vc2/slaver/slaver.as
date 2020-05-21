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
	FNCALL	_main,_clr_interrupt
	FNCALL	_main,_spi_read_fifo
	FNCALL	_main,_fifo_reset
	FNCALL	_main,_delay_1ms
	FNCALL	_main,_tx_data
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	88
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	69
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	79
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	77
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	81
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	82
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	83
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	75
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	76
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	68
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	80
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	84
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	71
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	78
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	85
_RF_MODEM_RAW_SEARCH2_2_data:
	retlw	011h
	retlw	020h
	retlw	02h
	retlw	050h
	retlw	084h
	retlw	0Ah
	global	_RF_MODEM_AGC_CONTROL_1_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	74
_RF_MODEM_AGC_CONTROL_1_data:
	retlw	011h
	retlw	020h
	retlw	01h
	retlw	035h
	retlw	0E2h
	global	_RF_MODEM_FREQ_DEV_0_1_data
psect	strings
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	73
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
	file	"slaver.as"
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
	global	?_clr_interrupt
?_clr_interrupt:	; 0 bytes @ 0x0
	global	?_spi_read_fifo
?_spi_read_fifo:	; 0 bytes @ 0x0
	global	?_fifo_reset
?_fifo_reset:	; 0 bytes @ 0x0
	global	?_tx_data
?_tx_data:	; 0 bytes @ 0x0
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
	global	??_delay_1ms
??_delay_1ms:	; 0 bytes @ 0x4
	global	??_check_cts
??_check_cts:	; 0 bytes @ 0x4
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
;; (0) _main                                                 2     2      0   14074
;;                                             20 BANK0      2     2      0
;;                        _delay_x10ms
;;                          _port_init
;;                             _nop_10
;;                        _timer1_init
;;                          _sdn_reset
;;                        _SI4463_init
;;                            _rx_init
;;                      _clr_interrupt
;;                      _spi_read_fifo
;;                         _fifo_reset
;;                          _delay_1ms
;;                            _tx_data
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
;; (2) _clr_interrupt                                        4     4      0    1159
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
;; (3) _spi_read                                             4     3      1     717
;;                                             10 COMMON     1     0      1
;;                                              0 BANK0      3     3      0
;;                          _check_cts
;;                          _spi_write
;;                           _spi_byte
;; ---------------------------------------------------------------------------------
;; (2) _fifo_reset                                           2     2      0     394
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
;; (3) _spi_write                                            5     3      2     346
;;                                              5 COMMON     5     3      2
;;                          _check_cts
;;                           _spi_byte
;; ---------------------------------------------------------------------------------
;; (1) _spi_read_fifo                                        1     1      0     301
;;                                              5 COMMON     1     1      0
;;                          _check_cts
;;                           _spi_byte
;; ---------------------------------------------------------------------------------
;; (4) _check_cts                                            1     1      0     116
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
;; (4) _spi_byte                                             2     2      0      93
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _delay_1ms                                            4     2      2      69
;;                                              2 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (1) _timer1_init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _nop_10                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _port_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
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
;;   _delay_1ms
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
;;		line 126 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
;;		_clr_interrupt
;;		_spi_read_fifo
;;		_fifo_reset
;;		_delay_1ms
;;		_tx_data
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	126
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	128
	
l3217:	
;slaver.c: 127: unsigned char i,chksum;
;slaver.c: 128: OSCCON = 0X70;
	movlw	(070h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	130
	
l3219:	
;slaver.c: 130: WDTCON = 0X00;
	clrf	(151)^080h	;volatile
	line	131
	
l3221:	
;slaver.c: 131: delay_x10ms(50);
	movlw	032h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	133
	
l3223:	
;slaver.c: 133: port_init();
	fcall	_port_init
	line	134
	
l3225:	
;slaver.c: 134: nop_10();
	fcall	_nop_10
	line	136
	
l3227:	
;slaver.c: 136: RA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	137
	
l3229:	
;slaver.c: 137: RA1 = 0;
	bcf	(41/8),(41)&7
	line	138
	
l3231:	
;slaver.c: 138: timer1_init();
	fcall	_timer1_init
	line	140
	
l3233:	
# 140 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
nop ;#
psect	maintext
	line	142
	
l3235:	
;slaver.c: 142: sdn_reset();
	fcall	_sdn_reset
	line	143
	
l3237:	
;slaver.c: 143: SI4463_init();
	fcall	_SI4463_init
	line	144
	
l3239:	
;slaver.c: 144: rx_init();
	fcall	_rx_init
	line	146
	
l3241:	
;slaver.c: 146: count_1hz = 0;
	clrf	(_count_1hz)
	clrf	(_count_1hz+1)
	line	147
	
l3243:	
;slaver.c: 147: Flag.reach_1s = 0;
	bcf	(_Flag),0
	line	148
	
l3245:	
;slaver.c: 148: INTCON = 0xc0;
	movlw	(0C0h)
	movwf	(11)	;volatile
	line	151
	
l3247:	
;slaver.c: 150: {
;slaver.c: 151: if(!Flag.is_tx)
	btfsc	(_Flag),1
	goto	u511
	goto	u510
u511:
	goto	l3247
u510:
	line	153
	
l3249:	
;slaver.c: 152: {
;slaver.c: 153: if(!RC2)
	btfsc	(58/8),(58)&7
	goto	u521
	goto	u520
u521:
	goto	l3247
u520:
	line	155
	
l3251:	
;slaver.c: 154: {
;slaver.c: 155: clr_interrupt();
	fcall	_clr_interrupt
	line	157
	
l3253:	
;slaver.c: 157: if((spi_read_buf[4] &0x08) == 0)
	btfsc	0+(_spi_read_buf)+04h,(3)&7
	goto	u531
	goto	u530
u531:
	goto	l3283
u530:
	line	159
	
l3255:	
;slaver.c: 158: {
;slaver.c: 159: spi_read_fifo();
	fcall	_spi_read_fifo
	line	160
	
l3257:	
;slaver.c: 160: fifo_reset();
	fcall	_fifo_reset
	line	162
	
l3259:	
;slaver.c: 162: chksum = 0;
	clrf	(main@chksum)
	line	163
	
l3261:	
;slaver.c: 163: for(i=4;i<14-1;i++)
	movlw	(04h)
	movwf	(main@i)
	line	164
	
l3267:	
;slaver.c: 164: chksum += rx_buf[i];
	movf	(main@i),w
	addlw	_rx_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	addwf	(main@chksum),f
	line	163
	
l3269:	
	incf	(main@i),f
	
l3271:	
	movlw	(0Dh)
	subwf	(main@i),w
	skipc
	goto	u541
	goto	u540
u541:
	goto	l3267
u540:
	line	166
	
l3273:	
;slaver.c: 166: if(( chksum == rx_buf[14-1] )&&( rx_buf[4] == 0x41 ))
	movf	0+(_rx_buf)+0Dh,w
	xorwf	(main@chksum),w
	skipz
	goto	u551
	goto	u550
u551:
	goto	l3283
u550:
	
l3275:	
	movf	0+(_rx_buf)+04h,w
	xorlw	041h
	skipz
	goto	u561
	goto	u560
u561:
	goto	l3283
u560:
	line	168
	
l3277:	
;slaver.c: 167: {
;slaver.c: 168: RA0 ^= 1;
	movlw	1<<((40)&7)
	xorwf	((40)/8),f
	line	169
	
l3279:	
;slaver.c: 169: delay_1ms(100);
	movlw	064h
	movwf	(?_delay_1ms)
	clrf	(?_delay_1ms+1)
	fcall	_delay_1ms
	line	170
	
l3281:	
;slaver.c: 170: tx_data();
	fcall	_tx_data
	line	171
	
l3283:	
;slaver.c: 171: rx_init();
	fcall	_rx_init
	line	172
;slaver.c: 172: }
	goto	l3247
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	183
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
;;		line 459 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	459
	global	__size_of_tx_data
	__size_of_tx_data	equ	__end_of_tx_data-_tx_data
	
_tx_data:	
	opt	stack 1
; Regs used in _tx_data: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	460
	
l3195:	
;slaver.c: 460: Flag.is_tx = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(_Flag),1
	line	461
	
l3197:	
;slaver.c: 461: RA1 ^= 1;
	movlw	1<<((41)&7)
	xorwf	((41)/8),f
	line	462
	
l3199:	
;slaver.c: 462: fifo_reset();
	fcall	_fifo_reset
	line	463
	
l3201:	
;slaver.c: 463: spi_write_fifo();
	fcall	_spi_write_fifo
	line	464
	
l3203:	
;slaver.c: 464: enable_tx_interrupt();
	fcall	_enable_tx_interrupt
	line	465
	
l3205:	
;slaver.c: 465: clr_interrupt();
	fcall	_clr_interrupt
	line	466
	
l3207:	
;slaver.c: 466: tx_start();
	fcall	_tx_start
	line	467
	
l3209:	
;slaver.c: 467: rf_timeout = 0;
	clrf	(_rf_timeout)
	clrf	(_rf_timeout+1)
	line	468
	
l3211:	
;slaver.c: 468: Flag.rf_reach_timeout = 0;
	bcf	(_Flag),2
	line	470
;slaver.c: 470: while(RC2)
	goto	l890
	
l891:	
	line	472
# 472 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
CLRWDT ;#
psect	text449
	line	473
;slaver.c: 473: if(Flag.rf_reach_timeout)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(_Flag),2
	goto	u491
	goto	u490
u491:
	goto	l890
u490:
	line	475
	
l3213:	
;slaver.c: 474: {
;slaver.c: 475: sdn_reset();
	fcall	_sdn_reset
	line	476
	
l3215:	
;slaver.c: 476: SI4463_init();
	fcall	_SI4463_init
	line	477
;slaver.c: 477: break;
	goto	l894
	line	479
	
l890:	
	line	470
	btfsc	(58/8),(58)&7
	goto	u501
	goto	u500
u501:
	goto	l891
u500:
	line	480
	
l894:	
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
;;		line 450 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	450
	global	__size_of_rx_init
	__size_of_rx_init	equ	__end_of_rx_init-_rx_init
	
_rx_init:	
	opt	stack 1
; Regs used in _rx_init: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	451
	
l3191:	
;slaver.c: 451: Flag.is_tx = 0;
	bcf	(_Flag),1
	line	452
	
l3193:	
;slaver.c: 452: fifo_reset();
	fcall	_fifo_reset
	line	453
;slaver.c: 453: enable_rx_interrupt();
	fcall	_enable_rx_interrupt
	line	454
;slaver.c: 454: clr_interrupt();
	fcall	_clr_interrupt
	line	455
;slaver.c: 455: rx_start();
	fcall	_rx_start
	line	456
	
l887:	
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
;;		line 375 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	375
	global	__size_of_clr_interrupt
	__size_of_clr_interrupt	equ	__end_of_clr_interrupt-_clr_interrupt
	
_clr_interrupt:	
	opt	stack 1
; Regs used in _clr_interrupt: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	378
	
l3179:	
;slaver.c: 376: U8 p[4];
;slaver.c: 378: p[0] = 0x20;
	movlw	(020h)
	movwf	(clr_interrupt@p)
	line	379
	
l3181:	
;slaver.c: 379: p[1] = 0;
	clrf	0+(clr_interrupt@p)+01h
	line	380
	
l3183:	
;slaver.c: 380: p[2] = 0;
	clrf	0+(clr_interrupt@p)+02h
	line	381
	
l3185:	
;slaver.c: 381: p[3] = 0;
	clrf	0+(clr_interrupt@p)+03h
	line	382
	
l3187:	
;slaver.c: 382: spi_write(4,p);
	movlw	(clr_interrupt@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(04h)
	fcall	_spi_write
	line	383
	
l3189:	
;slaver.c: 383: spi_read(9,0x20);
	movlw	(020h)
	movwf	(?_spi_read)
	movlw	(09h)
	fcall	_spi_read
	line	384
	
l869:	
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
;;		line 435 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	435
	global	__size_of_rx_start
	__size_of_rx_start	equ	__end_of_rx_start-_rx_start
	
_rx_start:	
	opt	stack 2
; Regs used in _rx_start: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	438
	
l3161:	
;slaver.c: 436: U8 p[8];
;slaver.c: 438: p[0] = 0x32 ;
	movlw	(032h)
	movwf	(rx_start@p)
	line	439
	
l3163:	
;slaver.c: 439: p[1] = 0 ;
	clrf	0+(rx_start@p)+01h
	line	440
	
l3165:	
;slaver.c: 440: p[2] = 0x00;
	clrf	0+(rx_start@p)+02h
	line	441
	
l3167:	
;slaver.c: 441: p[3] = 0;
	clrf	0+(rx_start@p)+03h
	line	442
	
l3169:	
;slaver.c: 442: p[4] = 0;
	clrf	0+(rx_start@p)+04h
	line	443
	
l3171:	
;slaver.c: 443: p[5] = 0;
	clrf	0+(rx_start@p)+05h
	line	444
	
l3173:	
;slaver.c: 444: p[6] = 0x08;
	movlw	(08h)
	movwf	0+(rx_start@p)+06h
	line	445
	
l3175:	
;slaver.c: 445: p[7] = 0x08;
	movlw	(08h)
	movwf	0+(rx_start@p)+07h
	line	446
	
l3177:	
;slaver.c: 446: spi_write(8, p);
	movlw	(rx_start@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(08h)
	fcall	_spi_write
	line	447
	
l884:	
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
;;		line 423 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	423
	global	__size_of_tx_start
	__size_of_tx_start	equ	__end_of_tx_start-_tx_start
	
_tx_start:	
	opt	stack 2
; Regs used in _tx_start: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	426
	
l3153:	
;slaver.c: 424: U8 p[5];
;slaver.c: 426: p[0] = 0x31 ;
	movlw	(031h)
	movwf	(tx_start@p)
	line	427
	
l3155:	
;slaver.c: 427: p[1] = 0 ;
	clrf	0+(tx_start@p)+01h
	line	428
	
l3157:	
;slaver.c: 428: p[2] = 0x30;
	movlw	(030h)
	movwf	0+(tx_start@p)+02h
	line	429
;slaver.c: 429: p[3] = 0;
	clrf	0+(tx_start@p)+03h
	line	430
;slaver.c: 430: p[4] = 0;
	clrf	0+(tx_start@p)+04h
	line	431
	
l3159:	
;slaver.c: 431: spi_write(5, p);
	movlw	(tx_start@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	432
	
l881:	
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
;;		line 401 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	401
	global	__size_of_enable_tx_interrupt
	__size_of_enable_tx_interrupt	equ	__end_of_enable_tx_interrupt-_enable_tx_interrupt
	
_enable_tx_interrupt:	
	opt	stack 2
; Regs used in _enable_tx_interrupt: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	404
	
l3141:	
;slaver.c: 402: U8 p[6];
;slaver.c: 404: p[0] = 0x11;
	movlw	(011h)
	movwf	(enable_tx_interrupt@p)
	line	405
	
l3143:	
;slaver.c: 405: p[1] = 0x01;
	clrf	0+(enable_tx_interrupt@p)+01h
	incf	0+(enable_tx_interrupt@p)+01h,f
	line	406
;slaver.c: 406: p[2] = 0x02;
	movlw	(02h)
	movwf	0+(enable_tx_interrupt@p)+02h
	line	407
	
l3145:	
;slaver.c: 407: p[3] = 0x00;
	clrf	0+(enable_tx_interrupt@p)+03h
	line	408
	
l3147:	
;slaver.c: 408: p[4] = 0x01;
	clrf	0+(enable_tx_interrupt@p)+04h
	incf	0+(enable_tx_interrupt@p)+04h,f
	line	409
	
l3149:	
;slaver.c: 409: p[5] = 0x20;
	movlw	(020h)
	movwf	0+(enable_tx_interrupt@p)+05h
	line	410
	
l3151:	
;slaver.c: 410: spi_write(0x06, p);
	movlw	(enable_tx_interrupt@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(06h)
	fcall	_spi_write
	line	411
	
l875:	
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
;;		line 387 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	387
	global	__size_of_enable_rx_interrupt
	__size_of_enable_rx_interrupt	equ	__end_of_enable_rx_interrupt-_enable_rx_interrupt
	
_enable_rx_interrupt:	
	opt	stack 2
; Regs used in _enable_rx_interrupt: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	390
	
l3127:	
;slaver.c: 388: U8 p[7];
;slaver.c: 390: p[0] = 0x11;
	movlw	(011h)
	movwf	(enable_rx_interrupt@p)
	line	391
	
l3129:	
;slaver.c: 391: p[1] = 0x01;
	clrf	0+(enable_rx_interrupt@p)+01h
	incf	0+(enable_rx_interrupt@p)+01h,f
	line	392
;slaver.c: 392: p[2] = 0x03;
	movlw	(03h)
	movwf	0+(enable_rx_interrupt@p)+02h
	line	393
	
l3131:	
;slaver.c: 393: p[3] = 0x00;
	clrf	0+(enable_rx_interrupt@p)+03h
	line	394
	
l3133:	
;slaver.c: 394: p[4] = 0x03;
	movlw	(03h)
	movwf	0+(enable_rx_interrupt@p)+04h
	line	395
	
l3135:	
;slaver.c: 395: p[5] = 0x18;
	movlw	(018h)
	movwf	0+(enable_rx_interrupt@p)+05h
	line	396
	
l3137:	
;slaver.c: 396: p[6] = 0x00;
	clrf	0+(enable_rx_interrupt@p)+06h
	line	397
	
l3139:	
;slaver.c: 397: spi_write(0x07, p);
	movlw	(enable_rx_interrupt@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(07h)
	fcall	_spi_write
	line	398
	
l872:	
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
;;		line 540 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	540
	global	__size_of_spi_read
	__size_of_spi_read	equ	__end_of_spi_read-_spi_read
	
_spi_read:	
	opt	stack 1
; Regs used in _spi_read: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;spi_read@data_length stored from wreg
	line	544
	movwf	(spi_read@data_length)
	
l3101:	
;slaver.c: 541: U8 i;
;slaver.c: 543: U8 p[1];
;slaver.c: 544: p[0] = api_command;
	movf	(spi_read@api_command),w
	movwf	(spi_read@p)
	line	545
	
l3103:	
;slaver.c: 545: i = 0;
	clrf	(spi_read@i)
	line	546
;slaver.c: 546: while(i!=0xff)
	goto	l3107
	line	547
	
l3105:	
;slaver.c: 547: i = check_cts();
	fcall	_check_cts
	movwf	(spi_read@i)
	line	546
	
l3107:	
	movf	(spi_read@i),w
	xorlw	0FFh
	skipz
	goto	u461
	goto	u460
u461:
	goto	l3105
u460:
	line	549
	
l3109:	
;slaver.c: 549: spi_write(1, p);
	movlw	(spi_read@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(01h)
	fcall	_spi_write
	line	551
	
l3111:	
;slaver.c: 551: i = 0;
	clrf	(spi_read@i)
	line	552
;slaver.c: 552: while(i!=0xff)
	goto	l3115
	line	553
	
l3113:	
;slaver.c: 553: i = check_cts();
	fcall	_check_cts
	movwf	(spi_read@i)
	line	552
	
l3115:	
	movf	(spi_read@i),w
	xorlw	0FFh
	skipz
	goto	u471
	goto	u470
u471:
	goto	l3113
u470:
	
l923:	
	line	555
;slaver.c: 555: RC6 = 1;
	bsf	(62/8),(62)&7
	line	556
;slaver.c: 556: RC7 = 0;
	bcf	(63/8),(63)&7
	line	557
;slaver.c: 557: RC6 = 0;
	bcf	(62/8),(62)&7
	line	558
	
l3117:	
;slaver.c: 558: spi_byte(0x44);
	movlw	(044h)
	fcall	_spi_byte
	line	559
	
l3119:	
;slaver.c: 559: for (i = 0; i< data_length; i++)
	clrf	(spi_read@i)
	goto	l3125
	line	560
	
l3121:	
;slaver.c: 560: spi_read_buf[i] = spi_byte(0xff);
	movf	(spi_read@i),w
	addlw	_spi_read_buf&0ffh
	movwf	fsr0
	movlw	(0FFh)
	fcall	_spi_byte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	559
	
l3123:	
	incf	(spi_read@i),f
	
l3125:	
	movf	(spi_read@data_length),w
	subwf	(spi_read@i),w
	skipc
	goto	u481
	goto	u480
u481:
	goto	l3121
u480:
	
l926:	
	line	561
;slaver.c: 561: RC6 = 1;
	bsf	(62/8),(62)&7
	line	562
	
l927:	
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
;;		line 366 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	366
	global	__size_of_fifo_reset
	__size_of_fifo_reset	equ	__end_of_fifo_reset-_fifo_reset
	
_fifo_reset:	
	opt	stack 2
; Regs used in _fifo_reset: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	369
	
l3097:	
;slaver.c: 367: U8 p[2];
;slaver.c: 369: p[0] = 0x15;
	movlw	(015h)
	movwf	(fifo_reset@p)
	line	370
;slaver.c: 370: p[1] = 0x03;
	movlw	(03h)
	movwf	0+(fifo_reset@p)+01h
	line	371
	
l3099:	
;slaver.c: 371: spi_write(2,p);
	movlw	(fifo_reset@p&0ffh)
	movwf	(?_spi_write)
	movlw	(0x00/2)
	movwf	(?_spi_write+1)
	movlw	(02h)
	fcall	_spi_write
	line	372
	
l866:	
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
;;		line 186 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	186
	global	__size_of_SI4463_init
	__size_of_SI4463_init	equ	__end_of_SI4463_init-_SI4463_init
	
_SI4463_init:	
	opt	stack 2
; Regs used in _SI4463_init: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	189
	
l2879:	
;slaver.c: 187: U8 app_command_buf[20];
;slaver.c: 189: app_command_buf[0] = 0x13;
	movlw	(013h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(SI4463_init@app_command_buf)
	line	190
;slaver.c: 190: app_command_buf[1] = 0x14;
	movlw	(014h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	191
;slaver.c: 191: app_command_buf[2] = 0x02;
	movlw	(02h)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	192
;slaver.c: 192: app_command_buf[3] = 0x21;
	movlw	(021h)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	193
;slaver.c: 193: app_command_buf[4] = 0x20;
	movlw	(020h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	194
;slaver.c: 194: app_command_buf[5] = 0x27;
	movlw	(027h)
	movwf	0+(SI4463_init@app_command_buf)+05h
	line	195
;slaver.c: 195: app_command_buf[6] = 0x0b;
	movlw	(0Bh)
	movwf	0+(SI4463_init@app_command_buf)+06h
	line	196
	
l2881:	
;slaver.c: 196: spi_write(7, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(07h)
	fcall	_spi_write
	line	199
	
l2883:	
;slaver.c: 199: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	200
	
l2885:	
;slaver.c: 200: app_command_buf[1] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+01h
	line	201
	
l2887:	
;slaver.c: 201: app_command_buf[2] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+02h
	incf	0+(SI4463_init@app_command_buf)+02h,f
	line	202
	
l2889:	
;slaver.c: 202: app_command_buf[3] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+03h
	line	203
	
l2891:	
;slaver.c: 203: app_command_buf[4] = 98;
	movlw	(062h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	204
	
l2893:	
;slaver.c: 204: spi_write(5, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	207
;slaver.c: 207: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	208
	
l2895:	
;slaver.c: 208: app_command_buf[1] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+01h
	line	209
	
l2897:	
;slaver.c: 209: app_command_buf[2] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+02h
	incf	0+(SI4463_init@app_command_buf)+02h,f
	line	210
	
l2899:	
;slaver.c: 210: app_command_buf[3] = 0x03;
	movlw	(03h)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	211
	
l2901:	
;slaver.c: 211: app_command_buf[4] = 0x40;
	movlw	(040h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	212
	
l2903:	
;slaver.c: 212: spi_write(5, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	214
	
l2905:	
;slaver.c: 214: spi_write(0x08, RF_FRR_CTL_A_MODE_4_data);
	movlw	low((_RF_FRR_CTL_A_MODE_4_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(08h)
	fcall	_spi_write
	line	217
	
l2907:	
;slaver.c: 217: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	218
	
l2909:	
;slaver.c: 218: app_command_buf[1] = 0x10;
	movlw	(010h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	219
	
l2911:	
;slaver.c: 219: app_command_buf[2] = 0x09;
	movlw	(09h)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	220
;slaver.c: 220: app_command_buf[3] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+03h
	line	221
	
l2913:	
;slaver.c: 221: app_command_buf[4] = 0x08;
	movlw	(08h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	222
	
l2915:	
;slaver.c: 222: app_command_buf[5] = 0x14;
	movlw	(014h)
	movwf	0+(SI4463_init@app_command_buf)+05h
	line	223
;slaver.c: 223: app_command_buf[6] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+06h
	line	224
	
l2917:	
;slaver.c: 224: app_command_buf[7] = 0x0f;
	movlw	(0Fh)
	movwf	0+(SI4463_init@app_command_buf)+07h
	line	225
	
l2919:	
;slaver.c: 225: app_command_buf[8] = 0x31;
	movlw	(031h)
	movwf	0+(SI4463_init@app_command_buf)+08h
	line	226
;slaver.c: 226: app_command_buf[9] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+09h
	line	227
;slaver.c: 227: app_command_buf[10] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Ah
	line	228
;slaver.c: 228: app_command_buf[11] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Bh
	line	229
;slaver.c: 229: app_command_buf[12] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Ch
	line	230
	
l2921:	
;slaver.c: 230: spi_write(13, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(0Dh)
	fcall	_spi_write
	line	233
	
l2923:	
;slaver.c: 233: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	234
	
l2925:	
;slaver.c: 234: app_command_buf[1] = 0x11;
	movlw	(011h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	235
	
l2927:	
;slaver.c: 235: app_command_buf[2] = 0x05;
	movlw	(05h)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	236
	
l2929:	
;slaver.c: 236: app_command_buf[3] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+03h
	line	237
	
l2931:	
;slaver.c: 237: app_command_buf[4] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+04h
	incf	0+(SI4463_init@app_command_buf)+04h,f
	line	238
	
l2933:	
;slaver.c: 238: app_command_buf[5] = 0x2d;
	movlw	(02Dh)
	movwf	0+(SI4463_init@app_command_buf)+05h
	line	239
	
l2935:	
;slaver.c: 239: app_command_buf[6] = 0xd4;
	movlw	(0D4h)
	movwf	0+(SI4463_init@app_command_buf)+06h
	line	240
	
l2937:	
;slaver.c: 240: app_command_buf[7] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+07h
	line	241
	
l2939:	
;slaver.c: 241: app_command_buf[8] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+08h
	line	242
	
l2941:	
;slaver.c: 242: spi_write(9, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(09h)
	fcall	_spi_write
	line	245
;slaver.c: 245: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	246
;slaver.c: 246: app_command_buf[1] = 0x12;
	movlw	(012h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	247
	
l2943:	
;slaver.c: 247: app_command_buf[2] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+02h
	incf	0+(SI4463_init@app_command_buf)+02h,f
	line	248
	
l2945:	
;slaver.c: 248: app_command_buf[3] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+03h
	line	249
	
l2947:	
;slaver.c: 249: app_command_buf[4] = 0x81;
	movlw	(081h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	250
	
l2949:	
;slaver.c: 250: spi_write(5, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	253
	
l2951:	
;slaver.c: 253: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	254
	
l2953:	
;slaver.c: 254: app_command_buf[1] = 0x12;
	movlw	(012h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	255
	
l2955:	
;slaver.c: 255: app_command_buf[2] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+02h
	incf	0+(SI4463_init@app_command_buf)+02h,f
	line	256
	
l2957:	
;slaver.c: 256: app_command_buf[3] = 0x06;
	movlw	(06h)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	257
	
l2959:	
;slaver.c: 257: app_command_buf[4] = 0x02;
	movlw	(02h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	258
	
l2961:	
;slaver.c: 258: spi_write(5, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	261
	
l2963:	
;slaver.c: 261: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	262
	
l2965:	
;slaver.c: 262: app_command_buf[1] = 0x12;
	movlw	(012h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	263
	
l2967:	
;slaver.c: 263: app_command_buf[2] = 0x03;
	movlw	(03h)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	264
	
l2969:	
;slaver.c: 264: app_command_buf[3] = 0x08;
	movlw	(08h)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	265
;slaver.c: 265: app_command_buf[4] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+04h
	line	266
;slaver.c: 266: app_command_buf[5] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+05h
	line	267
;slaver.c: 267: app_command_buf[6] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+06h
	line	268
	
l2971:	
;slaver.c: 268: spi_write(7, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(07h)
	fcall	_spi_write
	line	270
	
l2973:	
;slaver.c: 270: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	271
	
l2975:	
;slaver.c: 271: app_command_buf[1] = 0x12;
	movlw	(012h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	272
	
l2977:	
;slaver.c: 272: app_command_buf[2] = 0x0c;
	movlw	(0Ch)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	273
	
l2979:	
;slaver.c: 273: app_command_buf[3] = 0x0d;
	movlw	(0Dh)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	274
	
l2981:	
;slaver.c: 274: app_command_buf[4] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+04h
	line	275
	
l2983:	
;slaver.c: 275: app_command_buf[5] = 14;
	movlw	(0Eh)
	movwf	0+(SI4463_init@app_command_buf)+05h
	line	276
	
l2985:	
;slaver.c: 276: app_command_buf[6] = 0x04;
	movlw	(04h)
	movwf	0+(SI4463_init@app_command_buf)+06h
	line	277
	
l2987:	
;slaver.c: 277: app_command_buf[7] = 0xaa;
	movlw	(0AAh)
	movwf	0+(SI4463_init@app_command_buf)+07h
	line	278
	
l2989:	
;slaver.c: 278: app_command_buf[8] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+08h
	line	279
	
l2991:	
;slaver.c: 279: app_command_buf[9] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+09h
	line	280
	
l2993:	
;slaver.c: 280: app_command_buf[10] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Ah
	line	281
	
l2995:	
;slaver.c: 281: app_command_buf[11] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Bh
	line	282
	
l2997:	
;slaver.c: 282: app_command_buf[12] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Ch
	line	283
	
l2999:	
;slaver.c: 283: app_command_buf[13] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Dh
	line	284
	
l3001:	
;slaver.c: 284: app_command_buf[14] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Eh
	line	285
	
l3003:	
;slaver.c: 285: app_command_buf[15] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Fh
	line	286
	
l3005:	
;slaver.c: 286: spi_write(16, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	289
;slaver.c: 289: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	290
;slaver.c: 290: app_command_buf[1] = 0x12;
	movlw	(012h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	291
;slaver.c: 291: app_command_buf[2] = 0x08;
	movlw	(08h)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	292
;slaver.c: 292: app_command_buf[3] = 0x19;
	movlw	(019h)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	293
	
l3007:	
;slaver.c: 293: app_command_buf[4] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+04h
	line	294
	
l3009:	
;slaver.c: 294: app_command_buf[5] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+05h
	line	295
	
l3011:	
;slaver.c: 295: app_command_buf[6] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+06h
	line	296
	
l3013:	
;slaver.c: 296: app_command_buf[7] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+07h
	line	297
	
l3015:	
;slaver.c: 297: app_command_buf[8] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+08h
	line	298
	
l3017:	
;slaver.c: 298: app_command_buf[9] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+09h
	line	299
	
l3019:	
;slaver.c: 299: app_command_buf[10] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Ah
	line	300
	
l3021:	
;slaver.c: 300: app_command_buf[11] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+0Bh
	line	301
	
l3023:	
;slaver.c: 301: spi_write(12, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(0Ch)
	fcall	_spi_write
	line	303
	
l3025:	
;slaver.c: 303: spi_write(0x10, RF_MODEM_MOD_TYPE_12_data);
	movlw	low((_RF_MODEM_MOD_TYPE_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	304
	
l3027:	
;slaver.c: 304: spi_write(0x05, RF_MODEM_FREQ_DEV_0_1_data);
	movlw	low((_RF_MODEM_FREQ_DEV_0_1_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	306
	
l3029:	
;slaver.c: 306: spi_write(0x10, RF_MODEM_TX_RAMP_DELAY_12_data);
	movlw	low((_RF_MODEM_TX_RAMP_DELAY_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	307
	
l3031:	
;slaver.c: 307: spi_write(0x10, BCR_NCO_OFFSET_2_12_data);
	movlw	low((_BCR_NCO_OFFSET_2_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	308
	
l3033:	
;slaver.c: 308: spi_write(0x10, RF_MODEM_TX_RAMP_DELAY_12_data);
	movlw	low((_RF_MODEM_TX_RAMP_DELAY_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	309
	
l3035:	
;slaver.c: 309: spi_write(0x07, RF_MODEM_AFC_LIMITER_1_3_data);
	movlw	low((_RF_MODEM_AFC_LIMITER_1_3_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(07h)
	fcall	_spi_write
	line	312
	
l3037:	
;slaver.c: 312: spi_write(0x05, RF_MODEM_AGC_CONTROL_1_data);
	movlw	low((_RF_MODEM_AGC_CONTROL_1_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	313
	
l3039:	
;slaver.c: 313: spi_write(0x10, AGC_WINDOW_SIZE_12_data);
	movlw	low((_AGC_WINDOW_SIZE_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	314
	
l3041:	
;slaver.c: 314: spi_write(0x0c, RF_MODEM_RAW_CONTROL_8_data);
	movlw	low((_RF_MODEM_RAW_CONTROL_8_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(0Ch)
	fcall	_spi_write
	line	318
;slaver.c: 318: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	319
;slaver.c: 319: app_command_buf[1] = 0x20;
	movlw	(020h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	320
	
l3043:	
;slaver.c: 320: app_command_buf[2] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+02h
	incf	0+(SI4463_init@app_command_buf)+02h,f
	line	321
;slaver.c: 321: app_command_buf[3] = 0x4e;
	movlw	(04Eh)
	movwf	0+(SI4463_init@app_command_buf)+03h
	line	322
;slaver.c: 322: app_command_buf[4] = 0x40;
	movlw	(040h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	323
	
l3045:	
;slaver.c: 323: spi_write(5, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(05h)
	fcall	_spi_write
	line	325
	
l3047:	
;slaver.c: 325: spi_write(0x10, COE13_7_0_12_data);
	movlw	low((_COE13_7_0_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	326
	
l3049:	
;slaver.c: 326: spi_write(0x10, COE1_7_0_12_data);
	movlw	low((_COE1_7_0_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	327
	
l3051:	
;slaver.c: 327: spi_write(0x10, COE7_7_0_12_data);
	movlw	low((_COE7_7_0_12_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	330
;slaver.c: 330: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	331
;slaver.c: 331: app_command_buf[1] = 0x22;
	movlw	(022h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	332
;slaver.c: 332: app_command_buf[2] = 0x04;
	movlw	(04h)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	333
	
l3053:	
;slaver.c: 333: app_command_buf[3] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+03h
	line	334
	
l3055:	
;slaver.c: 334: app_command_buf[4] = 0x08;
	movlw	(08h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	335
	
l3057:	
;slaver.c: 335: app_command_buf[5] = 127;
	movlw	(07Fh)
	movwf	0+(SI4463_init@app_command_buf)+05h
	line	336
	
l3059:	
;slaver.c: 336: app_command_buf[6] =0x00;
	clrf	0+(SI4463_init@app_command_buf)+06h
	line	337
;slaver.c: 337: app_command_buf[7] = 0x3d;
	movlw	(03Dh)
	movwf	0+(SI4463_init@app_command_buf)+07h
	line	338
	
l3061:	
;slaver.c: 338: spi_write(8, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(08h)
	fcall	_spi_write
	line	340
	
l3063:	
;slaver.c: 340: spi_write(0x0B, RF_SYNTH_PFDCP_CPFF_7_data);
	movlw	low((_RF_SYNTH_PFDCP_CPFF_7_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(0Bh)
	fcall	_spi_write
	line	343
;slaver.c: 343: app_command_buf[0] = 0x11;
	movlw	(011h)
	movwf	(SI4463_init@app_command_buf)
	line	344
;slaver.c: 344: app_command_buf[1] = 0x30;
	movlw	(030h)
	movwf	0+(SI4463_init@app_command_buf)+01h
	line	345
;slaver.c: 345: app_command_buf[2] = 0x0c;
	movlw	(0Ch)
	movwf	0+(SI4463_init@app_command_buf)+02h
	line	346
	
l3065:	
;slaver.c: 346: app_command_buf[3] = 0x00;
	clrf	0+(SI4463_init@app_command_buf)+03h
	line	347
	
l3067:	
;slaver.c: 347: app_command_buf[4] = 's';
	movlw	(073h)
	movwf	0+(SI4463_init@app_command_buf)+04h
	line	348
	
l3069:	
;slaver.c: 348: app_command_buf[5] = 0xff;
	movlw	(0FFh)
	movwf	0+(SI4463_init@app_command_buf)+05h
	line	349
	
l3071:	
;slaver.c: 349: app_command_buf[6] = 0x40;
	movlw	(040h)
	movwf	0+(SI4463_init@app_command_buf)+06h
	line	350
	
l3073:	
;slaver.c: 350: app_command_buf[7] = 'w';
	movlw	(077h)
	movwf	0+(SI4463_init@app_command_buf)+07h
	line	351
	
l3075:	
;slaver.c: 351: app_command_buf[8] = 0xff;
	movlw	(0FFh)
	movwf	0+(SI4463_init@app_command_buf)+08h
	line	352
	
l3077:	
;slaver.c: 352: app_command_buf[9] = 0x01;
	clrf	0+(SI4463_init@app_command_buf)+09h
	incf	0+(SI4463_init@app_command_buf)+09h,f
	line	353
	
l3079:	
;slaver.c: 353: app_command_buf[10] = 'w';
	movlw	(077h)
	movwf	0+(SI4463_init@app_command_buf)+0Ah
	line	354
	
l3081:	
;slaver.c: 354: app_command_buf[11] =0xff;
	movlw	(0FFh)
	movwf	0+(SI4463_init@app_command_buf)+0Bh
	line	355
	
l3083:	
;slaver.c: 355: app_command_buf[12] =0x02;
	movlw	(02h)
	movwf	0+(SI4463_init@app_command_buf)+0Ch
	line	356
	
l3085:	
;slaver.c: 356: app_command_buf[13] = 'x';
	movlw	(078h)
	movwf	0+(SI4463_init@app_command_buf)+0Dh
	line	357
	
l3087:	
;slaver.c: 357: app_command_buf[14] = 0xff;
	movlw	(0FFh)
	movwf	0+(SI4463_init@app_command_buf)+0Eh
	line	358
	
l3089:	
;slaver.c: 358: app_command_buf[15] =0x03;
	movlw	(03h)
	movwf	0+(SI4463_init@app_command_buf)+0Fh
	line	359
	
l3091:	
;slaver.c: 359: spi_write(16, app_command_buf);
	movlw	(SI4463_init@app_command_buf&0ffh)
	movwf	(?_spi_write)
	movlw	(0x0/2)
	movwf	(?_spi_write+1)
	movlw	(010h)
	fcall	_spi_write
	line	361
	
l3093:	
;slaver.c: 361: spi_write(6, RF_MODEM_RAW_SEARCH2_2_data);
	movlw	low((_RF_MODEM_RAW_SEARCH2_2_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(06h)
	fcall	_spi_write
	line	362
	
l3095:	
;slaver.c: 362: spi_write(12, RF_FREQ_CONTROL_INTE_8_data);
	movlw	low((_RF_FREQ_CONTROL_INTE_8_data-__stringbase))
	movwf	(?_spi_write)
	movlw	80h
	movwf	(?_spi_write+1)
	movlw	(0Ch)
	fcall	_spi_write
	line	363
	
l863:	
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
;;		line 565 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	565
	global	__size_of_spi_write_fifo
	__size_of_spi_write_fifo	equ	__end_of_spi_write_fifo-_spi_write_fifo
	
_spi_write_fifo:	
	opt	stack 3
; Regs used in _spi_write_fifo: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	568
	
l2859:	
;slaver.c: 566: U8 i;
;slaver.c: 568: i = 0;
	clrf	(spi_write_fifo@i)
	line	569
;slaver.c: 569: while(i!=0xff)
	goto	l2863
	line	570
	
l2861:	
;slaver.c: 570: i = check_cts();
	fcall	_check_cts
	movwf	(spi_write_fifo@i)
	line	569
	
l2863:	
	movf	(spi_write_fifo@i),w
	xorlw	0FFh
	skipz
	goto	u441
	goto	u440
u441:
	goto	l2861
u440:
	
l932:	
	line	571
;slaver.c: 571: RC6 = 1;
	bsf	(62/8),(62)&7
	line	572
;slaver.c: 572: RC7 = 0;
	bcf	(63/8),(63)&7
	line	573
;slaver.c: 573: RC6 = 0;
	bcf	(62/8),(62)&7
	line	574
	
l2865:	
;slaver.c: 574: spi_byte(0x66);
	movlw	(066h)
	fcall	_spi_byte
	line	576
	
l2867:	
;slaver.c: 576: for (i = 0; i< 14; i++)
	clrf	(spi_write_fifo@i)
	line	578
	
l2873:	
;slaver.c: 577: {
;slaver.c: 578: spi_byte(tx_ph_data[i]);
	movf	(spi_write_fifo@i),w
	addlw	low((_tx_ph_data-__stringbase))
	movwf	fsr0
	fcall	stringdir
	fcall	_spi_byte
	line	576
	
l2875:	
	incf	(spi_write_fifo@i),f
	
l2877:	
	movlw	(0Eh)
	subwf	(spi_write_fifo@i),w
	skipc
	goto	u451
	goto	u450
u451:
	goto	l2873
u450:
	
l934:	
	line	580
;slaver.c: 579: }
;slaver.c: 580: RC6 = 1;
	bsf	(62/8),(62)&7
	line	581
	
l935:	
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
;;		line 507 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	507
	global	__size_of_spi_write
	__size_of_spi_write	equ	__end_of_spi_write-_spi_write
	
_spi_write:	
	opt	stack 2
; Regs used in _spi_write: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;spi_write@tx_length stored from wreg
	line	510
	movwf	(spi_write@tx_length)
	
l2843:	
;slaver.c: 508: unsigned char i,j;
;slaver.c: 510: i = 0;
	clrf	(spi_write@i)
	line	511
;slaver.c: 511: while(i!=0xff)
	goto	l2847
	line	512
	
l2845:	
;slaver.c: 512: i = check_cts();
	fcall	_check_cts
	movwf	(spi_write@i)
	line	511
	
l2847:	
	movf	(spi_write@i),w
	xorlw	0FFh
	skipz
	goto	u421
	goto	u420
u421:
	goto	l2845
u420:
	
l908:	
	line	514
;slaver.c: 514: RC7 = 0;
	bcf	(63/8),(63)&7
	line	515
;slaver.c: 515: RC6 = 0;
	bcf	(62/8),(62)&7
	line	517
	
l2849:	
;slaver.c: 517: for (i = 0; i < tx_length; i++)
	clrf	(spi_write@i)
	goto	l2857
	line	519
	
l2851:	
;slaver.c: 518: {
;slaver.c: 519: j = *(p+i);
	movf	(spi_write@i),w
	addwf	(spi_write@p),w
	movwf	fsr0
	movf	(spi_write@p+1),w
	skipnc
	incf	(spi_write@p+1),w
	movwf	btemp+1
	fcall	stringtab
	movwf	(spi_write@j)
	line	520
	
l2853:	
;slaver.c: 520: spi_byte(j);
	movf	(spi_write@j),w
	fcall	_spi_byte
	line	517
	
l2855:	
	incf	(spi_write@i),f
	
l2857:	
	movf	(spi_write@tx_length),w
	subwf	(spi_write@i),w
	skipc
	goto	u431
	goto	u430
u431:
	goto	l2851
u430:
	
l911:	
	line	523
;slaver.c: 521: }
;slaver.c: 523: RC6 = 1;
	bsf	(62/8),(62)&7
	line	524
	
l912:	
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
;;		line 584 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	584
	global	__size_of_spi_read_fifo
	__size_of_spi_read_fifo	equ	__end_of_spi_read_fifo-_spi_read_fifo
	
_spi_read_fifo:	
	opt	stack 4
; Regs used in _spi_read_fifo: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	587
	
l2823:	
;slaver.c: 585: U8 i;
;slaver.c: 587: i = 0;
	clrf	(spi_read_fifo@i)
	line	588
;slaver.c: 588: while(i!=0xff)
	goto	l2827
	line	589
	
l2825:	
;slaver.c: 589: i = check_cts();
	fcall	_check_cts
	movwf	(spi_read_fifo@i)
	line	588
	
l2827:	
	movf	(spi_read_fifo@i),w
	xorlw	0FFh
	skipz
	goto	u401
	goto	u400
u401:
	goto	l2825
u400:
	
l940:	
	line	591
;slaver.c: 591: RC6 = 1;
	bsf	(62/8),(62)&7
	line	592
;slaver.c: 592: RC7 = 0;
	bcf	(63/8),(63)&7
	line	593
;slaver.c: 593: RC6 = 0;
	bcf	(62/8),(62)&7
	line	594
	
l2829:	
;slaver.c: 594: spi_byte(0x77);
	movlw	(077h)
	fcall	_spi_byte
	line	595
	
l2831:	
;slaver.c: 595: for (i = 0; i< 14; i++)
	clrf	(spi_read_fifo@i)
	line	596
	
l2837:	
;slaver.c: 596: rx_buf[i] = spi_byte(0xff);
	movf	(spi_read_fifo@i),w
	addlw	_rx_buf&0ffh
	movwf	fsr0
	movlw	(0FFh)
	fcall	_spi_byte
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	595
	
l2839:	
	incf	(spi_read_fifo@i),f
	
l2841:	
	movlw	(0Eh)
	subwf	(spi_read_fifo@i),w
	skipc
	goto	u411
	goto	u410
u411:
	goto	l2837
u410:
	
l942:	
	line	597
;slaver.c: 597: RC6 = 1;
	bsf	(62/8),(62)&7
	line	598
	
l943:	
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
;;		line 527 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	527
	global	__size_of_check_cts
	__size_of_check_cts	equ	__end_of_check_cts-_check_cts
	
_check_cts:	
	opt	stack 2
; Regs used in _check_cts: [wreg+status,2+status,0+pclath+cstack]
	line	530
	
l2813:	
;slaver.c: 528: U8 i;
;slaver.c: 530: RC6 = 1;
	bsf	(62/8),(62)&7
	line	531
;slaver.c: 531: RC7 = 0;
	bcf	(63/8),(63)&7
	line	532
;slaver.c: 532: RC6 = 0;
	bcf	(62/8),(62)&7
	line	533
	
l2815:	
;slaver.c: 533: spi_byte(0x44);
	movlw	(044h)
	fcall	_spi_byte
	line	534
;slaver.c: 534: i = spi_byte(0);
	movlw	(0)
	fcall	_spi_byte
	movwf	(check_cts@i)
	line	535
	
l2817:	
;slaver.c: 535: RC6 = 1;
	bsf	(62/8),(62)&7
	line	536
	
l2819:	
;slaver.c: 536: return (i);
	movf	(check_cts@i),w
	line	537
	
l915:	
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
;;		line 601 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	601
	global	__size_of_sdn_reset
	__size_of_sdn_reset	equ	__end_of_sdn_reset-_sdn_reset
	
_sdn_reset:	
	opt	stack 4
; Regs used in _sdn_reset: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	604
	
l2787:	
;slaver.c: 602: U8 i;
;slaver.c: 604: RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(57/8),(57)&7
	line	605
	
l2789:	
;slaver.c: 605: delay_1ms(2);
	movlw	02h
	movwf	(?_delay_1ms)
	clrf	(?_delay_1ms+1)
	fcall	_delay_1ms
	line	606
	
l2791:	
;slaver.c: 606: RC1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(57/8),(57)&7
	line	607
;slaver.c: 607: delay_1ms(10);
	movlw	0Ah
	movwf	(?_delay_1ms)
	clrf	(?_delay_1ms+1)
	fcall	_delay_1ms
	line	609
	
l2793:	
;slaver.c: 609: RC6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(62/8),(62)&7
	line	610
	
l2795:	
;slaver.c: 610: RC7 = 0;
	bcf	(63/8),(63)&7
	line	611
	
l2797:	
;slaver.c: 611: RC6 = 0;
	bcf	(62/8),(62)&7
	line	612
	
l2799:	
;slaver.c: 612: for (i = 0; i< 7; i++)
	clrf	(sdn_reset@i)
	line	613
	
l2805:	
;slaver.c: 613: spi_byte(RF_POWER_UP_data[i]);
	movf	(sdn_reset@i),w
	addlw	low((_RF_POWER_UP_data-__stringbase))
	movwf	fsr0
	fcall	stringdir
	fcall	_spi_byte
	line	612
	
l2807:	
	incf	(sdn_reset@i),f
	
l2809:	
	movlw	(07h)
	subwf	(sdn_reset@i),w
	skipc
	goto	u391
	goto	u390
u391:
	goto	l2805
u390:
	
l947:	
	line	614
;slaver.c: 614: RC6 = 1;
	bsf	(62/8),(62)&7
	line	616
	
l2811:	
;slaver.c: 616: delay_1ms(20);
	movlw	014h
	movwf	(?_delay_1ms)
	clrf	(?_delay_1ms+1)
	fcall	_delay_1ms
	line	617
	
l948:	
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
;;		line 660 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	660
	global	__size_of_delay_x10ms
	__size_of_delay_x10ms	equ	__end_of_delay_x10ms-_delay_x10ms
	
_delay_x10ms:	
	opt	stack 5
; Regs used in _delay_x10ms: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	663
	
l2779:	
;slaver.c: 661: unsigned int j;
;slaver.c: 663: for(j = 0; j<dx10ms; j++)
	clrf	(delay_x10ms@j)
	clrf	(delay_x10ms@j+1)
	goto	l2785
	line	664
	
l2781:	
;slaver.c: 664: delay_10ms();
	fcall	_delay_10ms
	line	663
	
l2783:	
	incf	(delay_x10ms@j),f
	skipnz
	incf	(delay_x10ms@j+1),f
	
l2785:	
	movf	(delay_x10ms@dx10ms+1),w
	subwf	(delay_x10ms@j+1),w
	skipz
	goto	u385
	movf	(delay_x10ms@dx10ms),w
	subwf	(delay_x10ms@j),w
u385:
	skipc
	goto	u381
	goto	u380
u381:
	goto	l2781
u380:
	line	665
	
l970:	
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
;;		line 646 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	646
	global	__size_of_delay_10ms
	__size_of_delay_10ms	equ	__end_of_delay_10ms-_delay_10ms
	
_delay_10ms:	
	opt	stack 5
; Regs used in _delay_10ms: [wreg+status,2+status,0+btemp+1]
	line	649
	
l2747:	
;slaver.c: 647: int i;
;slaver.c: 649: for(i = 0; i<2472; i++)
	clrf	(delay_10ms@i)
	clrf	(delay_10ms@i+1)
	
l2753:	
;slaver.c: 650: {
;slaver.c: 651: ;
	incf	(delay_10ms@i),f
	skipnz
	incf	(delay_10ms@i+1),f
	
l2755:	
	movf	(delay_10ms@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(09A8h))^80h
	subwf	btemp+1,w
	skipz
	goto	u345
	movlw	low(09A8h)
	subwf	(delay_10ms@i),w
u345:

	skipc
	goto	u341
	goto	u340
u341:
	goto	l2753
u340:
	
l963:	
	line	654
# 654 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
CLRWDT ;#
psect	text465
	line	656
	
l964:	
	return
	opt stack 0
GLOBAL	__end_of_delay_10ms
	__end_of_delay_10ms:
;; =============== function _delay_10ms ends ============

	signat	_delay_10ms,88
	global	_spi_byte
psect	text466,local,class=CODE,delta=2
global __ptext466
__ptext466:

;; *************** function _spi_byte *****************
;; Defined at:
;;		line 483 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
psect	text466
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	483
	global	__size_of_spi_byte
	__size_of_spi_byte	equ	__end_of_spi_byte-_spi_byte
	
_spi_byte:	
	opt	stack 3
; Regs used in _spi_byte: [wreg+status,2+status,0]
;spi_byte@data stored from wreg
	line	486
	movwf	(spi_byte@data)
	
l2729:	
;slaver.c: 484: unsigned char i;
;slaver.c: 486: for (i = 0; i < 8; i++)
	clrf	(spi_byte@i)
	line	487
	
l897:	
	line	488
;slaver.c: 487: {
;slaver.c: 488: if (data & 0x80)
	btfss	(spi_byte@data),(7)&7
	goto	u311
	goto	u310
u311:
	goto	l899
u310:
	line	489
	
l2735:	
;slaver.c: 489: RC5 = 1;
	bsf	(61/8),(61)&7
	goto	l900
	line	490
	
l899:	
	line	491
;slaver.c: 490: else
;slaver.c: 491: RC5 = 0;
	bcf	(61/8),(61)&7
	
l900:	
	line	493
;slaver.c: 493: data <<= 1;
	clrc
	rlf	(spi_byte@data),f
	line	494
;slaver.c: 494: RC7 = 1;
	bsf	(63/8),(63)&7
	line	496
;slaver.c: 496: if (RC4)
	btfss	(60/8),(60)&7
	goto	u321
	goto	u320
u321:
	goto	l901
u320:
	line	497
	
l2737:	
;slaver.c: 497: data |= 0x01;
	bsf	(spi_byte@data)+(0/8),(0)&7
	goto	l902
	line	498
	
l901:	
	line	499
;slaver.c: 498: else
;slaver.c: 499: data &= 0xfe;
	bcf	(spi_byte@data)+(0/8),(0)&7
	
l902:	
	line	501
;slaver.c: 501: RC7 = 0;
	bcf	(63/8),(63)&7
	line	486
	
l2739:	
	incf	(spi_byte@i),f
	
l2741:	
	movlw	(08h)
	subwf	(spi_byte@i),w
	skipc
	goto	u331
	goto	u330
u331:
	goto	l897
u330:
	line	503
	
l2743:	
;slaver.c: 502: }
;slaver.c: 503: return (data);
	movf	(spi_byte@data),w
	line	504
	
l903:	
	return
	opt stack 0
GLOBAL	__end_of_spi_byte
	__end_of_spi_byte:
;; =============== function _spi_byte ends ============

	signat	_spi_byte,4217
	global	_delay_1ms
psect	text467,local,class=CODE,delta=2
global __ptext467
__ptext467:

;; *************** function _delay_1ms *****************
;; Defined at:
;;		line 632 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
;;		_main
;;		_sdn_reset
;; This function uses a non-reentrant model
;;
psect	text467
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	632
	global	__size_of_delay_1ms
	__size_of_delay_1ms	equ	__end_of_delay_1ms-_delay_1ms
	
_delay_1ms:	
	opt	stack 4
; Regs used in _delay_1ms: [wreg+status,2+status,0]
	line	634
	
l2713:	
;slaver.c: 633: unsigned int i;
;slaver.c: 634: while(delay_time !=0)
	goto	l2727
	line	636
	
l2715:	
;slaver.c: 635: {
;slaver.c: 636: for (i =380; i!=0; i--)
	movlw	low(017Ch)
	movwf	(delay_1ms@i)
	movlw	high(017Ch)
	movwf	((delay_1ms@i))+1
	line	637
	
l956:	
	line	638
# 638 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
NOP ;#
	line	639
# 639 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
NOP ;#
psect	text467
	line	636
	
l2721:	
	movlw	low(01h)
	subwf	(delay_1ms@i),f
	movlw	high(01h)
	skipc
	decf	(delay_1ms@i+1),f
	subwf	(delay_1ms@i+1),f
	
l2723:	
	movf	((delay_1ms@i+1)),w
	iorwf	((delay_1ms@i)),w
	skipz
	goto	u291
	goto	u290
u291:
	goto	l956
u290:
	line	641
	
l2725:	
;slaver.c: 640: }
;slaver.c: 641: delay_time--;
	movlw	low(01h)
	subwf	(delay_1ms@delay_time),f
	movlw	high(01h)
	skipc
	decf	(delay_1ms@delay_time+1),f
	subwf	(delay_1ms@delay_time+1),f
	line	634
	
l2727:	
	movf	((delay_1ms@delay_time+1)),w
	iorwf	((delay_1ms@delay_time)),w
	skipz
	goto	u301
	goto	u300
u301:
	goto	l2715
u300:
	line	643
	
l959:	
	return
	opt stack 0
GLOBAL	__end_of_delay_1ms
	__end_of_delay_1ms:
;; =============== function _delay_1ms ends ============

	signat	_delay_1ms,4216
	global	_timer1_init
psect	text468,local,class=CODE,delta=2
global __ptext468
__ptext468:

;; *************** function _timer1_init *****************
;; Defined at:
;;		line 682 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	682
	global	__size_of_timer1_init
	__size_of_timer1_init	equ	__end_of_timer1_init-_timer1_init
	
_timer1_init:	
	opt	stack 6
; Regs used in _timer1_init: [wreg]
	line	683
	
l2709:	
;slaver.c: 683: T1CON = 0x31;
	movlw	(031h)
	movwf	(16)	;volatile
	line	684
	
l2711:	
;slaver.c: 684: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	685
;slaver.c: 685: TMR1L = 0x78;
	movlw	(078h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(14)	;volatile
	line	686
;slaver.c: 686: TMR1H = 0xec;
	movlw	(0ECh)
	movwf	(15)	;volatile
	line	688
	
l976:	
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
;;		line 668 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	668
	global	__size_of_nop_10
	__size_of_nop_10	equ	__end_of_nop_10-_nop_10
	
_nop_10:	
	opt	stack 6
; Regs used in _nop_10: []
	line	669
	
l2707:	
# 669 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
NOP ;#
	line	670
# 670 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
NOP ;#
	line	671
# 671 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
NOP ;#
	line	672
# 672 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
NOP ;#
	line	673
# 673 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
NOP ;#
	line	674
# 674 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
NOP ;#
	line	675
# 675 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
NOP ;#
	line	676
# 676 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
NOP ;#
	line	677
# 677 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
NOP ;#
	line	678
# 678 "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
NOP ;#
psect	text469
	line	679
	
l973:	
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
;;		line 621 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	621
	global	__size_of_port_init
	__size_of_port_init	equ	__end_of_port_init-_port_init
	
_port_init:	
	opt	stack 6
; Regs used in _port_init: [wreg+status,2]
	line	622
	
l2695:	
;slaver.c: 622: ANSEL=0X00;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(286)^0100h	;volatile
	line	623
;slaver.c: 623: ANSELH=0X00;
	clrf	(287)^0100h	;volatile
	line	624
	
l2697:	
;slaver.c: 624: WPUA=0X17;
	movlw	(017h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(149)^080h	;volatile
	line	625
	
l2699:	
;slaver.c: 625: IOCA=0X00;
	clrf	(150)^080h	;volatile
	line	626
	
l2701:	
;slaver.c: 626: TRISA=0X00;
	clrf	(133)^080h	;volatile
	line	627
	
l2703:	
;slaver.c: 627: TRISC=0X1D;
	movlw	(01Dh)
	movwf	(135)^080h	;volatile
	line	628
	
l2705:	
;slaver.c: 628: PORTC=0X80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	629
	
l951:	
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
;;		line 691 in file "E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
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
	file	"E:\My Design\3-si4463_demo\si4463\si4463_VC2\slaver\slaver.c"
	line	691
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
	line	692
	
i1l2757:	
;slaver.c: 692: if(TMR1IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u35_21
	goto	u35_20
u35_21:
	goto	i1l982
u35_20:
	line	695
	
i1l2759:	
;slaver.c: 693: {
;slaver.c: 695: TMR1L = 0x78;
	movlw	(078h)
	movwf	(14)	;volatile
	line	696
;slaver.c: 696: TMR1H = 0xec;
	movlw	(0ECh)
	movwf	(15)	;volatile
	line	698
	
i1l2761:	
;slaver.c: 698: rf_timeout++;
	incf	(_rf_timeout),f
	skipnz
	incf	(_rf_timeout+1),f
	line	699
	
i1l2763:	
;slaver.c: 699: if(rf_timeout == 20)
		movf	(_rf_timeout),w
	xorlw	20
	iorwf	(_rf_timeout+1),w

	skipz
	goto	u36_21
	goto	u36_20
u36_21:
	goto	i1l2769
u36_20:
	line	701
	
i1l2765:	
;slaver.c: 700: {
;slaver.c: 701: rf_timeout=0;
	clrf	(_rf_timeout)
	clrf	(_rf_timeout+1)
	line	702
	
i1l2767:	
;slaver.c: 702: Flag.rf_reach_timeout = 1;
	bsf	(_Flag),2
	line	705
	
i1l2769:	
;slaver.c: 703: }
;slaver.c: 705: count_1hz++;
	incf	(_count_1hz),f
	skipnz
	incf	(_count_1hz+1),f
	line	706
	
i1l2771:	
;slaver.c: 706: if(count_1hz==60)
		movf	(_count_1hz),w
	xorlw	60
	iorwf	(_count_1hz+1),w

	skipz
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l2777
u37_20:
	line	708
	
i1l2773:	
;slaver.c: 707: {
;slaver.c: 708: count_1hz=0;
	clrf	(_count_1hz)
	clrf	(_count_1hz+1)
	line	709
	
i1l2775:	
;slaver.c: 709: Flag.reach_1s = 1;
	bsf	(_Flag),0
	line	713
	
i1l2777:	
;slaver.c: 711: }
;slaver.c: 713: TMR1IF=0;
	bcf	(96/8),(96)&7
	line	716
	
i1l982:	
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
