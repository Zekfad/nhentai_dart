// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'images.dart';

class ImageMapper extends ClassMapperBase<Image> {
  ImageMapper._();

  static ImageMapper? _instance;
  static ImageMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImageMapper._());
      MapperContainer.globals.useAll([ImageTypeMapper()]);
      ImageThumbnailMapper.ensureInitialized();
      CoverMapper.ensureInitialized();
      CoverThumbnailMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Image';

  static int _$id(Image v) => v.id;
  static const Field<Image, int> _f$id = Field('id', _$id);
  static int _$media(Image v) => v.media;
  static const Field<Image, int> _f$media =
      Field('media', _$media, key: 'media_id');
  static ImageType _$type(Image v) => v.type;
  static const Field<Image, ImageType> _f$type =
      Field('type', _$type, key: 't');
  static int? _$width(Image v) => v.width;
  static const Field<Image, int> _f$width =
      Field('width', _$width, key: 'w', opt: true);
  static int? _$height(Image v) => v.height;
  static const Field<Image, int> _f$height =
      Field('height', _$height, key: 'h', opt: true);

  @override
  final MappableFields<Image> fields = const {
    #id: _f$id,
    #media: _f$media,
    #type: _f$type,
    #width: _f$width,
    #height: _f$height,
  };

  @override
  final MappingHook hook = const EncodeImageHook();
  static Image _instantiate(DecodingData data) {
    return Image(
        id: data.dec(_f$id),
        media: data.dec(_f$media),
        type: data.dec(_f$type),
        width: data.dec(_f$width),
        height: data.dec(_f$height));
  }

  @override
  final Function instantiate = _instantiate;

  static Image fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Image>(map);
  }

  static Image fromJson(String json) {
    return ensureInitialized().decodeJson<Image>(json);
  }
}

mixin ImageMappable {
  String toJson() {
    return ImageMapper.ensureInitialized().encodeJson<Image>(this as Image);
  }

  Map<String, dynamic> toMap() {
    return ImageMapper.ensureInitialized().encodeMap<Image>(this as Image);
  }

  ImageCopyWith<Image, Image, Image> get copyWith =>
      _ImageCopyWithImpl(this as Image, $identity, $identity);
  @override
  String toString() {
    return ImageMapper.ensureInitialized().stringifyValue(this as Image);
  }
}

extension ImageValueCopy<$R, $Out> on ObjectCopyWith<$R, Image, $Out> {
  ImageCopyWith<$R, Image, $Out> get $asImage =>
      $base.as((v, t, t2) => _ImageCopyWithImpl(v, t, t2));
}

