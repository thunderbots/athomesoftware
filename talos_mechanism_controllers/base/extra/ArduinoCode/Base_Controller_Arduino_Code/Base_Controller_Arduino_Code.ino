
#include <parser.h>
#include <Encoder.h>
#include <PID_v1_custom.h> // Include PID library for closed loop control
#include <basemtrcontrol.h>
  
#define INPUT_PULLUP 0x2
  
// ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- //
//                                                             VARIABLE DECLARATIONS                                                              //  
// ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- //

// -------------- //  
//    MODE SET    //
// -------------- //

    const boolean JOYSTICK = true;      // if joystick is disabled, it will accept commands via serial communication (USB), and vice versa
    const boolean PID_TUNE = false;
    const boolean PUSH_TO_RUN = true;                      // If true, requires pressing down on joystick for robot to move.  If false, pressing does nothing.

// -------------------------- //  
//    SERIAL COMMUNICATION    //
// -------------------------- //  

    String inputString = "";         // a string to hold incoming data
    boolean stringComplete = false;  // whether the string is complete

    // serial msg variables:
    double _interLeftMotorRPMSet;
    double _interRightMotorRPMSet;

// --------------------- //  
//    MANUAL JOYSTICK    //
// --------------------- //  

    // Joystick pin declarations
    const int        twistRemotePin = 4, linearRemotePin = 3;
    const int        linearKillPin = 48, twistKillPin = 50, remotePowerPin = 46;      // Safeties (if pins disconnected, stops motor)
    int              _LinearKillValue = 0, _TwistKillValue = 0, _PowerKillValue = 0;
    boolean          eStopActive = true;                    // Flag to indicate if E-stop was active during the last execution loop.

  
    // Joystick potentiometer tuning parameters
    //   0 to 1024 for 0V to V_cc (5V).  Determined empirically. 
    double linearXHigh = 1023; 
    double linearXLow = 135;
    double linearXCentre = 560;
    double linearAnalogPin = 3;
    double twistXHigh = 1023;
    double twistXLow = 125;
    double twistXCentre = 480;
    double test = 0;
  
// ------------------- //  
//    MOTOR DRIVER     //
// ------------------- //
    
    // Define motor driver H-bridge pins (these pins control the state of the bridge in normal operation)
    const int        INA1 = 39;    // Motor 1, phase A
    const int        INB1 = 45;    // Motor 1, phase B
    const int        INA2 = 47;    // Motor 2, phase A
    const int        INB2 = 53;    // Motor 2, phase B
      
      //  Motor H-bridge control [phaseA phaseB = behaviour]
      //  [HIGH HIGH = BRAKE to Vcc] (i.e. brake)
      //  [HIGH LOW = CLOCKWISE]
      //  [LOW HIGH = Counter Clock Wise]
      //  [LOW LOW = BRAKE to ground] (i.e. off)
    
    // Define motor driver enable pins
    const int        ENA1 = 41; //LOW Disables Half Bridge A HIGH Enables half bridge A
    const int        ENB1 = 43; //LOW Disables Half Bridge B HIGH Enables half bridge B
    const int        ENA2 = 49;
    const int        ENB2 = 51;
    
    // Define motor driver PWM pins
    const int        PWMpin1 = 6;
    const int        PWMpin2 = 7;

// --------------- //  
//    ENCODERS     //
// --------------- //

    // Encoder count variables:   
    double           _leftMotorRPM = 0;
    double           _rightMotorRPM = 0;
    long             _newLeftEncoderPosition = 0;
    long             _newRightEncoderPosition = 0;
    long             _oldLeftEncoderPosition = 0;
    long             _oldRightEncoderPosition  = 0;
    float            _leftCount = 0;
    float            _rightCount = 0;
    
    // Encoder parameters
    const float      CountsPerRotation = 4680;
    const float      MultiplicationFactor = 6; //counts per encoder impulse

    // Initialize encoder objects with input pins (quadrature phase A and phase B)
    Encoder LeftEncoder(2,3);
    Encoder RightEncoder(18,19);

