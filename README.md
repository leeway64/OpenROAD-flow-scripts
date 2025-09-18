# OpenROAD Flow

This is a fork of OpenROAD-flow-scripts that includes my implementation of two-phase clocking.

OpenROAD-flow-scripts (ORFS) is a fully autonomous, RTL-GDSII flow
for rapid architecture and design space exploration, early prediction
of QoR and detailed physical design implementation. However, ORFS
also enables manual intervention for finer user control of individual
flow stages through Tcl commands and Python APIs.

## Running ORFS with two-phase clocking with latches

```
make DESIGN_CONFIG=./designs/sky130hd/gcd/config.mk .DEFAULT_GOAL=synth MODE=two_phase_clk | tee orfs.log
```

## Running static timing analysis

Inside `openroad`, run the following:

```
source platforms/sky130hd/specify_files_for_sdc.tcl
```

# The following sections refer to the the original OpenROAD repo

## Citing this Work

If you use this software in any published work, we would appreciate a citation!
Please use the following references:

@article{ajayi2019openroad,
title={OpenROAD: Toward a Self-Driving, Open-Source Digital Layout Implementation Tool Chain},
author={Ajayi, T and Blaauw, D and Chan, TB and Cheng, CK and Chhabria, VA and Choo, DK and Coltella, M and Dobre, S and Dreslinski, R and Foga{\c{c}}a, M and others},
journal={Proc. GOMACTECH},
pages={1105--1110},
year={2019}
}

```

A copy of this paper is available
[here](http://people.ece.umn.edu/users/sachin/conf/gomactech19.pdf) (PDF).

```

@inproceedings{ajayi2019toward,
title={Toward an open-source digital flow: First learnings from the openroad project},
author={Ajayi, Tutu and Chhabria, Vidya A and Foga{\c{c}}a, Mateus and Hashemi, Soheil and Hosny, Abdelrahman and Kahng, Andrew B and Kim, Minsoo and Lee, Jeongsup and Mallappa, Uday and Neseem, Marina and others},
booktitle={Proceedings of the 56th Annual Design Automation Conference 2019},
pages={1--4},
year={2019}
}

```

A copy of this paper is available
[here](https://vlsicad.ucsd.edu/Publications/Conferences/371/c371.pdf) (PDF).

If you like the tools, please give us a star on our GitHub repos!

## License

The OpenROAD-flow-scripts repository (build and run scripts) has a BSD 3-Clause License.
The flow relies on several tools, platforms and designs that each have their own licenses:

- Find the tool license at: `OpenROAD-flow-scripts/tools/{tool}/` or `OpenROAD-flow-scripts/tools/OpenROAD/src/{tool}/`.
- Find the platform license at: `OpenROAD-flow-scripts/flow/platforms/{platform}/`.
- Find the design license at: `OpenROAD-flow-scripts/flow/designs/src/{design}/`.
```
