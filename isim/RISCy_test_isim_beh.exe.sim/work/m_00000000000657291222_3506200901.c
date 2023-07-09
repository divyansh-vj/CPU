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
static const char *ng0 = "C:/Users/Student/Downloads/ultimate/CPU_grp21/ALU_controller.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {7U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};
static unsigned int ng5[] = {3U, 0U};
static unsigned int ng6[] = {4U, 0U};
static unsigned int ng7[] = {5U, 0U};
static unsigned int ng8[] = {6U, 0U};
static unsigned int ng9[] = {14U, 0U};
static unsigned int ng10[] = {13U, 0U};
static unsigned int ng11[] = {8U, 0U};
static unsigned int ng12[] = {9U, 0U};
static unsigned int ng13[] = {10U, 0U};
static unsigned int ng14[] = {15U, 0U};
static unsigned int ng15[] = {11U, 0U};
static unsigned int ng16[] = {15U, 15U};



static void Always_23_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;

LAB0:    t1 = (t0 + 2528U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 2848);
    *((int *)t2) = 1;
    t3 = (t0 + 2560);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(24, ng0);

LAB5:    xsi_set_current_line(25, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_xcompare(t5, 3, t4, 3);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t6 = xsi_vlog_unsigned_case_xcompare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_xcompare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_xcompare(t5, 3, t2, 3);
    if (t6 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(26, ng0);
    t7 = ((char*)((ng2)));
    t8 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 4, 0LL);
    goto LAB17;

LAB9:    xsi_set_current_line(28, ng0);

LAB18:    xsi_set_current_line(29, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);

LAB19:    t3 = ((char*)((ng3)));
    t9 = xsi_vlog_unsigned_case_xcompare(t4, 6, t3, 6);
    if (t9 == 1)
        goto LAB20;

LAB21:    t2 = ((char*)((ng4)));
    t6 = xsi_vlog_unsigned_case_xcompare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB22;

LAB23:    t2 = ((char*)((ng5)));
    t6 = xsi_vlog_unsigned_case_xcompare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB24;

LAB25:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_xcompare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB26;

LAB27:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_xcompare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB28;

LAB29:    t2 = ((char*)((ng8)));
    t6 = xsi_vlog_unsigned_case_xcompare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB30;

LAB31:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_xcompare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB32;

LAB33:    t2 = ((char*)((ng11)));
    t6 = xsi_vlog_unsigned_case_xcompare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB34;

LAB35:    t2 = ((char*)((ng12)));
    t6 = xsi_vlog_unsigned_case_xcompare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng13)));
    t6 = xsi_vlog_unsigned_case_xcompare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB38;

LAB39:    t2 = ((char*)((ng15)));
    t6 = xsi_vlog_unsigned_case_xcompare(t4, 6, t2, 6);
    if (t6 == 1)
        goto LAB40;

LAB41:
LAB43:
LAB42:    xsi_set_current_line(41, ng0);
    t2 = ((char*)((ng16)));
    t3 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB44:    goto LAB17;

LAB11:    xsi_set_current_line(44, ng0);
    t3 = ((char*)((ng3)));
    t7 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB17;

LAB13:    xsi_set_current_line(45, ng0);
    t3 = ((char*)((ng4)));
    t7 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB17;

LAB20:    xsi_set_current_line(30, ng0);
    t7 = ((char*)((ng3)));
    t8 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 4, 0LL);
    goto LAB44;

LAB22:    xsi_set_current_line(31, ng0);
    t3 = ((char*)((ng4)));
    t7 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB44;

LAB24:    xsi_set_current_line(32, ng0);
    t3 = ((char*)((ng5)));
    t7 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB44;

LAB26:    xsi_set_current_line(33, ng0);
    t3 = ((char*)((ng6)));
    t7 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB44;

LAB28:    xsi_set_current_line(34, ng0);
    t3 = ((char*)((ng1)));
    t7 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB44;

LAB30:    xsi_set_current_line(35, ng0);
    t3 = ((char*)((ng9)));
    t7 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB44;

LAB32:    xsi_set_current_line(36, ng0);
    t3 = ((char*)((ng10)));
    t7 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB44;

LAB34:    xsi_set_current_line(37, ng0);
    t3 = ((char*)((ng8)));
    t7 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB44;

LAB36:    xsi_set_current_line(38, ng0);
    t3 = ((char*)((ng7)));
    t7 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB44;

LAB38:    xsi_set_current_line(39, ng0);
    t3 = ((char*)((ng14)));
    t7 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB44;

LAB40:    xsi_set_current_line(40, ng0);
    t3 = ((char*)((ng2)));
    t7 = (t0 + 1608);
    xsi_vlogvar_wait_assign_value(t7, t3, 0, 0, 4, 0LL);
    goto LAB44;

}


extern void work_m_00000000000657291222_3506200901_init()
{
	static char *pe[] = {(void *)Always_23_0};
	xsi_register_didat("work_m_00000000000657291222_3506200901", "isim/RISCy_test_isim_beh.exe.sim/work/m_00000000000657291222_3506200901.didat");
	xsi_register_executes(pe);
}
