/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *WORK_P_0254625400;
char *IEEE_P_1242562249;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    work_p_0254625400_init();
    work_a_0903350723_3212880686_init();
    work_a_3104156649_3212880686_init();
    work_a_1419723410_3212880686_init();
    work_a_3519065343_3212880686_init();
    work_a_3663490805_3212880686_init();
    work_a_1289894398_3212880686_init();
    work_a_1773109287_3212880686_init();
    work_a_3417840354_3212880686_init();
    work_a_1368451316_3212880686_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_2823203958_3212880686_init();
    work_a_1812436709_3212880686_init();
    work_a_3641961705_3212880686_init();
    work_a_3127546479_3212880686_init();
    work_a_3035372467_3212880686_init();
    work_a_2151305322_3212880686_init();
    work_a_3271151099_3212880686_init();
    work_a_1852830307_2372691052_init();


    xsi_register_tops("work_a_1852830307_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    WORK_P_0254625400 = xsi_get_engine_memory("work_p_0254625400");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");

    return xsi_run_simulation(argc, argv);

}
