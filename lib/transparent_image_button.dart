library transparent_image_button;

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:image/image.dart' as img;

class TransparentImageButton extends StatefulWidget {
  final String imagePath;
  final Function? onTapInside;
  final Function? onTapOutside;

  const TransparentImageButton.assets(this.imagePath,
      {Key? key,
      this.frameBuilder,
      this.semanticLabel,
      this.excludeFromSemantics = false,
      this.scale,
      this.width,
      this.height,
      this.color,
      this.colorBlendMode,
      this.fit,
      this.alignment = Alignment.center,
      this.repeat = ImageRepeat.noRepeat,
      this.centerSlice,
      this.matchTextDirection = false,
      this.gaplessPlayback = false,
      this.package,
      this.filterQuality = FilterQuality.low,
      this.onTapInside,
      this.onTapOutside})
      : super(key: key);

  // TODO: TransparentImageButton.network

  @override
  State<StatefulWidget> createState() => _TransparentImageButton();

  /// Run against a real-world image, the previous example renders the following
  /// image.
  ///
  /// {@animation 400 400 https://flutter.github.io/assets-for-api-docs/assets/widgets/frame_builder_image.mp4}
  final ImageFrameBuilder? frameBuilder;

  /// If non-null, require the image to have this width.
  ///
  /// If null, the image will pick a size that best preserves its intrinsic
  /// aspect ratio.
  ///
  /// It is strongly recommended that either both the [width] and the [height]
  /// be specified, or that the widget be placed in a context that sets tight
  /// layout constraints, so that the image does not change size as it loads.
  /// Consider using [fit] to adapt the image's rendering to fit the given width
  /// and height if the exact image dimensions are not known in advance.
  final double? width;

  /// If non-null, require the image to have this height.
  ///
  /// If null, the image will pick a size that best preserves its intrinsic
  /// aspect ratio.
  ///
  /// It is strongly recommended that either both the [width] and the [height]
  /// be specified, or that the widget be placed in a context that sets tight
  /// layout constraints, so that the image does not change size as it loads.
  /// Consider using [fit] to adapt the image's rendering to fit the given width
  /// and height if the exact image dimensions are not known in advance.
  final double? height;

  /// If non-null, this color is blended with each image pixel using [colorBlendMode].
  final Color? color;

  /// Used to set the [FilterQuality] of the image.
  ///
  /// Use the [FilterQuality.low] quality setting to scale the image with
  /// bilinear interpolation, or the [FilterQuality.none] which corresponds
  /// to nearest-neighbor.
  final FilterQuality filterQuality;

  /// Used to combine [color] with this image.
  ///
  /// The default is [BlendMode.srcIn]. In terms of the blend mode, [color] is
  /// the source and this image is the destination.
  ///
  /// See also:
  ///
  ///  * [BlendMode], which includes an illustration of the effect of each blend mode.
  final BlendMode? colorBlendMode;

  /// How to inscribe the image into the space allocated during layout.
  ///
  /// The default varies based on the other fields. See the discussion at
  /// [paintImage].
  final BoxFit? fit;

  /// How to align the image within its bounds.
  ///
  /// The alignment aligns the given position in the image to the given position
  /// in the layout bounds. For example, an [Alignment] alignment of (-1.0,
  /// -1.0) aligns the image to the top-left corner of its layout bounds, while an
  /// [Alignment] alignment of (1.0, 1.0) aligns the bottom right of the
  /// image with the bottom right corner of its layout bounds. Similarly, an
  /// alignment of (0.0, 1.0) aligns the bottom middle of the image with the
  /// middle of the bottom edge of its layout bounds.
  ///
  /// To display a subpart of an image, consider using a [CustomPainter] and
  /// [Canvas.drawImageRect].
  ///
  /// If the [alignment] is [TextDirection]-dependent (i.e. if it is a
  /// [AlignmentDirectional]), then an ambient [Directionality] widget
  /// must be in scope.
  ///
  /// Defaults to [Alignment.center].
  ///
  /// See also:
  ///
  ///  * [Alignment], a class with convenient constants typically used to
  ///    specify an [AlignmentGeometry].
  ///  * [AlignmentDirectional], like [Alignment] for specifying alignments
  ///    relative to text direction.
  final AlignmentGeometry alignment;

