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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/Master Degree/VSOIZM/vsoizm/Practice/CONVOLUTION_UNIT.vhd";



static void work_a_3271151099_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(156, ng0);

LAB3:    t1 = (t0 + 5832U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t1 = (t0 + 8816);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 8720);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3271151099_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(157, ng0);

LAB3:    t1 = (t0 + 5992U);
    t2 = *((char **)t1);
    t3 = *((int *)t2);
    t1 = (t0 + 8880);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((int *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 8736);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3271151099_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3271151099_3212880686_p_0,(void *)work_a_3271151099_3212880686_p_1};
	xsi_register_didat("work_a_3271151099_3212880686", "isim/TB_CONVOLUTION_UNIT_isim_beh.exe.sim/work/a_3271151099_3212880686.didat");
	xsi_register_executes(pe);
}
