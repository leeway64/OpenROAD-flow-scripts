# This file is partially based on the config.mk for sky130hd/gcd

export DESIGN_NICKNAME 	= proof_of_concept
export DESIGN_NAME 		= proof_of_concept_top
export PLATFORM 		= sky130hd

export VERILOG_FILES = $(sort $(wildcard $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/*.v))
export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# These options are from this tutorial:
# 	https://openroad-flow-scripts.readthedocs.io/en/latest/user/AddingNewDesign.html
export CORE_UTILIZATION = 40
export PLACE_DENSITY    = 0.60
export TNS_END_PERCENT  = 100
