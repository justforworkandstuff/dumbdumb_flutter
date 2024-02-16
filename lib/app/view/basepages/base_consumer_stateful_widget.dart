import 'package:dumbdumb_flutter_app/app/assets/importers/importer_general.dart';

abstract class BaseConsumerStatefulWidget extends ConsumerStatefulWidget {
  const BaseConsumerStatefulWidget({super.key});
}

abstract class BaseConsumerStatefulWidgetState<Page extends BaseConsumerStatefulWidget> extends ConsumerState<Page> {
  /// Common devices Settings
  Size size() => MediaQuery.of(context).size;

  double width() => size().width;

  double height() => size().height;

  /// Common attributes
  bool isTopSafeAreaEnabled() => true;

  bool isBottomSafeAreaEnabled() => true;

  /// Common functions
  void onBackPressed() => Navigator.pop(context);

  /// Common widgets
  AppBar? appbar() => null;

  Widget? floatingActionButton() => null;

  BottomNavigationBar? bottomNavigationBar() => null;

  Widget body() => const SizedBox.shrink();

  /// Each Page are meant to be build with a [Scaffold] structure
  /// include with [AppBar], [Body], [FloatingActionButton]
  /// so that all inheriting classes would not needed to handle it repeatedly.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      /// Added this to disallow showing of glow effect when over-scrolled
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overScroll) {
          overScroll.disallowIndicator();
          return true;
        },
        child: Scaffold(
          appBar: appbar(),
          body: SafeArea(top: isTopSafeAreaEnabled(), bottom: isBottomSafeAreaEnabled(), child: body()),
          floatingActionButton: floatingActionButton(),
          resizeToAvoidBottomInset: true,
          bottomNavigationBar: bottomNavigationBar(),
        ),
      ),
    );
  }
}