  /// How to paint any portions of the layout bounds not covered by the image.
  final ImageRepeat repeat;

  /// The center slice for a nine-patch image.
  ///
  /// The region of the image inside the center slice will be stretched both
  /// horizontally and vertically to fit the image into its destination. The
  /// region of the image above and below the center slice will be stretched
  /// only horizontally and the region of the image to the left and right of
  /// the center slice will be stretched only vertically.
  final Rect? centerSlice;

  /// Whether to paint the image in the direction of the [TextDirection].
  ///
  /// If this is true, then in [TextDirection.ltr] contexts, the image will be
  /// drawn with its origin in the top left (the "normal" painting direction for
  /// images); and in [TextDirection.rtl] contexts, the image will be drawn with
  /// a scaling factor of -1 in the horizontal direction so that the origin is
  /// in the top right.
  ///
  /// This is occasionally used with images in right-to-left environments, for
  /// images that were designed for left-to-right locales. Be careful, when
  /// using this, to not flip images with integral shadows, text, or other
  /// effects that will look incorrect when flipped.
  ///
  /// If this is true, there must be an ambient [Directionality] widget in
  /// scope.
  final bool matchTextDirection;

  /// Whether to continue showing the old image (true), or briefly show nothing
  /// (false), when the image provider changes.
  final bool gaplessPlayback;

  /// A Semantic description of the image.
  ///
  /// Used to provide a description of the image to TalkBack on Android, and
  /// VoiceOver on iOS.
  final String? semanticLabel;

  /// Whether to exclude this image from semantics.
  ///
  /// Useful for images which do not contribute meaningful information to an
  /// application.
  final bool excludeFromSemantics;

  // Package
  final String? package;

  // Scale
  final double? scale;
}

class _TransparentImageButton extends State<TransparentImageButton> {
  GlobalKey imageKey = GlobalKey();

  img.Image? photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) => searchPixel(details.globalPosition),
      //onPanUpdate: (details) => searchPixel(details.globalPosition),
      child: Image.asset(
        widget.imagePath,
        key: imageKey,
        frameBuilder: widget.frameBuilder,
        semanticLabel: widget.semanticLabel,
        excludeFromSemantics: widget.excludeFromSemantics,
        scale: widget.scale,
        width: widget.width,
        height: widget.height,
        color: widget.color,
        colorBlendMode: widget.colorBlendMode,
        fit: widget.fit,
        alignment: widget.alignment,
        repeat: widget.repeat,
        centerSlice: widget.centerSlice,
        matchTextDirection: widget.matchTextDirection,
        gaplessPlayback: widget.gaplessPlayback,
        package: widget.package,
        filterQuality: widget.filterQuality,
      ),
    );
  }

  void searchPixel(Offset globalPosition) async {
    if (photo == null) {
      await loadImageBundleBytes();
    }
    _calculatePixel(globalPosition);
  }

  void _calculatePixel(Offset globalPosition) {
    RenderBox box = imageKey.currentContext!.findRenderObject() as RenderBox;
    Offset localPosition = box.globalToLocal(globalPosition);

    double px = localPosition.dx;
    double py = localPosition.dy;

    double widgetScale = box.size.width / photo!.width;
    px = (px / widgetScale);
    py = (py / widgetScale);

    int pixel32 = photo!.getPixelSafe(px.toInt(), py.toInt());
    int hex = abgrToArgb(pixel32);

    if (widget.onTapInside != null && Color(hex).opacity != 0.0) widget.onTapInside!();

    if (widget.onTapOutside != null && Color(hex).opacity == 0.0) widget.onTapOutside!();
  }

  Future<void> loadImageBundleBytes() async {
    ByteData imageBytes = await rootBundle.load(widget.imagePath);
    setImageBytes(imageBytes);
  }

  void setImageBytes(ByteData imageBytes) {
    List<int> values = imageBytes.buffer.asUint8List();
    photo = null;
    photo = img.decodeImage(values)!;
  }
}

// image lib uses uses KML color format, convert #AABBGGRR to regular #AARRGGBB
int abgrToArgb(int argbColor) {
  int r = (argbColor >> 16) & 0xFF;
  int b = argbColor & 0xFF;
  return (argbColor & 0xFF00FF00) | (b << 16) | r;
}
