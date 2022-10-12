extern void InitUART1TX ( void );
extern void InitUART1RX ( void );
extern  @far @interrupt void uart1_rx_isr(void);
extern  @far @interrupt void uart1_tx_isr(void);
