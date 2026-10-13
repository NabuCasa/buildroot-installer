BUILDROOT := $(CURDIR)/buildroot
BUILDROOT_EXTERNAL := $(CURDIR)/buildroot-external
OUTPUT_DIR := $(CURDIR)/output

export BR2_DL_DIR ?= $(CURDIR)/dl

TARGETS := $(patsubst %_defconfig,%,$(notdir $(wildcard $(BUILDROOT_EXTERNAL)/configs/*_defconfig)))

BR_MAKE = $(MAKE) -C $(BUILDROOT) O=$(OUTPUT_DIR)/$(1) BR2_EXTERNAL=$(BUILDROOT_EXTERNAL)

.DEFAULT_GOAL := help
.PHONY: help $(TARGETS)

help:
	@echo "Usage:"
	@echo "  make <target>           configure and build <target>"
	@echo "  make <target>-<goal>    run buildroot <goal> for <target>,"
	@echo "                          e.g. <target>-menuconfig or <target>-linux-rebuild"
	@echo
	@echo "Targets:"
	@$(foreach t,$(TARGETS),echo "  $(t)";)

$(BUILDROOT)/Makefile:
	git submodule update --init

$(TARGETS): %: $(BUILDROOT)/Makefile
	$(call BR_MAKE,$*) $*_defconfig
	$(call BR_MAKE,$*)

define TARGET_GOAL_RULE
$(1)-%: $$(BUILDROOT)/Makefile
	$$(call BR_MAKE,$(1)) $$*
endef

$(foreach t,$(TARGETS),$(eval $(call TARGET_GOAL_RULE,$(t))))