// ---------- //
//    PID     //
// ---------- //
  
    // PID I/O
    double _rightMotorRPMset = 0, _rightFeedback = 0, _rightOutput = 0;    // [Right motor] - PID setpoint, feedback, and output
    double _leftMotorRPMset = 0, _leftFeedback = 0, _leftOutput = 0;       // [Left motor]  - PID setpoint, feedback, and output
    
    // PID gains
    int Kp = 160, Kd = 0, Ki = 1000;
    
    // PID manual tuning (using potentiometers)
    int KpIN = 0, KdIN = 0, KiIN = 0;       // initialize manual PID gains from potentiometer
    int KpPin = 5, KdPin = 6, KiPin = 7;    // connect potentiometer outputs to these pins
    
    // Initialize PID
    PID rightPID(&_rightFeedback, &_rightOutput, &_rightMotorRPMset, Kp, Ki, Kd, DIRECT);
    PID leftPID( &_leftFeedback,  &_leftOutput,  &_leftMotorRPMset,  Kp, Ki, Kd, DIRECT);

    // Max speed limit
    double MaxRPM = 1.45;

    // Control loop interval time
    const float SampleTime = 50;    // in milliseconds




// ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- //
//                                                                   VOID SETUP                                                                   //  
// ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- //

void setup()
{    
    // Initialize serial port
    Serial.begin(9600);
    inputString.reserve(100);
    
    // Set outputs pins
    pinMode(INA1, OUTPUT);
    pinMode(INB1, OUTPUT);  
    pinMode(INA2, OUTPUT);
    pinMode(INB2, OUTPUT);
    pinMode(ENA1, OUTPUT);
    pinMode(ENB1, OUTPUT);
    pinMode(ENA2, OUTPUT);
    pinMode(ENB2, OUTPUT);
    
    // Set input pins
    pinMode(linearKillPin, INPUT_PULLUP);
    pinMode(twistKillPin,  INPUT_PULLUP);
    pinMode(remotePowerPin, INPUT);
    
    // Enable right PID
    rightPID.SetMode(AUTOMATIC);
    rightPID.SetSampleTime(SampleTime);
    
    // Enable left PID
    leftPID.SetMode(AUTOMATIC);
    leftPID.SetSampleTime(SampleTime);
    
    // Check if in manual PID tuning mode (variable set at top of file)
    // If in tuning mode, set PID gains to 0, otherwise set to gains declared above
     if( PID_TUNE )
     {
         rightPID.SetTunings(0, 0, 0);
         leftPID.SetTunings( 0, 0, 0);
     }
     else
     {
         rightPID.SetTunings(Kp, Ki, Kd);
         leftPID.SetTunings( Kp, Ki, Kd);
     }
     
     logSetup();
     
//     // Enable motor H-bridges
//     KillMotor(false, ENA1, ENB1);
//     KillMotor(false, ENA2, ENB2);
}

// ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- //
//                                                                   VOID LOOP                                                                    //  
// ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- //

