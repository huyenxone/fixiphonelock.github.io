#/bin/sh
# script by huyenxone
# fixiphonelock.github.io
# fix full iphone lock Nhat

cd "/var/mobile/Library/Carrier Bundles/Overlay"
for fl in *.plist; do
	sed '/<key>SupportSupplementaryServices[^<]*<\/key>/,/>/s/false/true/g' "$fl" | tee "$fl"
done

chmod -w "/var/mobile/Library/Carrier Bundles/Overlay"
# tim xoa
rm -rf "/var/mobile/Library/Carrier Bundles/iPhone"
mkdir -p "/var/mobile/Library/Carrier Bundles/iPhone"
chmod -w "/var/mobile/Library/Carrier Bundles/iPhone"
chown mobile "/var/mobile/Library/Carrier Bundles/iPhone"

rm -rf "/System/Library/Carrier Bundles/iPhone/44010"
rm -rf "/System/Library/Carrier Bundles/iPhone/44020"
rm -rf "/System/Library/Carrier Bundles/iPhone/44050"

rm -rf "/System/Library/Carrier Bundles/iPhone/Docomo_jp.bundle/"
mkdir -p "/System/Library/Carrier Bundles/iPhone/Docomo_jp.bundle/"
rm -rf "/System/Library/Carrier Bundles/iPhone/Softbank_jp.bundle/"
mkdir -p "/System/Library/Carrier Bundles/iPhone/Softbank_jp.bundle/"
rm -rf "/System/Library/Carrier Bundles/iPhone/KDDI_jp.bundle/"
mkdir -p "/System/Library/Carrier Bundles/iPhone/KDDI_jp.bundle/"

rm -rf "/System/Library/Carrier Bundles/iPhone/Unknown.bundle/"
cp -R "/System/Library/Carrier Bundles/iPhone/Viettel_vn.bundle/" "/System/Library/Carrier Bundles/iPhone/Unknown.bundle/"

echo "127.0.0.1 appldnld.apple.com" >> /etc/hosts
chmod -w /etc/hosts

rm -rf "/System/Library/Frameworks/MediaToolbox.framework/RegionalSystemSoundsThatShareBehaviour.plist"

echo "DONE"