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
extern char *STD_TEXTIO;
static const char *ng1 = "text_file";
extern char *STD_STANDARD;
extern char *IEEE_P_2592010699;



char *work_p_0254625400_sub_2319385382_2647503029(char *t1, char *t2, char *t3, int t4)
{
    char t5[568];
    char t6[24];
    char t18[32];
    char t27[524288];
    char t36[8];
    char t42[8];
    char t45[16];
    char t51[8];
    char t64[16];
    char t65[16];
    char t66[16];
    char t67[16];
    char *t0;
    char *t7;
    char *t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    char *t20;
    int t21;
    unsigned int t22;
    char *t23;
    int t24;
    char *t25;
    char *t26;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t43;
    char *t44;
    char *t46;
    char *t47;
    int t48;
    char *t49;
    char *t50;
    char *t52;
    char *t53;
    char *t54;
    char *t55;
    unsigned char t56;
    char *t57;
    char *t58;
    int t59;
    int t60;
    int t61;
    char *t62;
    char *t63;
    int t68;
    int t69;
    int t70;
    int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    static char *nl0[] = {&&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB20, &&LAB21, &&LAB22, &&LAB23, &&LAB24, &&LAB25, &&LAB26, &&LAB27, &&LAB28, &&LAB29, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB30, &&LAB31, &&LAB32, &&LAB33, &&LAB34, &&LAB35, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB30, &&LAB31, &&LAB32, &&LAB33, &&LAB34, &&LAB35, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36};

LAB0:    t7 = ((STD_TEXTIO) + 3440);
    t8 = (t3 + 12U);
    t9 = *((unsigned int *)t8);
    t9 = (t9 * 1U);
    t10 = (t5 + 4U);
    t11 = xsi_create_file_variable_in_buffer(0, ng1, t7, t2, t9, 1);
    *((char **)t10) = t11;
    t12 = (t5 + 12U);
    t13 = ((STD_TEXTIO) + 3280);
    t14 = (t12 + 56U);
    *((char **)t14) = t13;
    t15 = (t12 + 40U);
    *((char **)t15) = 0;
    t16 = (t12 + 64U);
    *((int *)t16) = 1;
    t17 = (t12 + 48U);
    *((char **)t17) = 0;
    t19 = (t18 + 0U);
    t20 = (t19 + 0U);
    *((int *)t20) = 0;
    t20 = (t19 + 4U);
    *((int *)t20) = 65535;
    t20 = (t19 + 8U);
    *((int *)t20) = 1;
    t21 = (65535 - 0);
    t22 = (t21 * 1);
    t22 = (t22 + 1);
    t20 = (t19 + 12U);
    *((unsigned int *)t20) = t22;
    t20 = (t18 + 16U);
    t23 = (t20 + 0U);
    *((int *)t23) = 7;
    t23 = (t20 + 4U);
    *((int *)t23) = 0;
    t23 = (t20 + 8U);
    *((int *)t23) = -1;
    t24 = (0 - 7);
    t22 = (t24 * -1);
    t22 = (t22 + 1);
    t23 = (t20 + 12U);
    *((unsigned int *)t23) = t22;
    t23 = (t5 + 84U);
    t25 = (t1 + 2720);
    t26 = (t23 + 88U);
    *((char **)t26) = t25;
    t28 = (t23 + 56U);
    *((char **)t28) = t27;
    xsi_type_set_default_value(t25, t27, 0);
    t29 = (t23 + 64U);
    t30 = (t25 + 80U);
    t31 = *((char **)t30);
    *((char **)t29) = t31;
    t32 = (t23 + 80U);
    *((unsigned int *)t32) = 524288U;
    t33 = (t5 + 204U);
    t34 = ((STD_STANDARD) + 192);
    t35 = (t33 + 88U);
    *((char **)t35) = t34;
    t37 = (t33 + 56U);
    *((char **)t37) = t36;
    xsi_type_set_default_value(t34, t36, 0);
    t38 = (t33 + 80U);
    *((unsigned int *)t38) = 1U;
    t39 = (t5 + 324U);
    t40 = ((STD_STANDARD) + 384);
    t41 = (t39 + 88U);
    *((char **)t41) = t40;
    t43 = (t39 + 56U);
    *((char **)t43) = t42;
    xsi_type_set_default_value(t40, t42, 0);
    t44 = (t39 + 80U);
    *((unsigned int *)t44) = 4U;
    t46 = (t45 + 0U);
    t47 = (t46 + 0U);
    *((int *)t47) = 3;
    t47 = (t46 + 4U);
    *((int *)t47) = 0;
    t47 = (t46 + 8U);
    *((int *)t47) = -1;
    t48 = (0 - 3);
    t22 = (t48 * -1);
    t22 = (t22 + 1);
    t47 = (t46 + 12U);
    *((unsigned int *)t47) = t22;
    t47 = (t5 + 444U);
    t49 = ((IEEE_P_2592010699) + 4024);
    t50 = (t47 + 88U);
    *((char **)t50) = t49;
    t52 = (t47 + 56U);
    *((char **)t52) = t51;
    xsi_type_set_default_value(t49, t51, t45);
    t53 = (t47 + 64U);
    *((char **)t53) = t45;
    t54 = (t47 + 80U);
    *((unsigned int *)t54) = 4U;
    t55 = (t6 + 4U);
    t56 = (t2 != 0);
    if (t56 == 1)
        goto LAB3;

LAB2:    t57 = (t6 + 12U);
    *((char **)t57) = t3;
    t58 = (t6 + 20U);
    *((int *)t58) = t4;
    t59 = (t4 - 1);
    t60 = 0;
    t61 = t59;

LAB4:    if (t60 <= t61)
        goto LAB5;

LAB7:    t7 = (t23 + 56U);
    t8 = *((char **)t7);
    t56 = (524288U != 524288U);
    if (t56 == 1)
        goto LAB54;

LAB55:    t0 = xsi_get_transient_memory(524288U);
    memcpy(t0, t8, 524288U);

LAB1:    xsi_access_variable_delete(t12);
    t7 = (t5 + 4U);
    t8 = *((char **)t7);
    xsi_delete_file_variable(t8);
    return t0;
LAB3:    *((char **)t55) = t2;
    goto LAB2;

LAB5:    t62 = (t5 + 4U);
    t63 = *((char **)t62);
    std_textio_readline(STD_TEXTIO, (char *)0, t63, t12);
    t7 = (t39 + 56U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    *((int *)t7) = 0;

LAB8:    t7 = (t39 + 56U);
    t8 = *((char **)t7);
    t21 = *((int *)t8);
    if (7 > 0)
        goto LAB12;

LAB13:    if (-1 == -1)
        goto LAB17;

LAB18:    t24 = 0;

LAB14:    t56 = (t21 < t24);
    if (t56 != 0)
        goto LAB9;

LAB11:
LAB6:    if (t60 == t61)
        goto LAB7;

LAB53:    t21 = (t60 + 1);
    t60 = t21;
    goto LAB4;

LAB9:    t7 = (t33 + 56U);
    t10 = *((char **)t7);
    t7 = (t10 + 0);
    std_textio_read8(STD_TEXTIO, (char *)0, t12, t7);
    t7 = (t33 + 56U);
    t8 = *((char **)t7);
    t56 = *((unsigned char *)t8);
    t7 = (char *)((nl0) + t56);
    goto **((char **)t7);

LAB10:;
LAB12:    if (-1 == 1)
        goto LAB15;

LAB16:    t24 = 7;
    goto LAB14;

LAB15:    t24 = 0;
    goto LAB14;

LAB17:    t24 = 7;
    goto LAB14;

LAB19:    t7 = (t47 + 56U);
    t8 = *((char **)t7);
    t7 = (t23 + 56U);
    t10 = *((char **)t7);
    if (7 > 0)
        goto LAB39;

LAB40:    if (-1 == -1)
        goto LAB44;

LAB45:    t21 = 0;

LAB41:    t7 = (t39 + 56U);
    t11 = *((char **)t7);
    t24 = *((int *)t11);
    t48 = (t21 - t24);
    t9 = (7 - t48);
    if (7 > 0)
        goto LAB46;

LAB47:    if (-1 == -1)
        goto LAB51;

LAB52:    t59 = 0;

LAB48:    t7 = (t39 + 56U);
    t13 = *((char **)t7);
    t68 = *((int *)t13);
    t69 = (t59 - t68);
    t70 = (t69 - 3);
    xsi_vhdl_check_range_of_slice(7, 0, -1, t48, t70, -1);
    t22 = (t9 * 1U);
    t71 = (t60 - 0);
    t72 = (t71 * 1);
    xsi_vhdl_check_range_of_index(0, 65535, 1, t60);
    t73 = (8U * t72);
    t74 = (0 + t73);
    t75 = (t74 + t22);
    t7 = (t10 + t75);
    t14 = (t45 + 12U);
    t76 = *((unsigned int *)t14);
    t76 = (t76 * 1U);
    memcpy(t7, t8, t76);
    t7 = (t39 + 56U);
    t8 = *((char **)t7);
    t21 = *((int *)t8);
    t24 = (t21 + 4);
    t7 = (t39 + 56U);
    t10 = *((char **)t7);
    t7 = (t10 + 0);
    *((int *)t7) = t24;
    goto LAB8;

LAB20:    t10 = (t1 + 4116);
    t13 = (t47 + 56U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    memcpy(t13, t10, 4U);
    goto LAB19;

LAB21:    t7 = (t1 + 4120);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB22:    t7 = (t1 + 4124);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB23:    t7 = (t1 + 4128);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB24:    t7 = (t1 + 4132);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB25:    t7 = (t1 + 4136);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB26:    t7 = (t1 + 4140);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB27:    t7 = (t1 + 4144);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB28:    t7 = (t1 + 4148);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB29:    t7 = (t1 + 4152);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB30:    t7 = (t1 + 4156);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB31:    t7 = (t1 + 4160);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB32:    t7 = (t1 + 4164);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB33:    t7 = (t1 + 4168);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB34:    t7 = (t1 + 4172);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB35:    t7 = (t1 + 4176);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    goto LAB19;

LAB36:    t7 = (t1 + 4180);
    t10 = (t47 + 56U);
    t11 = *((char **)t10);
    t10 = (t11 + 0);
    memcpy(t10, t7, 4U);
    if ((unsigned char)0 == 0)
        goto LAB37;

LAB38:    goto LAB19;

LAB37:    t7 = (t1 + 4184);
    t10 = (t33 + 56U);
    t11 = *((char **)t10);
    t56 = *((unsigned char *)t11);
    t13 = ((STD_STANDARD) + 1008);
    t14 = (t65 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 1;
    t15 = (t14 + 4U);
    *((int *)t15) = 25;
    t15 = (t14 + 8U);
    *((int *)t15) = 1;
    t21 = (25 - 1);
    t9 = (t21 * 1);
    t9 = (t9 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t9;
    t10 = xsi_base_array_concat(t10, t64, t13, (char)97, t7, t65, (char)99, t56, (char)101);
    t15 = (t1 + 4209);
    t19 = ((STD_STANDARD) + 1008);
    t20 = (t67 + 0U);
    t25 = (t20 + 0U);
    *((int *)t25) = 1;
    t25 = (t20 + 4U);
    *((int *)t25) = 1;
    t25 = (t20 + 8U);
    *((int *)t25) = 1;
    t24 = (1 - 1);
    t9 = (t24 * 1);
    t9 = (t9 + 1);
    t25 = (t20 + 12U);
    *((unsigned int *)t25) = t9;
    t17 = xsi_base_array_concat(t17, t66, t19, (char)97, t10, t64, (char)97, t15, t67, (char)101);
    t9 = (25U + 1U);
    t22 = (t9 + 1U);
    xsi_report(t17, t22, 2);
    goto LAB38;

LAB39:    if (-1 == 1)
        goto LAB42;

LAB43:    t21 = 7;
    goto LAB41;

LAB42:    t21 = 0;
    goto LAB41;

LAB44:    t21 = 7;
    goto LAB41;

LAB46:    if (-1 == 1)
        goto LAB49;

LAB50:    t59 = 7;
    goto LAB48;

LAB49:    t59 = 0;
    goto LAB48;

LAB51:    t59 = 7;
    goto LAB48;

LAB54:    xsi_size_not_matching(524288U, 524288U, 0);
    goto LAB55;

LAB56:;
}


void ieee_p_2592010699_sub_3130575329_503743352();

extern void work_p_0254625400_init()
{
	static char *se[] = {(void *)work_p_0254625400_sub_2319385382_2647503029};
	xsi_register_didat("work_p_0254625400", "isim/TB_LINE_OPERATOR_isim_beh.exe.sim/work/p_0254625400.didat");
	xsi_register_subprogram_executes(se);
	xsi_register_resolution_function(1, 2, (void *)ieee_p_2592010699_sub_3130575329_503743352, 4);
}
