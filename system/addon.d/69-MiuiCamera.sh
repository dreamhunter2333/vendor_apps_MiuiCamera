#!/sbin/sh
#
# /system/addon.d/69-MiuiCamera.sh
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
etc/age_gender_bg
etc/crown_156_128.bin
etc/device_features/sagit.xml
etc/dualcamera.png
etc/face_goodly_208_180
etc/face_ravishing_238_224
etc/face_splendid_274_200
etc/female_bg.png
etc/female_icon.png
etc/male_bg.png
etc/male_icon.png
etc/MIUI_Time.ttf
etc/people_gender.dat
etc/score_bg.png
etc/score_icon.png
etc/watermark_font_2300_3199.dat
priv-app/MiuiCamera/lib/arm64/libmorpho_panorama_gp.so
priv-app/MiuiCamera/lib/arm64/libmorpho_panorama.so
priv-app/MiuiCamera/lib/arm64/libmorpho_group_portrait.so
priv-app/MiuiCamera/lib/arm64/libmorpho_groupshot.so
priv-app/MiuiCamera/lib/arm64/libmorpho_memory_allocator.so
priv-app/MiuiCamera/lib/arm64/libCameraEffectJNI.so
priv-app/MiuiCamera/MiuiCamera.apk
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