abstract class ImageCopyWith<$R, $In extends Image, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? width, int? height});
  ImageCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ImageCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Image, $Out>
    implements ImageCopyWith<$R, Image, $Out> {
  _ImageCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Image> $mapper = ImageMapper.ensureInitialized();
  @override
  $R call({Object? width = $none, Object? height = $none}) =>
      $apply(FieldCopyWithData({
        if (width != $none) #width: width,
        if (height != $none) #height: height
      }));
  @override
  Image $make(CopyWithData data) => Image(
      id: data.get(#id, or: $value.id),
      media: data.get(#media, or: $value.media),
      type: data.get(#type, or: $value.type),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height));

  @override
  ImageCopyWith<$R2, Image, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ImageCopyWithImpl($value, $cast, t);
}

class ImageThumbnailMapper extends ClassMapperBase<ImageThumbnail> {
  ImageThumbnailMapper._();

  static ImageThumbnailMapper? _instance;
  static ImageThumbnailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ImageThumbnailMapper._());
      ImageMapper.ensureInitialized();
      CoverThumbnailMapper.ensureInitialized();
      ImageMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ImageThumbnail';

  static Image _$parent(ImageThumbnail v) => v.parent;
  static const Field<ImageThumbnail, Image> _f$parent =
      Field('parent', _$parent);
  static int? _$width(ImageThumbnail v) => v.width;
  static const Field<ImageThumbnail, int> _f$width =
      Field('width', _$width, key: 'w', opt: true);
  static int? _$height(ImageThumbnail v) => v.height;
  static const Field<ImageThumbnail, int> _f$height =
      Field('height', _$height, key: 'h', opt: true);
  static int _$media(ImageThumbnail v) => v.media;
  static const Field<ImageThumbnail, int> _f$media =
      Field('media', _$media, key: 'media_id');
  static int _$id(ImageThumbnail v) => v.id;
  static const Field<ImageThumbnail, int> _f$id = Field('id', _$id);
  static ImageType _$type(ImageThumbnail v) => v.type;
  static const Field<ImageThumbnail, ImageType> _f$type =
      Field('type', _$type, key: 't');

  @override
  final MappableFields<ImageThumbnail> fields = const {
    #parent: _f$parent,
    #width: _f$width,
    #height: _f$height,
    #media: _f$media,
    #id: _f$id,
    #type: _f$type,
  };

  @override
  final MappingHook hook = const EncodeImageHook();
  @override
  final MappingHook superHook = const EncodeImageHook();

  static ImageThumbnail _instantiate(DecodingData data) {
    return ImageThumbnail(
        parent: data.dec(_f$parent),
        width: data.dec(_f$width),
        height: data.dec(_f$height));
  }

  @override
  final Function instantiate = _instantiate;

  static ImageThumbnail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ImageThumbnail>(map);
  }

  static ImageThumbnail fromJson(String json) {
    return ensureInitialized().decodeJson<ImageThumbnail>(json);
  }
}

mixin ImageThumbnailMappable {
  String toJson() {
    return ImageThumbnailMapper.ensureInitialized()
        .encodeJson<ImageThumbnail>(this as ImageThumbnail);
  }

  Map<String, dynamic> toMap() {
    return ImageThumbnailMapper.ensureInitialized()
        .encodeMap<ImageThumbnail>(this as ImageThumbnail);
  }

  ImageThumbnailCopyWith<ImageThumbnail, ImageThumbnail, ImageThumbnail>
      get copyWith => _ImageThumbnailCopyWithImpl(
          this as ImageThumbnail, $identity, $identity);
  @override
  String toString() {
    return ImageThumbnailMapper.ensureInitialized()
        .stringifyValue(this as ImageThumbnail);
  }
}

extension ImageThumbnailValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ImageThumbnail, $Out> {
  ImageThumbnailCopyWith<$R, ImageThumbnail, $Out> get $asImageThumbnail =>
      $base.as((v, t, t2) => _ImageThumbnailCopyWithImpl(v, t, t2));
}

abstract class ImageThumbnailCopyWith<$R, $In extends ImageThumbnail, $Out>
    implements ImageCopyWith<$R, $In, $Out> {
  ImageCopyWith<$R, Image, Image> get parent;
  @override
  $R call({Image? parent, int? width, int? height});
  ImageThumbnailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ImageThumbnailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ImageThumbnail, $Out>
    implements ImageThumbnailCopyWith<$R, ImageThumbnail, $Out> {
  _ImageThumbnailCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ImageThumbnail> $mapper =
      ImageThumbnailMapper.ensureInitialized();
  @override
  ImageCopyWith<$R, Image, Image> get parent =>
      $value.parent.copyWith.$chain((v) => call(parent: v));
  @override
  $R call({Image? parent, Object? width = $none, Object? height = $none}) =>
      $apply(FieldCopyWithData({
        if (parent != null) #parent: parent,
        if (width != $none) #width: width,
        if (height != $none) #height: height
      }));
  @override
  ImageThumbnail $make(CopyWithData data) => ImageThumbnail(
      parent: data.get(#parent, or: $value.parent),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height));

  @override
  ImageThumbnailCopyWith<$R2, ImageThumbnail, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ImageThumbnailCopyWithImpl($value, $cast, t);
}

class CoverMapper extends ClassMapperBase<Cover> {
  CoverMapper._();

  static CoverMapper? _instance;
  static CoverMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CoverMapper._());
      ImageMapper.ensureInitialized();
      CoverThumbnailMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Cover';

  static int _$media(Cover v) => v.media;
  static const Field<Cover, int> _f$media =
      Field('media', _$media, key: 'media_id');
  static ImageType _$type(Cover v) => v.type;
  static const Field<Cover, ImageType> _f$type =
      Field('type', _$type, key: 't');
  static int? _$width(Cover v) => v.width;
  static const Field<Cover, int> _f$width = Field('width', _$width, key: 'w');
  static int? _$height(Cover v) => v.height;
  static const Field<Cover, int> _f$height =
      Field('height', _$height, key: 'h');
  static int _$id(Cover v) => v.id;
  static const Field<Cover, int> _f$id = Field('id', _$id);

  @override
  final MappableFields<Cover> fields = const {
    #media: _f$media,
    #type: _f$type,
    #width: _f$width,
    #height: _f$height,
    #id: _f$id,
  };

  @override
  final MappingHook hook = const EncodeImageHook();
  @override
  final MappingHook superHook = const EncodeImageHook();

  static Cover _instantiate(DecodingData data) {
    return Cover(
        media: data.dec(_f$media),
        type: data.dec(_f$type),
        width: data.dec(_f$width),
        height: data.dec(_f$height));
  }

  @override
  final Function instantiate = _instantiate;

  static Cover fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Cover>(map);
  }

  static Cover fromJson(String json) {
    return ensureInitialized().decodeJson<Cover>(json);
  }
}

mixin CoverMappable {
  String toJson() {
    return CoverMapper.ensureInitialized().encodeJson<Cover>(this as Cover);
  }

  Map<String, dynamic> toMap() {
    return CoverMapper.ensureInitialized().encodeMap<Cover>(this as Cover);
  }

  CoverCopyWith<Cover, Cover, Cover> get copyWith =>
      _CoverCopyWithImpl(this as Cover, $identity, $identity);
  @override
  String toString() {
    return CoverMapper.ensureInitialized().stringifyValue(this as Cover);
  }
}

extension CoverValueCopy<$R, $Out> on ObjectCopyWith<$R, Cover, $Out> {
  CoverCopyWith<$R, Cover, $Out> get $asCover =>
      $base.as((v, t, t2) => _CoverCopyWithImpl(v, t, t2));
}

abstract class CoverCopyWith<$R, $In extends Cover, $Out>
    implements ImageCopyWith<$R, $In, $Out> {
  @override
  $R call({covariant int? width, covariant int? height});
  CoverCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CoverCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Cover, $Out>
    implements CoverCopyWith<$R, Cover, $Out> {
  _CoverCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Cover> $mapper = CoverMapper.ensureInitialized();
  @override
  $R call({int? width, int? height}) => $apply(FieldCopyWithData(
      {if (width != null) #width: width, if (height != null) #height: height}));
  @override
  Cover $make(CopyWithData data) => Cover(
      media: data.get(#media, or: $value.media),
      type: data.get(#type, or: $value.type),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height));

  @override
  CoverCopyWith<$R2, Cover, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CoverCopyWithImpl($value, $cast, t);
}

class CoverThumbnailMapper extends ClassMapperBase<CoverThumbnail> {
  CoverThumbnailMapper._();

  static CoverThumbnailMapper? _instance;
  static CoverThumbnailMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CoverThumbnailMapper._());
      ImageMapper.ensureInitialized();
      CoverMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'CoverThumbnail';

  static Cover _$parent(CoverThumbnail v) => v.parent;
  static const Field<CoverThumbnail, Cover> _f$parent =
      Field('parent', _$parent);
  static int? _$width(CoverThumbnail v) => v.width;
  static const Field<CoverThumbnail, int> _f$width =
      Field('width', _$width, key: 'w');
  static int? _$height(CoverThumbnail v) => v.height;
  static const Field<CoverThumbnail, int> _f$height =
      Field('height', _$height, key: 'h');
  static int _$media(CoverThumbnail v) => v.media;
  static const Field<CoverThumbnail, int> _f$media =
      Field('media', _$media, key: 'media_id');
  static int _$id(CoverThumbnail v) => v.id;
  static const Field<CoverThumbnail, int> _f$id = Field('id', _$id);
  static ImageType _$type(CoverThumbnail v) => v.type;
  static const Field<CoverThumbnail, ImageType> _f$type =
      Field('type', _$type, key: 't');

  @override
  final MappableFields<CoverThumbnail> fields = const {
    #parent: _f$parent,
    #width: _f$width,
    #height: _f$height,
    #media: _f$media,
    #id: _f$id,
    #type: _f$type,
  };

  @override
  final MappingHook hook = const EncodeImageHook();
  @override
  final MappingHook superHook = const EncodeImageHook();

  static CoverThumbnail _instantiate(DecodingData data) {
    return CoverThumbnail(
        parent: data.dec(_f$parent),
        width: data.dec(_f$width),
        height: data.dec(_f$height));
  }

  @override
  final Function instantiate = _instantiate;

  static CoverThumbnail fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CoverThumbnail>(map);
  }

  static CoverThumbnail fromJson(String json) {
    return ensureInitialized().decodeJson<CoverThumbnail>(json);
  }
}

mixin CoverThumbnailMappable {
  String toJson() {
    return CoverThumbnailMapper.ensureInitialized()
        .encodeJson<CoverThumbnail>(this as CoverThumbnail);
  }

  Map<String, dynamic> toMap() {
    return CoverThumbnailMapper.ensureInitialized()
        .encodeMap<CoverThumbnail>(this as CoverThumbnail);
  }

  CoverThumbnailCopyWith<CoverThumbnail, CoverThumbnail, CoverThumbnail>
      get copyWith => _CoverThumbnailCopyWithImpl(
          this as CoverThumbnail, $identity, $identity);
  @override
  String toString() {
    return CoverThumbnailMapper.ensureInitialized()
        .stringifyValue(this as CoverThumbnail);
  }
}

extension CoverThumbnailValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CoverThumbnail, $Out> {
  CoverThumbnailCopyWith<$R, CoverThumbnail, $Out> get $asCoverThumbnail =>
      $base.as((v, t, t2) => _CoverThumbnailCopyWithImpl(v, t, t2));
}

abstract class CoverThumbnailCopyWith<$R, $In extends CoverThumbnail, $Out>
    implements
        ImageCopyWith<$R, $In, $Out>,
        CoverCopyWith<$R, $In, $Out>,
        ImageThumbnailCopyWith<$R, $In, $Out> {
  CoverCopyWith<$R, Cover, Cover> get parent;
  @override
  $R call(
      {covariant Cover? parent, covariant int? width, covariant int? height});
  CoverThumbnailCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CoverThumbnailCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CoverThumbnail, $Out>
    implements CoverThumbnailCopyWith<$R, CoverThumbnail, $Out> {
  _CoverThumbnailCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CoverThumbnail> $mapper =
      CoverThumbnailMapper.ensureInitialized();
  @override
  CoverCopyWith<$R, Cover, Cover> get parent =>
      $value.parent.copyWith.$chain((v) => call(parent: v));
  @override
  $R call({Cover? parent, int? width, int? height}) =>
      $apply(FieldCopyWithData({
        if (parent != null) #parent: parent,
        if (width != null) #width: width,
        if (height != null) #height: height
      }));
  @override
  CoverThumbnail $make(CopyWithData data) => CoverThumbnail(
      parent: data.get(#parent, or: $value.parent),
      width: data.get(#width, or: $value.width),
      height: data.get(#height, or: $value.height));

  @override
  CoverThumbnailCopyWith<$R2, CoverThumbnail, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CoverThumbnailCopyWithImpl($value, $cast, t);
}
