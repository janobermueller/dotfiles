xrdb $CONFIG/.Xresources

FOREGROUND=$(xrdb -query | grep '*.foreground:' | awk '{print $NF}')
BACKGROUND=$(xrdb -query | grep '*.background:' | awk '{print $NF}')
RED=$(xrdb -query | grep '*.color1:' | awk '{print $NF}')

dmenu() {
	command dmenu \
		-i \
		-fn "Inter:pixelsize=40,icomoon\-feather" \
		-nb "$BACKGROUND" \
		-nf "$FOREGROUND" \
		-sb "$RED" \
		-sf "$FOREGROUND" \
		"$@"
}
