#
# Copyright (C) 2026 The petalOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# petalOS: petal variant of the macanc build. Same device/base as lineage_macanc;
# this is the target where petalOS-specific packages (GmsCompat, etc.) are added
# so the clean Lineage target stays untouched.

# Inherit the Lineage macanc product (device, telephony, Lineage common).
$(call inherit-product, device/oneplus/macanc/lineage_macanc.mk)

# Approved Petal V3 3D boot animation, including native fade on boot completion.
TARGET_BOOTANIMATION := vendor/lineage/bootanimation/petal.zip

# GmsCompat (sandboxed Google Play Services).
PRODUCT_PACKAGES += \
    GmsCompat \
    GmsCompatLib \
    GmsCompatConfig

# petalOS customization hub (no launcher icon, reachable from Settings).
PRODUCT_PACKAGES += \
    PetalHub

# petalOS depth studio (3D lock screen: photo subject layered over the clock).
PRODUCT_PACKAGES += \
    PetalDepth

# petalOS idle power policy (location -> battery-saving + app standby while screen off).
PRODUCT_PACKAGES += \
    PetalPower

PRODUCT_NAME := petal_macanc
