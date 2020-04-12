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
static const char *ng0 = "E:/Master Degree/VSOIZM/vsoizm/Practice/DIVIDER.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_1242562249_sub_2720006528_1035706684(char *, char *, char *, char *, char *);
unsigned char ieee_p_1242562249_sub_2720042465_1035706684(char *, char *, char *, char *, char *);
unsigned char ieee_p_1242562249_sub_2720078402_1035706684(char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_2849293644_1035706684(char *, char *, char *, char *, char *, char *);


static void work_a_3417840354_3212880686_p_0(char *t0)
{
    char t12[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 6500U);
    t3 = (t0 + 2208U);
    t4 = *((char **)t3);
    t3 = (t0 + 6580U);
    t5 = ieee_p_1242562249_sub_2720042465_1035706684(IEEE_P_1242562249, t2, t1, t4, t3);
    if (t5 != 0)
        goto LAB3;

LAB4:
LAB5:    t13 = (t0 + 1032U);
    t14 = *((char **)t13);
    t13 = (t0 + 6484U);
    t15 = (t0 + 1192U);
    t16 = *((char **)t15);
    t15 = (t0 + 6500U);
    t17 = ieee_p_1242562249_sub_2849293644_1035706684(IEEE_P_1242562249, t12, t14, t13, t16, t15);
    t18 = (t12 + 12U);
    t19 = *((unsigned int *)t18);
    t20 = (1U * t19);
    t21 = (24U != t20);
    if (t21 == 1)
        goto LAB7;

LAB8:    t22 = (t0 + 4240);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t17, 24U);
    xsi_driver_first_trans_fast(t22);

LAB2:    t27 = (t0 + 4128);
    *((int *)t27) = 1;

LAB1:    return;
LAB3:    t6 = (t0 + 2208U);
    t7 = *((char **)t6);
    t6 = (t0 + 4240);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t7, 24U);
    xsi_driver_first_trans_fast(t6);
    goto LAB2;

LAB6:    goto LAB2;

LAB7:    xsi_size_not_matching(24U, t20, 0);
    goto LAB8;

}

static void work_a_3417840354_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(47, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 4304);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 24U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 4144);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3417840354_3212880686_p_2(char *t0)
{
    char t13[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    char *t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;

LAB0:    xsi_set_current_line(51, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6532U);
    t3 = (t0 + 2208U);
    t4 = *((char **)t3);
    t3 = (t0 + 6580U);
    t5 = ieee_p_1242562249_sub_2720006528_1035706684(IEEE_P_1242562249, t2, t1, t4, t3);
    if (t5 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 6532U);
    t3 = (t0 + 2328U);
    t4 = *((char **)t3);
    t3 = (t0 + 2088U);
    t6 = *((char **)t3);
    t7 = ((IEEE_P_2592010699) + 4024);
    t8 = (t0 + 6596U);
    t9 = (t0 + 6564U);
    t3 = xsi_base_array_concat(t3, t13, t7, (char)97, t4, t8, (char)97, t6, t9, (char)101);
    t5 = ieee_p_1242562249_sub_2720078402_1035706684(IEEE_P_1242562249, t2, t1, t3, t13);
    if (t5 != 0)
        goto LAB5;

LAB6:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t17 = (8 - 1);
    t18 = (23 - t17);
    t19 = (t18 * 1U);
    t20 = (0 + t19);
    t1 = (t2 + t20);
    t3 = (t0 + 4368);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 8U);
    xsi_driver_first_trans_fast_port(t3);

LAB3:    t1 = (t0 + 4160);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(52, ng0);
    t6 = xsi_get_transient_memory(8U);
    memset(t6, 0, 8U);
    t7 = t6;
    memset(t7, (unsigned char)2, 8U);
    t8 = (t0 + 4368);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t6, 8U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB3;

LAB5:    xsi_set_current_line(54, ng0);
    t10 = (t0 + 2088U);
    t11 = *((char **)t10);
    t10 = (t0 + 4368);
    t12 = (t10 + 56U);
    t14 = *((char **)t12);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    memcpy(t16, t11, 8U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB3;

}


extern void work_a_3417840354_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3417840354_3212880686_p_0,(void *)work_a_3417840354_3212880686_p_1,(void *)work_a_3417840354_3212880686_p_2};
	xsi_register_didat("work_a_3417840354_3212880686", "isim/TB_CONVOLUTION_UNIT_isim_beh.exe.sim/work/a_3417840354_3212880686.didat");
	xsi_register_executes(pe);
}
