#include <pic.h>
#include "radio_config_si4463.h"

typedef 	unsigned char	U8;
typedef 	unsigned int	U16;
typedef 	unsigned long	U32;
typedef 	char			S8;
typedef 	int				S16;
typedef 	long			S32;

#define  	SDI        		RC5

#define  	nSEL			RC6
#define  	LED_GREEN		RA0
#define  	LED_RED			RA1
#define  	SCK				RC7
#define  	nIRQ       		RC2

#define  	SDN	        	RC1
#define  	SDO	        	RC4


#define PART_INFO                       0x01
#define FUNC_INFO                       0x10
#define SET_PROPERTY                    0x11 
#define GET_PROPERTY                    0x12 
#define GPIO_PIN_CFG                    0x13
#define GET_ADC_READING                 0x14 
#define FIFO_INFO                       0x15
#define PACKET_INFO                     0x16
#define IRCAL                           0x17 
#define PROTOCOL_CFG                    0x18 
#define GET_INT_STATUS                  0x20
#define GET_PH_STATUS                   0x21
#define GET_MODEM_STATUS                0x22
#define GET_CHIP_STATUS                 0x23
#define START_TX                        0x31 
#define START_RX                        0x32 
#define REQUEST_DEVICE_STAT             0x33
#define CHANGE_STATE                    0x34 
#define READ_CMD_BUFF                   0x44 
#define FRR_A_READ                      0x50
#define FRR_B_READ                      0x51 
#define FRR_C_READ                      0x53 
#define FRR_D_READ                      0x57 
#define WRITE_TX_FIFO                   0x66 
#define READ_RX_FIFO                    0x77 
#define START_MFSK                      0x35 
#define RX_HOP                          0x36 

#define payload_length  				14

#define freq_channel		0 

typedef struct 
{
	unsigned char reach_1s				: 1;	
	unsigned char is_tx					: 1;
	unsigned char rf_reach_timeout		: 1;
}FlagType;
//const unsigned char RF_MODEM_DSA_CTRL1_5_data[] = 		{RF_MODEM_DSA_CTRL1_5};
const unsigned char RF_FREQ_CONTROL_INTE_8_data[] = 		{RF_FREQ_CONTROL_INTE_8};
const unsigned char RF_POWER_UP_data[] = 			   		{ RF_POWER_UP};

const unsigned char RF_FRR_CTL_A_MODE_4_data[] = 		   	{ RF_FRR_CTL_A_MODE_4};

const unsigned char RF_MODEM_FREQ_DEV_0_1_data[] = 		   	{ RF_MODEM_FREQ_DEV_0_1};
const unsigned char RF_MODEM_AGC_CONTROL_1_data[] = 		{ RF_MODEM_AGC_CONTROL_1};
const unsigned char RF_MODEM_MOD_TYPE_12_data[]=			{RF_MODEM_MOD_TYPE_12};
const unsigned char RF_MODEM_TX_RAMP_DELAY_12_data[]=				{RF_MODEM_TX_RAMP_DELAY_12};
const unsigned char BCR_NCO_OFFSET_2_12_data[]=					{RF_MODEM_BCR_NCO_OFFSET_2_12};
const unsigned char RF_MODEM_AFC_LIMITER_1_3_data[]=						{RF_MODEM_AFC_LIMITER_1_3};
const unsigned char AGC_WINDOW_SIZE_12_data[]=				{RF_MODEM_AGC_WINDOW_SIZE_12};
const unsigned char RF_MODEM_RAW_CONTROL_8_data[]=					{RF_MODEM_RAW_CONTROL_8};
const unsigned char COE13_7_0_12_data[]=	{RF_MODEM_CHFLT_RX1_CHFLT_COE13_7_0_12};
const unsigned char COE1_7_0_12_data[]=	{RF_MODEM_CHFLT_RX1_CHFLT_COE1_7_0_12};
const unsigned char COE7_7_0_12_data[]=	{RF_MODEM_CHFLT_RX2_CHFLT_COE7_7_0_12};
const unsigned char RF_SYNTH_PFDCP_CPFF_7_data[]=					{RF_SYNTH_PFDCP_CPFF_7};
const unsigned char RF_MODEM_RAW_SEARCH2_2_data[]={RF_MODEM_RAW_SEARCH2_2};

