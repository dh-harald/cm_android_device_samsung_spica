# Release name
PRODUCT_RELEASE_NAME := Spica

# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-320x480

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/spica/full_spica.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := spica
PRODUCT_NAME := cm_spica
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := Galaxy Spica
PRODUCT_MANUFACTURER := Samsung

#Set build fingerprint / ID / Product Name ect.
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=cm_spica BUILD_FINGERPRINT="Samsung/cm_spica/spica:4.0.2/ICL53F/235179:user/release-keys" PRIVATE_BUILD_DESC="cm_spica-user 4.0.2 ICL53F 235179 release-keys"
