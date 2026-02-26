SECTIONS {
 . = ALIGN(8);
 .tn_static_memregion :
 {
  KEEP(*(.tn_static_memregion))
 }
}
INSERT AFTER .data