void loop()
{
    // if in manual PID tuning mode, read values from potentiometers and set gains accordingly
    if( PID_TUNE )
        SetPIDValues();     //Set Kp, Ki, Kd
     
    // --------------- //  
    //    SAFETIES     //
    // --------------- //
    
        // Read joystick E-stop pins
        _LinearKillValue = digitalRead(linearKillPin);
        _TwistKillValue = digitalRead(twistKillPin);
        _PowerKillValue = digitalRead(remotePowerPin);
         
        // if any E-stops triggered, disable H-bridge "enable" pins for both motors
        if( (JOYSTICK && ((PUSH_TO_RUN && _LinearKillValue) || _TwistKillValue)) || !_PowerKillValue )
        {
            KillMotor(true, ENA1, ENB1);
            KillMotor(true, ENA2, ENB2);
            eStopActive = true;
        }
        // else enable both motors
        else if( eStopActive ) 
        {
            KillMotor(false, ENA1, ENB1);
            KillMotor(false, ENA2, ENB2);
            leftPID.ResetError();
            rightPID.ResetError();
            eStopActive = false;
        }
    
    
    // ---------------------------- //  
    //    GET VELOCITY SETPOINTS    //
    // ---------------------------- //
    
    //TODO can be can only when new information available.
    
        // Get velocity commands
        if( JOYSTICK )            // If in joystick, read joystick values and convert to left and right motors velocities
        {
            _leftMotorRPMset = getLeftTwistRPM() + getLinearRPM();
            _rightMotorRPMset = getRightTwistRPM() + getLinearRPM();
        }
        else                      // If in serial command mode, read latest parsed serial values
        {
            _leftMotorRPMset = _interLeftMotorRPMSet;           // TODO I think this is where to put twist messagesbnb
            _rightMotorRPMset = _interRightMotorRPMSet;
        }
        
        // Set H-bridge pins to select motor direction based on wheel velocity setpoint
        setMotorDirection(_leftMotorRPMset, INA1, INB1);  //Sets Pin outs for Pololu 705 
        setMotorDirection(_rightMotorRPMset, INA2, INB2);
         
        // Set wheel velocity setpoints to magnitude only (direction already set above)
        _leftMotorRPMset = abs(_leftMotorRPMset);
        _rightMotorRPMset = abs(_rightMotorRPMset);
     
    // -------------------------- //  
    //    GET CURRENT VELOCITY    //
    // -------------------------- // 
     
        computeLeftRPM();   
        computeRightRPM();                                     //RIGHT motorSpeed compute
         
        _leftFeedback = _leftMotorRPM;
        _rightFeedback = _rightMotorRPM;
    

    // compute PID outputs
    leftPID.Compute();        // uses input _leftMotorRPMset  and feedback _leftFeedback
    rightPID.Compute();       // uses input _rightMotorRPMset and feedback _rightFeedback
    
    // push new velocity to motor driver 
    analogWrite(PWMpin1, _leftOutput); 
    analogWrite(PWMpin2, _rightOutput); 
    
//    Serial.print(_leftOutput);
//    Serial.print(",");
//    Serial.print(_rightOutput);
//    Serial.print("\n");
    
    logLoop();
    
    // pause until next control interval
    delay(SampleTime);
}



// ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- //
//                                                                   FUNCTIONS                                                                    //  
// ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- //

// ************************************ //
// FUNCTION: SetPIDValues
// This function is used to set the PID values of the MCU 
// using three potentiometers. Each potentiometer is power between 5V and GND. 
// The gains Kp, Kd, and Ki, are changed through the analog signals is input into 
// the Arduino Mega pins: 5, 6, and 7 respectively.
// ************************************ //

void SetPIDValues()
{
  //read PID input values from potentiometers
  KpIN = analogRead(KpPin);
  KdIN = analogRead(KdPin);
  KiIN = analogRead(KiPin);
    
  if(KpIN/2 != Kp){
    Kp = KpIN;
    rightPID.SetTunings(Kp, Ki, Kd);
    leftPID.SetTunings(Kp, Ki, Kd);
  }
  if(KdIN/2 != Kd){
    Kd = KdIN/2;
    rightPID.SetTunings(Kp, Ki, Kd);
    leftPID.SetTunings(Kp, Ki, Kd);
  }
  if(KiIN/2 != Ki){
    Ki = KiIN;
    rightPID.SetTunings(Kp, Ki, Kd);
    leftPID.SetTunings(Kp, Ki, Kd);
  }
}


// ************************************ //
// FUNCTION: getCount
// This function is used to determine the count of the encoders after rotation of one loop
// ************************************ //

double getCount( long _oldEncoderPosition, long _newEncoderPosition)
{
  float _Count = 0;
  _Count = _newEncoderPosition - _oldEncoderPosition; //leftCount is the # of (encoder pulses)*(N=6) per "SampleTime"
  
  return _Count;
}


// ************************************ //
// FUNCTION: getRPM
// returns ABSOLUTE Value of the shaft velocity
// ************************************ //

float getRPM(double _Count,  double SampleTime, int CountsPerRotation, int MultiplicationFactor)
{
  double _MotorRPM = 0;
  _MotorRPM = _Count/((SampleTime/1000)*CountsPerRotation*MultiplicationFactor); //Calculates actual RPM of motor shaft
  
  if(_MotorRPM < 0){
    _MotorRPM = -_MotorRPM;
  }
  
  return _MotorRPM;
}


// ************************************ //
// FUNCTION: KillMotor
// enables specified H-bridge pins if analogPinValue is low
// otherwise, disables specified H-bridge pins
// ************************************ //

int KillMotor(int analogPinValue, int ENA, int ENB )
{
   if (analogPinValue == LOW)
   {
       digitalWrite(ENA, HIGH);
       digitalWrite(ENB, HIGH);
   }
   else
   {  
       digitalWrite(ENA, LOW);
       digitalWrite(ENB, LOW);
   }
   
   return 0;
}


