> Following project is meant to control JIB crane.
> Only joystic have been used to rotate 3-DC motors in both the directions.

> Timer2 is used to generate PWM of frequency (1/1024) Hz

> 3 channels of ADC namily ain0, ain1 and ain2 have been used to collect POT voltage
ranging from 0 to +5V. 

> By default joystic's original position is approximately 2.5V (for all 3 directions.)

> Continous-Buffered mode of ADC conversion is used. Other modes, apparently, not working.
> Pin-26 is used in place 0f pin-28 (surprisingly, it is uncontolled.)