//const unsigned char tx_test_aa_data[14] = {0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa,0xaa};  
const unsigned char tx_ph_data[14] = {'s','w','w','x',0x41,0x42,0x43,0x44,0x45,0x46,0x47,0x48,0x49,0x6d};  // test signal£¬The 10th data is a former nine checksum

FlagType	Flag;

U16	count_1hz, rf_timeout;
U8 spi_read_buf[20];  
U8 rx_buf[25];
//U8 mode;

void spi_read(U8 data_length, U8 api_command );
void tx_data(void);
void SI4463_init(void);
void sysclk_cfg(void);
void port_init(void);
void timer1_init(void);
void delay_1ms(unsigned int delay_time);
unsigned char spi_byte(unsigned char data);
U8 check_cts(void);
void spi_write(unsigned char tx_length, unsigned char *p);
void spi_write_fifo(void);
void spi_read_fifo(void);
void sdn_reset(void);
void clr_interrupt(void);
void fifo_reset(void);
void enable_tx_interrupt(void);
void enable_rx_interrupt(void);
void tx_start(void);
void rx_start(void);
void rx_init(void);

void rf_standby(void);
void rf_init_freq(void);
void nop_10();
void delay_10ms(void);
void delay_x10ms(unsigned int dx10ms);

void main()
{ 
	unsigned char  i,chksum;
	OSCCON = 0X70;	// 8M crystal
	
	WDTCON = 0X00;//disable wdt
	delay_x10ms(50);//Power on Delay

	port_init();
	nop_10();
	
	LED_GREEN = 0;
	LED_RED = 0;
	timer1_init();  	// 30hz	

	asm("nop"); 	
	
	sdn_reset();// reset RF
 	SI4463_init();  // RF INIT
	rx_init();	 		
		
	count_1hz = 0;
	Flag.reach_1s = 0;		
	INTCON = 0xc0;		// enable interrupt
	while(1)
	{				
		if(Flag.reach_1s)
		{
			Flag.reach_1s = 0;
			tx_data();		// Tx data every 1s, and waiting for the reply from Slave
  			rx_init();		//  Tx completed, enter into Rx mode
		}
				
		if(!Flag.is_tx)
		{
			if(!nIRQ)
			{ 
				clr_interrupt();   // clear interrupt	
						
				if((spi_read_buf[4] &0x08) == 0)  // crc error check
				{
					spi_read_fifo();
					fifo_reset();
							
					chksum = 0;
					for(i=4;i<payload_length-1;i++)// Checksum
		        		chksum += rx_buf[i];          	 		
		        					
		     		if(( chksum == rx_buf[payload_length-1] )&&( rx_buf[4] == 0x41 ))  
		     		{
		     			LED_GREEN ^= 1;					// data right    	
		        	} 
		        	else
		        		rx_init();     				// data wrong
		        }
		        else
		        {
					rx_init();   						// crc error
		        }			
		    }	
		}	
	}
}

