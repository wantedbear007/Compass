const double appBorderRadius = 10;
const String appName = "Compass Supervision";
const String subTitle = "Automate. Verify. Protect.";
// const String apiUrl = "https://capslock-gray.vercel.app";
// const String apiUrlService= "https://onebyte.onrender.com/api";
const String apiUrlService = "";
const String apiUrl = "";

const String api =
    "https://backend-compass.bhanupratap-12212215.workers.dev/v1/";
const String barCodeAPI =
    "https://teamwanted.bhanupratap-12212215.workers.dev/barcode/";
const String apiKey = "1krf3w61D2BeU6CAt5P6";

const String serverErrorSvg = "server.svg";
const String noItemsSvg = "notification.svg";
const String customVectorBackground0 = "background.svg";
const String github = "https://github.com/wantedbear007";

class LibraryInfo {
  final String name;
  final String version;
  final String license;
  final String link;

  LibraryInfo({
    required this.name,
    required this.version,
    required this.license,
    required this.link,
  });
}

List<LibraryInfo> libraries = [
  LibraryInfo(
    name: 'Get',
    version: '4.6.6',
    license: 'MIT License',
    link: 'https://github.com/jonataslaw/getx/blob/master/LICENSE',
  ),
  LibraryInfo(
    name: 'flutter_svg',
    version: '2.0.10+1',
    license: 'MIT License',
    link: "https://github.com/dnfield/flutter_svg/blob/master/LICENSE",
  ),
  LibraryInfo(
    name: 'go_router',
    version: '13.2.4',
    license: 'BSD 3-Clause "New" or "Revised"',
    link:
        'https://github.com/flutter/packages/blob/main/packages/go_router/LICENSE',
  ),
  LibraryInfo(
    name: 'http',
    version: '1.2.1',
    license: 'BSD 3-Clause "New" or "Revised"',
    link: 'https://github.com/dart-lang/http/blob/master/LICENSE',
  ),
  LibraryInfo(
    name: 'cached_network_image',
    version: '3.3.1',
    license: 'MIT License',
    link:
        'https://github.com/Baseflow/flutter_cached_network_image/blob/develop/cached_network_image/LICENSE',
  ),
  LibraryInfo(
    name: 'intl',
    version: '0.19.0',
    license: 'BSD 3-Clause "New" or "Revised"',
    link: 'https://github.com/dart-lang/intl/blob/master/LICENSE',
  ),
  LibraryInfo(
    name: 'numberpicker',
    version: '2.1.2',
    license: 'BSD 3-Clause "New" or "Revised"',
    link: 'https://github.com/MarcinusX/NumberPicker/blob/master/LICENSE',
  ),
  LibraryInfo(
    name: 'shared_preferences',
    version: '2.2.3',
    license: 'BSD 3-Clause "New" or "Revised"',
    link:
        'https://github.com/flutter/plugins/blob/main/packages/shared_preferences/shared_preferences/LICENSE',
  ),
  LibraryInfo(
    name: 'loading_animation_widget',
    version: '1.2.1',
    license: 'BSD 3-Clause "New" or "Revised"',
    link: 'https://github.com/watery-desert/loading_animation_widget/blob/main/LICENSE',
  ),
  LibraryInfo(
    name: 'simple_barcode_scanner',
    version: '0.1.1',
    license: 'MIT License',
    link:
        'https://github.com/CodingWithTashi/simple_barcode_scanner/blob/main/LICENSE',
  ),
];
