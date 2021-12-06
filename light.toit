import bitmap show bytemap_zap
import pixel_strip show UartPixelStrip
import .vc as vc

PIXELS ::= 30  // Number of pixels on the strip.
pixels := UartPixelStrip PIXELS --pin=27  // Output pin - this is the normal pin for UART 2.
r := ByteArray PIXELS
g := ByteArray PIXELS
b := ByteArray PIXELS

main:
    while true:
        if vc.main < 4:
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

        