void SI4463_init(void)
{	
	U8 app_command_buf[20];
				
	//spi_write(0x07, RF_GPIO_PIN_CFG_data);   
	app_command_buf[0] = 0x13;			// SET GPIO PORT
	app_command_buf[1]  = 0x14; 		// gpio 0 ,Rx data
	app_command_buf[2]  = 0x02;    		// gpio1, output 0
	app_command_buf[3]  = 0x21;  		// gpio2, hign while in receive mode
	app_command_buf[4]  = 0x20; 		// gpio3, hign while in transmit mode 
	app_command_buf[5]  = 0x27;   		// nIRQ
	app_command_buf[6]  = 0x0b;  		// sdo
	spi_write(7, app_command_buf); 
		
	// spi_write(0x05, RF_GLOBAL_XO_TUNE_1_data); 
    app_command_buf[0] = 0x11;  
	app_command_buf[1]  = 0x00;    
	app_command_buf[2]  = 0x01;    
	app_command_buf[3]  = 0x00;  
	app_command_buf[4]  = 98;  			// freq  adjustment
	spi_write(5, app_command_buf);

	// spi_write(0x05, RF_GLOBAL_CONFIG_1_data);
  	app_command_buf[0] = 0x11;  
	app_command_buf[1]  = 0x00;
	app_command_buf[2]  = 0x01; 
	app_command_buf[3]  = 0x03; 
	app_command_buf[4]  = 0x40;  		// tx = rx = 64 byte,PH,high performance mode
	spi_write(5, app_command_buf); 
    
    spi_write(0x08, RF_FRR_CTL_A_MODE_4_data);    // disable all fast response register
     
    // spi_write(0x0D, RF_PREAMBLE_TX_LENGTH_9_data); // set Preamble
 	app_command_buf[0] = 0x11;  
	app_command_buf[1]  = 0x10;    
	app_command_buf[2]  = 0x09;    
	app_command_buf[3]  = 0x00;   
	app_command_buf[4]  = 0x08;							//  8 bytes Preamble
	app_command_buf[5]  = 0x14;							//  detect 20 bits
	app_command_buf[6]  = 0x00;						
	app_command_buf[7]  = 0x0f;
	app_command_buf[8]  = 0x31;  						//  no manchest.1010.¡£¡£
	app_command_buf[9]  = 0x00;
	app_command_buf[10]  = 0x00;
	app_command_buf[11]  = 0x00;
	app_command_buf[12]  = 0x00;
	spi_write(13, app_command_buf);	
	
	//  RF_SYNC_CONFIG_5_data,							// set sync
    app_command_buf[0] = 0x11;  
	app_command_buf[1]  = 0x11;
	app_command_buf[2]  = 0x05;
	app_command_buf[3]  = 0x00;
	app_command_buf[4]  = 0x01;   						// no manchest , 2 bytes
	app_command_buf[5]  = 0x2d;   						// sync byte3
	app_command_buf[6]  = 0xd4;							// sync byte2
	app_command_buf[7]  = 0x00;							// sync byte1
	app_command_buf[8]  = 0x00;							// sync byte0
    spi_write(9, app_command_buf);
        
	//  packet crc         
    app_command_buf[0] = 0x11;  
	app_command_buf[1]  = 0x12; 
	app_command_buf[2]  = 0x01; 
	app_command_buf[3]  = 0x00;
	app_command_buf[4]  = 0x81;							// CRC = itu-c, enable crc
    spi_write(5, app_command_buf);  
        
	// packet   gernale configuration        
    app_command_buf[0] = 0x11;  
	app_command_buf[1]  = 0x12;
	app_command_buf[2]  = 0x01;
	app_command_buf[3]  = 0x06;
	app_command_buf[4]  = 0x02;							// CRC MSB£¬ data MSB
    spi_write(5, app_command_buf);
        
  	// spi_write(0x07, RF_PKT_LEN_3_data);   
    app_command_buf[0] = 0x11;  
	app_command_buf[1]  = 0x12;
	app_command_buf[2]  = 0x03;
	app_command_buf[3]  = 0x08;
	app_command_buf[4]  = 0x00;
	app_command_buf[5]  = 0x00;
	app_command_buf[6]  = 0x00;						 
    spi_write(7, app_command_buf);         
	
	app_command_buf[0] = 0x11;  
	app_command_buf[1]  = 0x12;
	app_command_buf[2]  = 0x0c;
	app_command_buf[3]  = 0x0d;
	app_command_buf[4]  = 0x00;
	app_command_buf[5]  = payload_length;
	app_command_buf[6]  = 0x04;
	app_command_buf[7]  = 0xaa;
	app_command_buf[8]  = 0x00;
	app_command_buf[9]  = 0x00;
	app_command_buf[10]  = 0x00;
	app_command_buf[11]  = 0x00;
	app_command_buf[12]  = 0x00; 
	app_command_buf[13]  = 0x00;
	app_command_buf[14]  = 0x00;
	app_command_buf[15]  = 0x00;
	spi_write(16, app_command_buf);					// set length of Field 1 -- 4
  
    // spi_write(0x0C, RF_PKT_FIELD_4_LENGTH_12_8_8_data);
    app_command_buf[0] = 0x11;  
	app_command_buf[1]  = 0x12; 
	app_command_buf[2]  = 0x08;
	app_command_buf[3]  = 0x19;
	app_command_buf[4]  = 0x00;
	app_command_buf[5]  = 0x00;
	app_command_buf[6]  = 0x00;
	app_command_buf[7]  = 0x00;
	app_command_buf[8]  = 0x00;
	app_command_buf[9]  = 0x00;
	app_command_buf[10]  = 0x00;
	app_command_buf[11]  = 0x00;
    spi_write(12, app_command_buf);
    
    spi_write(0x10, RF_MODEM_MOD_TYPE_12_data);        
	spi_write(0x05, RF_MODEM_FREQ_DEV_0_1_data);
	
    spi_write(0x10, RF_MODEM_TX_RAMP_DELAY_12_data);    	
    spi_write(0x10, BCR_NCO_OFFSET_2_12_data);
	spi_write(0x10, RF_MODEM_TX_RAMP_DELAY_12_data);			
    spi_write(0x07, RF_MODEM_AFC_LIMITER_1_3_data);	
	//spi_write(0x10, BCR_NCO_OFFSET_2_12_data);

    spi_write(0x05, RF_MODEM_AGC_CONTROL_1_data);		
    spi_write(0x10, AGC_WINDOW_SIZE_12_data);	
    spi_write(0x0c, RF_MODEM_RAW_CONTROL_8_data);
//	spi_write(0x10, AGC_WINDOW_SIZE_12_data);
    
	// spi_write(0x05, RF_MODEM_RSSI_COMP_1_data);
	app_command_buf[0] = 0x11;  
	app_command_buf[1] = 0x20;                                                     
	app_command_buf[2] = 0x01;                                                   
	app_command_buf[3] = 0x4e;             
	app_command_buf[4]  = 0x40;
    spi_write(5, app_command_buf);            	     
   
    spi_write(0x10, COE13_7_0_12_data);
    spi_write(0x10, COE1_7_0_12_data);
    spi_write(0x10, COE7_7_0_12_data);       
        
	// RF_PA
	app_command_buf[0] = 0x11;  
	app_command_buf[1]  = 0x22;                                                    
	app_command_buf[2]  = 0x04;                                               
	app_command_buf[3]  = 0x00;                                                     
	app_command_buf[4]  = 0x08;
	app_command_buf[5]  = 127;							// set max power
	app_command_buf[6]  =0x00;
	app_command_buf[7]  = 0x3d;
    spi_write(8, app_command_buf);        
    
	spi_write(0x0B, RF_SYNTH_PFDCP_CPFF_7_data);
        
   	// header match
   	app_command_buf[0] = 0x11;  
	app_command_buf[1]  = 0x30;                                                     
	app_command_buf[2]  = 0x0c;                                                   
	app_command_buf[3]  = 0x00;                                                       
	app_command_buf[4]  = 's';
	app_command_buf[5]  = 0xff;
	app_command_buf[6]  = 0x40;
	app_command_buf[7]  = 'w';                                      
	app_command_buf[8]  = 0xff;                                       
	app_command_buf[9]  = 0x01; 
	app_command_buf[10] = 'w';                                   
	app_command_buf[11]  =0xff;                                       
	app_command_buf[12]  =0x02;
	app_command_buf[13]  = 'x';                                  
	app_command_buf[14]  = 0xff;
	app_command_buf[15]  =0x03;
    spi_write(16, app_command_buf);
    
	spi_write(6, RF_MODEM_RAW_SEARCH2_2_data);
    spi_write(12, RF_FREQ_CONTROL_INTE_8_data); 	    // set frequency    	
}        

