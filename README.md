gk802 - hardfp
=====

Gentoo overlay for some of the freescale packages customized for the gk802 device.
Note, that while every 1.1.0 package in tree runs with 3.0.35 sources,
the newer ones (with 3.0.35 in version) require 3.0.35_4.0.0 with patched 
drivers/gpu/drm/vivante/vivante_drv.c (+static char platformdevicename[] = "Vivante GCCore:00";).

This repository is still in DEVELOPMENT. Use at your own convinience.
