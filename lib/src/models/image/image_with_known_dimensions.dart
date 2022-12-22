import 'image.dart';


mixin ImageWithKnownDimensions on Image {
  @override
  int get width => super.width!;

  @override
  int get height => super.height!;
}