void fifo_reset(void)			// reset FIFO
{
	U8 p[2];
	
	p[0] = FIFO_INFO;
	p[1] = 0x03;   // reset tx ,rx fifo
	spi_write(2,p);
}	

void clr_interrupt(void)		// clar interrupt
{
	U8 p[4];
	
	p[0] = GET_INT_STATUS;
	p[1] = 0;   // clr  PH pending
	p[2] = 0;   // clr modem_pending
	p[3] = 0;   // clr chip pending
	spi_write(4,p);
	spi_read(9,GET_INT_STATUS); 
}
	
void enable_rx_interrupt(void)
{
	U8 p[7];

	p[0] = 0x11;
	p[1] = 0x01;  // 0x0100
	p[2] = 0x03;// 3 parameters
	p[3] = 0x00;   // 0100
	p[4] = 0x03;   // ph, modem int
	p[5] = 0x18; // 0x10;   // Pack received int
	p[6] = 0x00;   //preamble int, sync int setting	
	spi_write(0x07, p);  // enable  packet receive interrupt	
}	

void enable_tx_interrupt(void)		
{	
	U8 p[6];

	p[0] = 0x11;
	p[1] = 0x01;
	p[2] = 0x02;
	p[3] = 0x00;
	p[4] = 0x01;
	p[5] = 0x20;
	spi_write(0x06, p);  
}	

