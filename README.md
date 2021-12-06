# Cabinet light

I hate, when I cannot see what's in my cabinet. Cabinets with light are expensive as \*\*\*\*, so I decided to build my own. Next step is to make it pretty.

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
make esp32 ESP32_ENTRY=<path-to-cabinet-light>/cabinet-light/light.toit
```

Connect the ESP32 to your computer and flash the program by pasting the output from `make esp32` into the terminal.

### 4. Enjoy your smart cabinet

Once the program has been flashed, it will start running every time the ESP32 is powered on.
