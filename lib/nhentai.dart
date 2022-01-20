/// Main library exposing [API] client and corresponding settings:
/// [Hosts] and [HostType] classes.
/// Also exports [nhentai_data_model] library.
library nhentai;

import 'src/API.dart';
export 'data_model.dart';
export 'src/API.dart';

/// [API] alias.
typedef NHentai = API;
/// [Hosts] alias.
typedef NHentaiHosts = Hosts;
/// [HostType] alias.
typedef NHentaiHostType = HostType;
