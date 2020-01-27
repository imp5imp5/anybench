#! /bin/sh

echo "Make Dhrystone v 2.1"
cc  dhry_1.c dhry_2.c cpuidc.c -o ../bin/linux/arm/dhrystone_arm_armv6 -march=armv6 -O3 -D options="\"armv6 optimized\"" 
cc  dhry_1.c dhry_2.c cpuidc.c -o ../bin/linux/arm/dhrystone_arm_armv7 -march=armv7-a -O3 -D options="\"armv7 optimized\"" 
cc  dhry_1.c dhry_2.c cpuidc.c -o ../bin/linux/arm/dhrystone_arm_armv7_neon -march=armv7-a -mfpu=neon -O3 -D options="\"armv7 optimized (neon)\"" 
cc  dhry_1.c dhry_2.c cpuidc.c -o ../bin/linux/arm/dhrystone_arm_armv8_neon -march=armv8-a -mfpu=neon -O3 -D options="\"armv8 optimized (neon)\"" 
cc  dhry_1.c dhry_2.c cpuidc.c -o ../bin/linux/arm/dhrystone_arm_cortex-a53 -mcpu=cortex-a53 -mfpu=neon -O3 -D options="\"Cortex A53/A57 optimized (neon)\"" 

echo "Make Whetstone"
cc whets.c cpuidc.c -lm -lrt -o ../bin/linux/arm/whetstone_arm_armv6 -march=armv6  -O3  -D opt="\"arv6 optimized\""
cc whets.c cpuidc.c -lm -lrt -o ../bin/linux/arm/whetstone_arm_armv7 -march=armv7-a -O3  -D opt="\"armv7  optimized\""
cc whets.c cpuidc.c -lm -lrt -o ../bin/linux/arm/whetstone_arm_armv7_neon -march=armv7-a -mfpu=neon  -O3  -D opt="\"armv7 optimized (neon)\""
cc whets.c cpuidc.c -lm -lrt -o ../bin/linux/arm/whetstone_arm_armv8_neon -march=armv8-a -mfpu=neon -O3  -D opt="\"armv8  optimized (neon)\""
cc whets.c cpuidc.c -lm -lrt -o ../bin/linux/arm/whetstone_arm_cortex-a53 -mcpu=cortex-a53 -mfpu=neon -O3 -D opt="\"Cortex A53/A57 optimized (neon)\"" 

echo "Make Memspeed"
cc memspeed.c cpuidc.c -lm -lrt -o ../bin/linux/arm/memspeed_arm_armv6 -march=armv6 -O3   -D options="\"arv6 optimized\""
cc memspeed.c cpuidc.c -lm -lrt -o ../bin/linux/arm/memspeed_arm_armv7 -march=armv7-a -O3  -D options="\"armv7 optimized\""
cc memspeed.c cpuidc.c -lm -lrt -o ../bin/linux/arm/memspeed_arm_armv7_neon -march=armv7-a -mfpu=neon -O3   -D options="\"armv7 optimized (neon)\""
cc memspeed.c cpuidc.c -lm -lrt -o ../bin/linux/arm/memspeed_arm_armv8_neon -march=armv8-a -mfpu=neon -O3  -D options="\"armv8 optimized (neon)\""
cc memspeed.c cpuidc.c -lm -lrt -o ../bin/linux/arm/memspeed_arm_cortex-a53 -mcpu=cortex-a53 -mfpu=neon -O3 -D options="\"Cortex A53/A57 optimized (neon)\"" 

echo "Make Linpack"
cc linpack.c cpuidc.c -lm -lrt -o ../bin/linux/arm/linpack_arm_armv6 -march=armv6 -O2   -D options="\"arv6 optimized\""
cc linpack.c cpuidc.c -lm -lrt -o ../bin/linux/arm/linpack_arm_armv7 -march=armv7-a -O2  -D options="\"armv7  optimized\""
cc linpack.c cpuidc.c -lm -lrt -o ../bin/linux/arm/linpack_arm_armv7_neon -march=armv7-a -mfpu=neon -O2   -D options="\"armv7 optimized (neon)\""
cc linpack.c cpuidc.c -lm -lrt -o ../bin/linux/arm/linpack_arm_armv8_neon -march=armv8-a -mfpu=neon -O2  -D options="\"armv8  optimized (neon)\""
cc linpack.c cpuidc.c -lm -lrt -o ../bin/linux/arm/linpack_arm_cortex-a53 -mcpu=cortex-a53 -mfpu=neon -O2 -D options="\"Cortex A53/A57 optimized (neon)\"" 

