part of 'images.dart';


/// Mixin that removes nullability from [width] and [height].
base mixin ImageWithKnownDimensions on Image {
  @override
  int get width => super.width!;

  @override
  int get height => super.height!;
}
