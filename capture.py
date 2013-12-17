#!/usr/bin/python
import serial
import signal
import atexit
import os
import optparse

# parse input
parser = optparse.OptionParser()

parser.add_option('-o', '--output',
    action='store', dest='output',
    help='output file', default='./messages.log')

parser.add_option('-i', '--input',
    action='store', dest='input',
    help='usb file to read',
    default='/dev/ttyUSB0')

parser.add_option('-b', '--baud',
    action='store', dest='baud',
    help='baud rate for reading device file',
    default='9600')

options, args = parser.parse_args()

print "reading serial device"
ser = serial.Serial(options.input, options.baud)

print "opening output file"
try:
  os.remove(options.output)
except OSError:
  pass

output = open(options.output, 'w')

def cleanup():
  # close serial connection
  ser.close()
  # close outfile
  output.close()

if __name__ == "__main__":
  atexit.register(cleanup)
  signal.signal(signal.SIGTERM, lambda signum, stack_frame: exit(1))
  print "ctrl+c to quit"

  # throw this away
  data = ser.readline()

  while True:
    data = ser.readline()
    output.write(data) 
    output.flush()
