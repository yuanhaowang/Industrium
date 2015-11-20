File definitions:
IMG2coe8: 8 bit color with RGB(3:3:2). Indexed (R2->R0,G2->G0,B1->B0).
IMG2coe16: 16 bit high color with RGB(5:6:5). Indexed (R4->R0,G5->G0,B4->B0).
IMG2coe24: 24 bit true color with RGB(8:8:8). Indexed (R7->R0,G7->G0,B7->B0).

FYI: Green is favored because it is more sensitive to the eye.

To parse data for VGA 24-bit colors, just take the corresponding colors (e.g. R2->R0) and zero-extend the value on the right to fill up eight bits (for example, just (R2->R0)<<4).