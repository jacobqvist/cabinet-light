import bitmap show bytemap_zap
import pixel_strip show UartPixelStrip
import gpio
import serial.protocols.i2c as i2c
import vcnl4040 show Vcnl4040

//Pixel strip
PIXELS ::= 30  // Number of pixels on the strip.
pixels := UartPixelStrip PIXELS --pin=27  // Output pin - this is the normal pin for UART 2.
r := ByteArray PIXELS
g := ByteArray PIXELS
b := ByteArray PIXELS

main:
    set_up_proximity_sensor_
    while true:
        if sensor.read_ps_data < 4:
            r.fill 50
            g.fill 50
            b.fill 50
            pixels.output r g b
        else: 
            r.fill 0
            g.fill 0
            b.fill 0
            pixels.output r g b
        sleep --ms=250

// Proximity sensor.
sda ::= gpio.Pin 21
scl ::= gpio.Pin 22

bus := i2c.Bus
    --sda=sda
    --scl=scl
    --frequency=1000

device := bus.device Vcnl4040.I2C_ADDRESS

sensor := Vcnl4040 device

id := sensor.get_id

set_up_proximity_sensor_: 
  sensor.set_ps_led_current 200         // Max is 200mA.
  sensor.set_ps_duty_cycle 40           // Max infrared duty cycle is 1/40.
  sensor.set_ps_integration_time Vcnl4040.PS_IT_8T  // Max integration time.
  sensor.set_ps_resolution 16           // 16 bit output.
  sensor.set_ps_smart_persistence true  // Enable smart persistence.
  sensor.set_ps_power true              // Power on.

  