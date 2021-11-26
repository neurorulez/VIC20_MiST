#include "diskimg.h"

const char *bootrom_name="VIC20   ROM";

char *autoboot()
{
        char *result=0;
        LoadROM(bootrom_name);
        return(result);
}