void rf_standby(void)				
{
	U8 p[2];
	
	p[0] = CHANGE_STATE ;	// CHANGE_STATE
	p[1] = 0x01 ; // sleep mode
	spi_write(2, p);  
} 

void tx_start(void)				
{
	U8 p[5];
	
	p[0] = START_TX ;
	p[1] = freq_channel ; 		//	channel 0
	p[2] = 0x30; 
	p[3] = 0;
	p[4] = 0; 
	spi_write(5, p);  
} 

void rx_start(void)				
{
	U8 p[8];
	
	p[0] = START_RX ; 
	p[1] = freq_channel ; 			//	channel 0
	p[2] = 0x00; 
	p[3] = 0;
	p[4] = 0;
	p[5] = 0; 
	p[6] = 0x08;  
	p[7] = 0x08;   	
	spi_write(8, p);  
}
	
void rx_init(void)				
{
	Flag.is_tx = 0;
	fifo_reset();  					
	enable_rx_interrupt();	
	clr_interrupt();  				
	rx_start();
}	

void tx_data(void)					
{	
	
	Flag.is_tx = 1;
	LED_RED ^= 1;
	fifo_reset();  
	spi_write_fifo();  				
	enable_tx_interrupt();	
	clr_interrupt();
	tx_start();
	rf_timeout = 0;
	Flag.rf_reach_timeout = 0;
	
	while(nIRQ)						
	{
		asm("CLRWDT");
		if(Flag.rf_reach_timeout)
		{
			sdn_reset();
 			SI4463_init();  		
			break;		
		}			
	}
}

unsigned char spi_byte(unsigned char data)
{
	unsigned char i;
	
	for (i = 0; i < 8; i++)	
	{				
		if (data & 0x80)
			SDI = 1;
		else
			SDI = 0;
			
		data <<= 1;
		SCK = 1;
		
		if (SDO)
			data |= 0x01;
		else
			data &= 0xfe;
			
		SCK = 0;
	}	
	return (data);	
}

void spi_write(unsigned char tx_length, unsigned char *p)
{
	unsigned char i,j;
	
	i = 0;
	while(i!=0xff)
		i = check_cts();
	
	SCK = 0;
	nSEL = 0;
	
	for (i = 0; i < tx_length; i++) 
	{
		j = *(p+i);
		spi_byte(j);
	}
	
	nSEL = 1;	
}