echo "Make Lloops"
cc lloops.c cpuidc.c -lm -lrt -o ../bin/linux/arm/lloops_arm_armv6 -march=armv6 -O3   -D options="\"arv6 optimized\""
cc lloops.c cpuidc.c -lm -lrt -o ../bin/linux/arm/lloops_arm_armv7 -march=armv7-a -O3  -D options="\"armv7  optimized\""
cc lloops.c cpuidc.c -lm -lrt -o ../bin/linux/arm/lloops_arm_armv7_neon -march=armv7-a -mfpu=neon -O3   -D options="\"armv7 optimized (neon)\""
cc lloops.c cpuidc.c -lm -lrt -o ../bin/linux/arm/lloops_arm_armv8_neon -march=armv8-a -mfpu=neon -O3  -D options="\"armv8  optimized (neon)\""
cc lloops.c cpuidc.c -lm -lrt -o ../bin/linux/arm/lloops_arm_cortex-a53 -mcpu=cortex-a53 -mfpu=neon -O3 -D options="\"Cortex A53/A57 optimized (neon)\"" 


echo "Make WhetstoneMP"
cc mp/whetsmp.c mp/cpuidc64.c -lm -lrt -o ../bin/linux/arm/whetstone_mp_arm_armv6 -pthread -march=armv6 -O2   -D options="\"armv6 optimized\""
cc mp/whetsmp.c mp/cpuidc64.c -lm -lrt -o ../bin/linux/arm/whetstone_mp_arm_armv7 -pthread -m64 -march=armv7-a -O2  -D options="\"armv7  optimized\""
cc mp/whetsmp.c mp/cpuidc64.c -lm -lrt -o ../bin/linux/arm/whetstone_mp_arm_armv7_neon -pthread -m64 -march=armv7-a -mfpu=neon -O2   -D options="\"armv7 optimized (neon)\""
cc mp/whetsmp.c mp/cpuidc64.c -lm -lrt -o ../bin/linux/arm/whetstone_mp_arm_armv8_neon -pthread -m64 -march=armv8-a -mfpu=neon -O2  -D options="\"armv8  optimized (neon)\""
cc mp/whetsmp.c mp/cpuidc64.c -lm -lrt -o ../bin/linux/arm/whetstone_mp_arm_cortex-a53 -pthread -mcpu=cortex-a53 -mfpu=neon -O2 -D options="\"Cortex A53/A57 optimized (neon)\"" 

echo "Make MPMFlops"
cc mp/mpmflops.c mp/cpuidc64.c -lm -lrt -o ../bin/linux/arm/mpmflops_mp_armv6 -pthread -m64 -march=armv6 -O3   -D options="\"arv6 optimized\""
cc mp/mpmflops.c mp/cpuidc64.c -lm -lrt -o ../bin/linux/arm/mpmflops_mp_armv7 -pthread -m64 -march=armv7-a -O3  -D options="\"armv7  optimized\""
cc mp/mpmflops.c mp/cpuidc64.c -lm -lrt -o ../bin/linux/arm/mpmflops_mp_armv7_neon -pthread -m64 -march=armv7-a -mfpu=neon -O3   -D options="\"armv7 optimized (neon)\""
cc mp/mpmflops.c mp/cpuidc64.c -lm -lrt -o ../bin/linux/arm/mpmflops_mp_armv8_neon -pthread -m64 -march=armv8-a -mfpu=neon -O3  -D options="\"armv8  optimized (neon)\""
cc mp/mpmflops.c mp/cpuidc64.c -lm -lrt -o ../bin/linux/arm/mpmflops_mp_cortex-a53 -pthread -m64 -mcpu=cortex-a53 -mfpu=neon -O3 -D options="\"Cortex A53/A57 optimized (neon)\"" 