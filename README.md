# image-previews

Render image (jpg, png) and video (mp4, avi, mov) previews using ImageMagick and FFmpeg.

## How to use

Place the `Makefile` and `render_previews.sh` inside a directory containing images and videos. Running `render_previews.sh` will create (or overwrite) the `preview` subdirectory, basically mirroring the base directory's file paths and creating previews of your images and videos. Running `render_previews.sh` again will update the `preview` directory, removing files, that aren't in the base directory, removing empty directories and generating previews of files that do not yet have a preview. Note that only file paths are compared and therefore exiting previews aren't updated if the original file changes.

## Preview quality settings

Per default the following settings are used.

| extensions | max. res. | quality
| ----------:|-----------|--------
|  jpg, jpeg | 1280x1280 | 40%
|        png | 1280x1280 | max. 256 colours
|   mp4, avi | 640x640   | x264 (crf=32, 15 fps), vorbis (32 kbit/s, mono)
|        mov | 640x640   | x264 (crf=32, 15 fps), copy audio

There are no real quality settings, but you can always tweak the `Makefile` the way you like your previews to be rendered. Note that you'll have to delete the `preview` directory in order vor all previews to be generated anew.

## Change `preview` directory

Change the `PREVIEWDIR` env in the `Makefile` and `render_previews.sh` files.

## Results

The previews of my library (mostly photos) in total take about 3% of the size of the original library.
