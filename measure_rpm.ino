#include "TimerOne.h" // Including TimerOne library

unsigned int counter=0;
void docount() // counts from the speed sensor
{
	counter++; // increase +1 the counter value
}

void timerIsr()
{
	Timer1.detachInterrupt(); //stop the timer
	Serial.print("Motor Speed: "); // Print text on the serial Monitor
	int rotation = 10*(counter / 20);

	// divide by number of holes in Disc and multiplied by 10 to get RPS
	// because the timer is set for 0.1 second
	Serial.print(rotation,DEC);
	Serial.println(" Rotation per seconds");
	counter=0; // reset counter to zero
	Timer1.attachInterrupt( timerIsr ); //enables the timer again
}

void setup()
{
	Serial.begin(9600); // Enables the serial monitor
	Timer1.initialize(100000); // set timer for 0.1 second interval

	// Attach Interrupt corresponding to pin 2 on the Arduino board
	attachInterrupt(0, docount, RISING);
	
	// The above line calls an interrupt called “Docount” when the pin 2 receives a rising signal
	// Which in turn increases counter variable when speed sensor pin goes High
	// Attach a Timer Interrupt
	Timer1.attachInterrupt( timerIsr ); // enable the timer
}

void loop()
{
	// do nothing
}