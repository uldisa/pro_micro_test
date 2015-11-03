import serial
import sys
ser = serial.Serial(sys.argv[1],1200)
ser.close()
