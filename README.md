# Closet light

I hate, when I cannot see what's in my closet. Closets with light are expensive as \*\*\*\*, so I decided to build my own. Next step is to make it prettier.

![Closet light](media/closet-light.gif)

## Step by step

### 1. Components

The project uses the following components:

1. ESP32-wroom-32E development board
2. VCNL4040 proximity sensor
3. NeoPixel strip. I used one with 30 pixels. Make sure it uses WS2812.
4. Powerbank
5. Cables

### 2. Putting everything together

VCNL4040 sensor:

- GPIO21 > SDA
- GPIO22 > SCL
- GND > GND
- 3.3V > 3.3V

Pixel strip:

- GPIO27 > Data input
- 5V > 5V
- GND > GND

### 3. Running the program

Prepare the open source Toit language by following the steps [here](https://github.com/toitlang/toit).

Compile an ESP32 image from the program:

```
cd <path-to-toit-lang>
make esp32 ESP32_ENTRY=<path-to-spin-tree>/spin-tree/src/main.toit
```

Connect the ESP32 to your computer and flash the program by pasting the output from `make esp32` into the terminal.

### 4. Enjoy the festivities

Once the program has been flashed, it will start running every time the ESP32 is powered on.

## Useful links

- The stepper motor driver has been compiled into a Toit package: https://github.com/toitware/toit-A3967
- I used this guide to figure out how to wire up the stepper motor with the driver: https://learn.sparkfun.com/tutorials/easy-driver-hook-up-guide
- The EasyDriver webpage provided the step resolution values: http://www.schmalzhaus.com/EasyDriver/
