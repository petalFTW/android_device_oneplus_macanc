#
# Copyright (C) 2026 The petalOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# petal variant of the macanc build. lineage base + petal extras, keeps lineage_macanc clean.
$(call inherit-product, device/oneplus/macanc/lineage_macanc.mk)

# Approved Petal V3 3D boot animation, native fade included.
TARGET_BOOTANIMATION := vendor/lineage/bootanimation/petal.zip

# GmsCompat (sandboxed Google Play Services).
PRODUCT_PACKAGES += \
    GmsCompat \
    GmsCompatLib \
    GmsCompatConfig

# petalOS customization hub (no launcher icon, reachable from Settings).
PRODUCT_PACKAGES += \
    PetalHub

# petalOS depth studio (3D lock screen photo thing).
PRODUCT_PACKAGES += \
    PetalDepth

# petalOS idle power policy (stops apps messing about while screen is off).
PRODUCT_PACKAGES += \
    PetalPower

# gms hog eats a verify filter on every cold start, compile the bastard at build time
PRODUCT_DEXPREOPT_SPEED_APPS += GmsCompat

# keep more apps warm so relaunches stop being cold
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.device_config.activity_manager.max_cached_processes=48

PRODUCT_NAME := petal_macanc
