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



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003747177884_4196211228_init();
    work_m_00000000002349747457_3114136509_init();
    work_m_00000000000367345849_2386756495_init();
    work_m_00000000001768844897_2497258287_init();
    work_m_00000000004237673356_1635510040_init();
    work_m_00000000002061385928_3377421139_init();
    work_m_00000000003822724821_0671229102_init();
    xilinxcorelib_ver_m_00000000001358910285_2852462055_init();
    xilinxcorelib_ver_m_00000000001358910285_0367428356_init();
    xilinxcorelib_ver_m_00000000001687936702_2843080771_init();
    xilinxcorelib_ver_m_00000000000277421008_1317999857_init();
    xilinxcorelib_ver_m_00000000001603977570_4262573419_init();
    work_m_00000000003388451136_0133456765_init();
    work_m_00000000003921848695_2032185554_init();
    work_m_00000000004061202603_3016065818_init();
    work_m_00000000002520025328_3866583278_init();
    work_m_00000000000657291222_3506200901_init();
    work_m_00000000003707462251_3948285920_init();
    work_m_00000000002502585927_0886308060_init();
    xilinxcorelib_ver_m_00000000000277421008_1762924538_init();
    xilinxcorelib_ver_m_00000000001603977570_2213345493_init();
    work_m_00000000000403262735_2235658470_init();
    work_m_00000000002706077852_1151974483_init();
    work_m_00000000002541386588_3924745081_init();
    work_m_00000000001085427784_0434982178_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001085427784_0434982178");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
