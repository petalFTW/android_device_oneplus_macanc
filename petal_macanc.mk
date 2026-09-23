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

# petalOS advanced features / hosts-based content blocker (no launcher icon).
PRODUCT_PACKAGES += \
    PetalAdvanced \
    petal-blocklist.sh

# petalOS depth studio (3D lock screen photo thing).
PRODUCT_PACKAGES += \
    PetalDepth

# petalOS flagship camera (overrides Aperture/Camera2).
PRODUCT_PACKAGES += \
    PetalCam

# petalOS idle power policy (stops apps messing about while screen is off).
PRODUCT_PACKAGES += \
    PetalPower

# petalOS automation (trigger -> action rules, off until you flip the switch).
PRODUCT_PACKAGES += \
    PetalAutomation

# petalOS music app ("Music"): local playback + Tidal/Spotify/YT Music/Deezer
# unofficial clients and BridgeFX AutoMix. Replaces the Lineage Twelve player.
PRODUCT_PACKAGES += \
    PetalMusic
PRODUCT_DEXPREOPT_SPEED_APPS += PetalMusic

# gms hog eats a verify filter on every cold start, compile the bastard at build time
PRODUCT_DEXPREOPT_SPEED_APPS += GmsCompat

# keep more apps warm so relaunches stop being cold
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.device_config.activity_manager.max_cached_processes=48

# petalOS privacy camera (PetalAgeVer) + the AOSP virtual camera provider it
# drives. The provider publishes the avatar as a front camera on the default
# device. Must be set after the inherit above so it wins over handheld_system.mk.
PRODUCT_PACKAGES += \
    PetalAgeVer \
    virtual_camera
$(call soong_config_set,vdm,virtual_camera_service_enabled,true)
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += vendor/petal/sepolicy

PRODUCT_NAME := petal_macanc
