/// Prefixed main library exposing [NHentai] client and corresponding settings:
/// [NHentaiHosts] and [NHentaiHostType] classes.
library nhentai_prefixed;

import 'nhentai.dart';
export 'data_model_prefixed.dart';

/// [API] alias.
typedef NHentai = API;
/// [Hosts] alias.
typedef NHentaiHosts = Hosts;
/// [HostType] alias.
typedef NHentaiHostType = HostType;
