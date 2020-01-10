PREVIEWDIR=preview

$(PREVIEWDIR)/%.jpg $(PREVIEWDIR)/%.JPG $(PREVIEWDIR)/%.jpeg $(PREVIEWDIR)/%.JPEG:
	mkdir -p "$(shell dirname "$@")"
	convert "$(@:$(PREVIEWDIR)/%=%)" \
		-quality 40 -resize "1280x1280>" \
		"$@"

$(PREVIEWDIR)/%.png $(PREVIEWDIR)/%.PNG:
	mkdir -p "$(shell dirname "$@")"
	convert "$(@:$(PREVIEWDIR)/%=%)" \
		-quality 100 -resize "1280x1280>" \
		"png8:$@"

$(PREVIEWDIR)/%.mp4 $(PREVIEWDIR)/%.MP4 $(PREVIEWDIR)/%.avi $(PREVIEWDIR)/%.AVI:
	mkdir -p "$(shell dirname "$@")"
	ffmpeg -hide_banner -loglevel panic \
		-i "$(@:$(PREVIEWDIR)/%=%)" \
		-c:v libx264 -vf scale=w=640:h=640:force_original_aspect_ratio=decrease \
		-preset slow -crf 32 -r 15 \
		-c:a libvorbis -ac 1 -b:a 32k \
		"$@"

$(PREVIEWDIR)/%.mov $(PREVIEWDIR)/%.MOV:
	mkdir -p "$(shell dirname "$@")"
	ffmpeg -hide_banner -loglevel panic \
		-i "$(@:$(PREVIEWDIR)/%=%)" \
		-c:v libx264 -vf scale=w=640:h=640:force_original_aspect_ratio=decrease \
		-preset slow -crf 32 -r 15 \
		"$@"
