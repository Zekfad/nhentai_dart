/// Prefixed main library exposing [NHentai] client and corresponding settings:
/// [NHentaiHosts], [NHentaiHost] and [NHentaiHostType] classes.
library nhentai_prefixed;

import 'nhentai.dart';

export 'data_model_prefixed.dart';

/// [API] alias.
typedef NHentai = API;
/// [BeforeRequestCallback] alias.
typedef NHentaiBeforeRequestCallback = BeforeRequestCallback;
/// [Hosts] alias.
typedef NHentaiHosts = Hosts;
/// [HostType] alias.
typedef NHentaiHostType = HostType;
/// [Host] alias.
typedef NHentaiHost = Host;
/// [ApiHost] alias.
typedef NHentaiApiHost = ApiHost;
/// [ImageHost] alias.
typedef NHentaiImageHost = ImageHost;
/// [ThumbnailHost] alias.
typedef NHentaiThumbnailHost = ThumbnailHost;
/// [ApiException] alias.
typedef NHentaiAPIException = ApiException;
/// [ApiClientException] alias.
typedef NHentaiClientException = ApiClientException;
