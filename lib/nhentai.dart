library nhentai;

import 'src/API.dart';
import 'src/DataModel.dart' show APIException;
export 'src/DataModel.dart' hide APIException;

typedef NHentai = API;
typedef NHentaiHosts = Hosts;
typedef NHentaiHostType = HostType;
typedef NHentaiException = APIException;
