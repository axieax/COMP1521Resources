
// lb $t5, 12($t9)

uint32_t t9 = get_register(9);
uint32_t addr = t9 + 12;

uint32_t theByte = get_byte(addr);

set_register(5, theByte);