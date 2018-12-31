


# Pin allocations (FPGA):

**DON'T FORGET TO CONNECT GROUND! (single red wire)**

## LVDS pairs:
 * tx_a:       A5  (yellow) & B6 (orange)
 * clk_a:      B9  (blue) & A10 (green)

## uC SPI connection:
 * mosi:       E15 (brown) -> connect to PA13
 * spi_clk_in: F15 (white) -> connect to PA14
 * cs:         G15 (black) -> connect to PA9
 * miso:       H15 (grey)  -> connect to PA12

## Not connected:
reset_n:    B3

