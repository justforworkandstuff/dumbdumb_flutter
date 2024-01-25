import 'package:dumbdumb_flutter_app/app/model/error_model.dart';
import 'package:dumbdumb_flutter_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'basepages/base_stateful_page.dart';

class LoginPage extends BaseStatefulPage {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

/// Inherited from [BaseStatefulState], common widgets can be overridden for further customisation
/// see also: [body], [floatingActionButton], [appbar]
/// observable value [urgentError] needed to be obtained from ViewModel and set into [BaseStatefulState]
class _LoginPageState extends BaseStatefulState<LoginPage> {
  /// observable value [urgentError] to be obtained from ViewModel class using [context.watch()]
  late ErrorModel urgentErrorObservable;

  /// we use context.watch() here in [body] because:
  /// both [urgentErrorObservable] and [myResponse] is required listen for changes
  /// widgets rebuild is required in order to populate the result
  /// more info about [Provider]: https://pub.dev/packages/provider
  @override
  Widget body() {
    return Center(child: Text('Test'));
  }

  @override
  Widget floatingActionButton() {
    /// We does not requires Flutter for future rebuilds
    /// We should use context.read().
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.login),
    );
  }

  @override
  AppBar appbar() {
    return AppBar(title: Text(S.current.loginTitle));
  }

  /// An abstract method that is compulsory to override to
  /// ensure [urgentError] observable value is set.
  ///
  /// Side note:
  /// We not using context.watch() here to return [urgentError] from ViewModel
  /// because system throwing error
  /// "Tried to listen to a value exposed with provider, from outside of the widget tree."
  /// Earlier assumption is due to [PostFrameCallback] is in different widget tree
  /// as compared to build() function.
  /// TODO Still looking for more info about [PostFrameCallback] and [WidgetTree]
  @override
  ErrorModel urgentError() => urgentErrorObservable;
}