U8 check_cts(void)
{
	U8 i;
   
	nSEL = 1;   
	SCK = 0;
	nSEL = 0;
	spi_byte(0x44);
	i = spi_byte(0);
	nSEL = 1;
	return (i);
}	

void spi_read(U8 data_length, U8 api_command )
{
	U8 i;
	
	U8 p[1];
	p[0] = api_command;
	i = 0;
	while(i!=0xff)
		i = check_cts();
		
	spi_write(1, p); 
	
	i = 0;
	while(i!=0xff)
		i = check_cts();
		
	nSEL = 1;   
	SCK = 0;
	nSEL = 0;
	spi_byte(0x44);
	for (i = 0; i< data_length; i++)
		spi_read_buf[i] = spi_byte(0xff);
	nSEL = 1;
}	

void spi_write_fifo(void)
{
	U8 i;
	
	i = 0;
	while(i!=0xff)
		i = check_cts();
	nSEL = 1;   
	SCK = 0;
	nSEL = 0;
	spi_byte(WRITE_TX_FIFO);   
	for (i = 0; i< payload_length; i++)
	{
		spi_byte(tx_ph_data[i]);
	}
	nSEL = 1;
}	

void spi_read_fifo(void)
{
	U8 i;
	
	i = 0;
	while(i!=0xff)
		i = check_cts();
		
	nSEL = 1;   
	SCK = 0;
	nSEL = 0;
	spi_byte(READ_RX_FIFO);    
	for (i = 0; i< payload_length; i++)
		rx_buf[i] = spi_byte(0xff); 
	nSEL = 1;
}	

void sdn_reset(void)
{	
	U8 i;
	
 	SDN = 1;
 	delay_1ms(2);
 	SDN = 0;
 	delay_1ms(10);
 
 	nSEL = 1;   
	SCK = 0;
	nSEL = 0;
	for (i = 0; i< 7; i++)
		spi_byte(RF_POWER_UP_data[i]);  
	nSEL = 1;
 
 	delay_1ms(20);
}	

//IO function set
void port_init(void)
{
	ANSEL=0X00;
	ANSELH=0X00;
	WPUA=0X17;
	IOCA=0X00;
	TRISA=0X00;
	TRISC=0X1D;
	PORTC=0X80;
}

void delay_1ms(unsigned int delay_time)
{
	unsigned int i;
	while(delay_time !=0)
	{
		for (i =380; i!=0; i--)
		{
			asm("NOP");
			asm("NOP");
		}	
		delay_time--;
	}	
}	

void delay_10ms(void)
{
	int i;
	
	for(i = 0; i<2472; i++)
	{
		;
	}	
	// add watchdog			
	asm("CLRWDT");
	// add watchdog
}
	
//-------------------------------------------
void delay_x10ms(unsigned int dx10ms)
{
	unsigned int j;
	
	for(j = 0; j<dx10ms; j++)
		delay_10ms();	
}

void nop_10()
{
	asm("NOP");	
	asm("NOP");	
	asm("NOP");	
	asm("NOP");	
	asm("NOP");	
	asm("NOP");	
	asm("NOP");	
	asm("NOP");	
	asm("NOP");	
	asm("NOP");	
}	

void timer1_init(void)
{
	T1CON = 0x31; // 8M/4/8/50
	TMR1IE = 1;
	TMR1L = 0x78;	 //50Hz= 0.2S
	TMR1H = 0xec;
	
}

void interrupt ISR_timer(void)
{
	if(TMR1IF)
   	{
   		
   		TMR1L = 0x78;
   		TMR1H = 0xec;
	
		rf_timeout++;
    	if(rf_timeout == 20)
		{
			rf_timeout=0;
			Flag.rf_reach_timeout = 1;	// TX Timeout
		}	
	
		count_1hz++;
    	if(count_1hz==60)				// 1S send data	
    	{
       		count_1hz=0;
       		Flag.reach_1s = 1;
			//LED_RED ^= 1;			
   		}	
     		
    	TMR1IF=0;
	}
	
} 