void computeRightRPM()
{
  _newRightEncoderPosition = RightEncoder.read();
  _rightCount = getCount( _oldRightEncoderPosition, _newRightEncoderPosition);
  _rightMotorRPM = getRPM(_rightCount, SampleTime, CountsPerRotation, MultiplicationFactor);
  
  if (_newRightEncoderPosition != _oldRightEncoderPosition) 
  {
  _oldRightEncoderPosition = _newRightEncoderPosition;
  }
}


    void computeLeftRPM()
{
    _newLeftEncoderPosition = LeftEncoder.read();  
    _leftCount = getCount( _oldLeftEncoderPosition, _newLeftEncoderPosition);
 
     if (_newLeftEncoderPosition != _oldLeftEncoderPosition) 
     {
     _leftMotorRPM = getRPM(_leftCount, SampleTime, CountsPerRotation, MultiplicationFactor);
     _oldLeftEncoderPosition = _newLeftEncoderPosition;
  }
}


double CalcRPMSet( double XHigh, double XLow, double XCentre, double AnalogInput, int PowerPin)
{
  double SlopeHigh = 0, SlopeLow = 0;
  double FHigh = 0, FLow = 0;
  double MinOut = 0.3, MaxOut = (0.9*MaxRPM), output = 0; 
  double X = 0;
  double power = 0;
  X = analogRead(AnalogInput);
  power = digitalRead(PowerPin);
  if(power == HIGH){
  if( X > XCentre){
    SlopeHigh = (MaxRPM/(XHigh-XCentre));
    FHigh = SlopeHigh*(X-XCentre);
    if((FHigh >= MinOut)&&(FHigh <= MaxOut)){
      output = -FHigh;
    }
    else if(FHigh < MinOut){
      output = 0;
    }
    else if(FHigh > MaxOut){
      output = -MaxOut;
    }
  }
  else if( X <= XCentre){
    SlopeLow = (MaxRPM/(XLow-XCentre));
    FLow = SlopeLow*(X-XCentre);
    if((FLow >= MinOut)&&(FLow <= MaxOut)){
      output = FLow;
    }
    else if(FLow < MinOut){
      output = 0;
    }
    else if(FLow > MaxOut){
      output = MaxOut;
    }
  }
  }
  else{
    output = 0;
  }
  return output;
}

int setMotorDirection(double Velocity, int INA, int INB)
{
  if(Velocity > 0){
    digitalWrite(INA, HIGH);
    digitalWrite(INB, LOW);
  }
  else if (Velocity < 0){
    digitalWrite(INA, LOW);
    digitalWrite(INB, HIGH);
  }
  else{
    digitalWrite(INA, LOW);
    digitalWrite(INB, LOW);
    Velocity = 0;
  }
  return 1;
}


double getLeftTwistRPM()
{
  double twistRPM = 0;
  double leftTwistRPM = 0;
  //double rightTwistRPM = 0;
  twistRPM = CalcRPMSet( twistXHigh, twistXLow , twistXCentre, twistRemotePin, remotePowerPin);
  leftTwistRPM = -twistRPM;
  
  return leftTwistRPM;
   
}


double getRightTwistRPM()
{
  double twistRPM = 0;
  //double leftTwistRPM = 0;
  double rightTwistRPM = 0;
  twistRPM = CalcRPMSet( twistXHigh, twistXLow , twistXCentre, twistRemotePin, remotePowerPin);
  rightTwistRPM = twistRPM;
  
  return rightTwistRPM;

}

double getLinearRPM()
{
  double linearRPM = 0;
  linearRPM = CalcRPMSet( linearXHigh, linearXLow , linearXCentre, linearRemotePin, remotePowerPin);
  
  return linearRPM;
  
}
    
void serialEvent() {
  while (Serial.available()) {
    // get the new byte:
    char inChar = (char)Serial.read(); 
    // add it to the inputString:
    inputString += inChar;
    // if the incoming character is a newline, set a flag
    // so the main loop can do something about it:
    if (inChar == '\n') {
      stringComplete = true;
      
    if (stringComplete) {
      OnReceived(inputString);

    // clear the string:
    inputString = "";
      stringComplete = false;
      }  
    } 
  }
}

