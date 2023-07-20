// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element

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

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
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
  final Map<Symbol, Field<Image, dynamic>> fields = const {
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
    return _guard((c) => c.fromMap<Image>(map));
  }

  static Image fromJson(String json) {
    return _guard((c) => c.fromJson<Image>(json));
  }
}

mixin ImageMappable {
  String toJson() {
    return ImageMapper._guard((c) => c.toJson(this as Image));
  }

  Map<String, dynamic> toMap() {
    return ImageMapper._guard((c) => c.toMap(this as Image));
  }

  @override
  String toString() {
    return ImageMapper._guard((c) => c.asString(this));
  }
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

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
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
  static const Field<ImageThumbnail, int> _f$media = Field('media', _$media);
  static int _$id(ImageThumbnail v) => v.id;
  static const Field<ImageThumbnail, int> _f$id = Field('id', _$id);
  static ImageType _$type(ImageThumbnail v) => v.type;
  static const Field<ImageThumbnail, ImageType> _f$type = Field('type', _$type);

  @override
  final Map<Symbol, Field<ImageThumbnail, dynamic>> fields = const {
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
    return _guard((c) => c.fromMap<ImageThumbnail>(map));
  }

  static ImageThumbnail fromJson(String json) {
    return _guard((c) => c.fromJson<ImageThumbnail>(json));
  }
}

mixin ImageThumbnailMappable {
  String toJson() {
    return ImageThumbnailMapper._guard((c) => c.toJson(this as ImageThumbnail));
  }

  Map<String, dynamic> toMap() {
    return ImageThumbnailMapper._guard((c) => c.toMap(this as ImageThumbnail));
  }

  @override
  String toString() {
    return ImageThumbnailMapper._guard((c) => c.asString(this));
  }
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

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
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
  final Map<Symbol, Field<Cover, dynamic>> fields = const {
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
    return _guard((c) => c.fromMap<Cover>(map));
  }

  static Cover fromJson(String json) {
    return _guard((c) => c.fromJson<Cover>(json));
  }
}

mixin CoverMappable {
  String toJson() {
    return CoverMapper._guard((c) => c.toJson(this as Cover));
  }

  Map<String, dynamic> toMap() {
    return CoverMapper._guard((c) => c.toMap(this as Cover));
  }

  @override
  String toString() {
    return CoverMapper._guard((c) => c.asString(this));
  }
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

  static T _guard<T>(T Function(MapperContainer) fn) {
    ensureInitialized();
    return fn(MapperContainer.globals);
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
  static const Field<CoverThumbnail, int> _f$media = Field('media', _$media);
  static int _$id(CoverThumbnail v) => v.id;
  static const Field<CoverThumbnail, int> _f$id = Field('id', _$id);
  static ImageType _$type(CoverThumbnail v) => v.type;
  static const Field<CoverThumbnail, ImageType> _f$type = Field('type', _$type);

  @override
  final Map<Symbol, Field<CoverThumbnail, dynamic>> fields = const {
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
    return _guard((c) => c.fromMap<CoverThumbnail>(map));
  }

  static CoverThumbnail fromJson(String json) {
    return _guard((c) => c.fromJson<CoverThumbnail>(json));
  }
}

mixin CoverThumbnailMappable {
  String toJson() {
    return CoverThumbnailMapper._guard((c) => c.toJson(this as CoverThumbnail));
  }

  Map<String, dynamic> toMap() {
    return CoverThumbnailMapper._guard((c) => c.toMap(this as CoverThumbnail));
  }

  @override
  String toString() {
    return CoverThumbnailMapper._guard((c) => c.asString(this));
  }
}