void PrintDouble( double val, unsigned int precision){
// prints val with number of decimal places determine by precision
// NOTE: precision is 1 followed by the number of zeros for the desired number of decimial places
// example: printDouble( 3.1415, 100); // prints 3.14 (two decimal places)

    Serial.print (int(val));  //prints the int part
    Serial.print("."); // print the decimal point
    unsigned int frac;
    if(val >= 0)
        frac = (val - int(val)) * precision;
    else
        frac = (int(val)- val ) * precision;
    Serial.println(frac,DEC) ;
}

void ProcessTwist(double * twistvals) {
 _interLeftMotorRPMSet = CalcRPS(twistvals, 'L');
 Serial.print("Left Wheel: ");
 Serial.println(_interLeftMotorRPMSet);
 
 _interRightMotorRPMSet = CalcRPS(twistvals, 'R');
 Serial.print("Right Wheel: ");
 Serial.println(_interRightMotorRPMSet);
 
}

void OnReceived(String s) {
  if (s == "initializing\n") {
    Serial.print(s);
  } else {
    Serial.print(s); // TODO debug
      //copy String object's contents into char array
      char carr[s.length()];
      s.toCharArray(carr, s.length());
      
      //results container.
      //double array contains parsed values.
      double parsedvals[3];
      
      //parse character array into results container
      parse_twist((const char*) carr, parsedvals);
      
      //handle results
      ProcessTwist(parsedvals);
  }
}


// ************************************ //
// FUNCTION: logSetup()
// Sends a set of the configuration parameters and programmer-selected options to the serial port.  Function is intended to be called at the end of the startup sequence.
// Prints one parameter per line, formatted as "<name>,<value>"
// ************************************ //

void logSetup()
{
  Serial.println();
  Serial.println("start_flag");
  Serial.println();
  Serial.println();
  
  Serial.println("-----,ARDUINO RESET,-----");
  
  Serial.println();
  Serial.print("Joystick Mode,");
  Serial.println(JOYSTICK);
  
  Serial.print("PID Tuning Mode,");
  Serial.println(PID_TUNE);
  Serial.print("Kp,");
  Serial.println(Kp);
  Serial.print("Ki,");
  Serial.println(Ki);
  Serial.print("Kd,");
  Serial.println(Kd);
  
  Serial.print("\n");
  
  Serial.print("Max RPM,");
  Serial.println(MaxRPM);
  Serial.print("Interval Delay (ms),");
  Serial.println(SampleTime);
  Serial.println();
  
  Serial.println("-----,DATA START,-----");
  
  if( PID_TUNE )
  {
    Serial.print("Kp,Ki,Kd,");
  }
  
  Serial.println();
  Serial.println("Elapsed Time (ms),E-Stop Active,Left Command (RPM),Right Command (RPM),Left Output (?),Right Output (?),Left Feedback (RPM),Right Feedback (RPM)");
}


// ************************************ //
// FUNCTION: logLoop()
// Sends a set of runtime-related variables to the serial port.  Function is intended to be called at the end of each loop iteration.
// Values are on a single line, comma-separated.
// ************************************ //

void logLoop()
{
  if( PID_TUNE )          // Prints PID gains in real-time if it is in manual tuning mode
  {
    Serial.print(Kp);
    Serial.print(',');
    Serial.print(Ki);
    Serial.print(',');
    Serial.print(Kd);
  }
  
  
  Serial.print(millis());            // Total elapsed time
  Serial.print(',');
  Serial.print(eStopActive);         // 1 if E-stop is active (robot stopped), 0 is off (robot is active)
  Serial.print(',');
  Serial.print(_leftMotorRPMset);    // Speed setpoint of left motor
  Serial.print(',');
  Serial.print(_rightMotorRPMset);   // Speed setpoint of right motor
  Serial.print(',');
  Serial.print(_leftOutput);         // PID output sent to left motor
  Serial.print(',');
  Serial.print(_rightOutput);        // PID output sent to right motor
  Serial.print(',');
  Serial.print(_leftFeedback);       // Encoder feedback from left motor
  Serial.print(',');
  Serial.print(_rightFeedback);      // Encoder feedback from right motor
  Serial.println();
}

