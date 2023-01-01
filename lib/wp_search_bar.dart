library wp_search_bar;

import 'dart:async';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WPSearchBar extends StatefulWidget {
  const WPSearchBar(
      {Key? key,
      required this.listOfFilters,
      this.materialDesign,
      this.onSearch,
      this.onChangeFilter,
      this.body,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.floatingActionButtonAnimator,
      this.persistentFooterButtons,
      this.drawer,
      this.onDrawerChanged,
      this.endDrawer,
      this.onEndDrawerChanged,
      this.bottomNavigationBar,
      this.bottomSheet,
      this.backgroundColor,
      this.resizeToAvoidBottomInset,
      this.primary = true,
      this.drawerDragStartBehavior = DragStartBehavior.start,
      this.extendBody = false,
      this.extendBodyBehindAppBar = false,
      this.drawerScrimColor,
      this.drawerEdgeDragWidth,
      this.drawerEnableOpenDragGesture = true,
      this.endDrawerEnableOpenDragGesture = true,
      this.restorationId,
      this.leading,
      this.iconTheme,
      this.actions,
      this.appBarBackgroundColor,
      this.appBarForegroundColor,
      this.appBarShape,
      this.isLoading = false})
      : super(key: key);

  /// {@end-tool}
  final List<Widget>? actions;

  ///  * [actionsIconTheme], which defines the appearance of icons in
  ///    in the [actions] list.
  final IconThemeData? iconTheme;

  /// Contains the material design of all elements in AppBar
  final Map<String, Map<String, Object>>? materialDesign;

  /// Contains the definition and settings of all filters
  final Map<String, Map<String, Object>> listOfFilters;

  /// Have two parameters filterSelected and value that typed by user
  final Function(String? filterSelected, String? value, String? operation)?
      onSearch;

  ///Optional callback is called when a filter is selected or closed
  ///`Selected` true when selected and
  ///false when closed `FonSearchilterObject` is the filter data given and
  final Function(
          String filterName, bool selected, Map<String, dynamic> filterObject)?
      onChangeFilter;

  /// If true, and [bottomNavigationBar] or [persistentFooterButtons]
  /// is specified, then the [body] extends to the bottom of the Scaffold,
  /// instead of only extending to the top of the [bottomNavigationBar]
  /// or the [persistentFooterButtons].
  ///
  /// If true, a [MediaQuery] widget whose bottom padding matches the height
  /// of the [bottomNavigationBar] will be added above the scaffold's [body].
  ///
  /// This property is often useful when the [bottomNavigationBar] has
  /// a non-rectangular shape, like [CircularNotchedRectangle], which
  /// adds a [FloatingActionButton] sized notch to the top edge of the bar.
  /// In this case specifying `extendBody: true` ensures that scaffold's
  /// body will be visible through the bottom navigation bar's notch.
  ///
  /// See also:
  ///
  ///  * [extendBodyBehindAppBar], which extends the height of the body
  ///    to the top of the scaffold.
  final bool extendBody;

  /// If true, and an [appBar] is specified, then the height of the [body] is
  /// extended to include the height of the app bar and the top of the body
  /// is aligned with the top of the app bar.
  ///
  /// This is useful if the app bar's [AppBar.backgroundColor] is not
  /// completely opaque.
  ///
  /// This property is false by default. It must not be null.
  ///
  /// See also:
  ///
  ///  * [extendBody], which extends the height of the body to the bottom
  ///    of the scaffold.
  final bool extendBodyBehindAppBar;

  /// The primary content of the scaffold.
  ///
  /// Displayed below the [appBar], above the bottom of the ambient
  /// [MediaQuery]'s [MediaQueryData.viewInsets], and behind the
  /// [floatingActionButton] and [drawer]. If [resizeToAvoidBottomInset] is
  /// false then the body is not resized when the onscreen keyboard appears,
  /// i.e. it is not inset by `viewInsets.bottom`.
  ///
  /// The widget in the body of the scaffold is positioned at the top-left of
  /// the available space between the app bar and the bottom of the scaffold. To
  /// center this widget instead, consider putting it in a [Center] widget and
  /// having that be the body. To expand this widget instead, consider
  /// putting it in a [SizedBox.expand].
  ///
  /// If you have a column of widgets that should normally fit on the screen,
  /// but may overflow and would in such cases need to scroll, consider using a
  /// [ListView] as the body of the scaffold. This is also a good choice for
  /// the case where your body is a scrollable list.
  final Widget? body;

  /// A button displayed floating above [body], in the bottom right corner.
  ///
  /// Typically a [FloatingActionButton].
  final Widget? floatingActionButton;

  /// Responsible for determining where the [floatingActionButton] should go.
  ///
  /// If null, the [ScaffoldState] will use the default location, [FloatingActionButtonLocation.endFloat].
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  /// Animator to move the [floatingActionButton] to a new [floatingActionButtonLocation].
  ///
  /// If null, the [ScaffoldState] will use the default animator, [FloatingActionButtonAnimator.scaling].
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;

  /// A set of buttons that are displayed at the bottom of the scaffold.
  ///
  /// Typically this is a list of [TextButton] widgets. These buttons are
  /// persistently visible, even if the [body] of the scaffold scrolls.
  ///
  /// These widgets will be wrapped in an [OverflowBar].
  ///
  /// The [persistentFooterButtons] are rendered above the
  /// [bottomNavigationBar] but below the [body].
  final List<Widget>? persistentFooterButtons;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from either left-to-right ([TextDirection.ltr]) or
  /// right-to-left ([TextDirection.rtl])
  ///
  /// Typically a [Drawer].
  ///
  /// To open the drawer, use the [ScaffoldState.openDrawer] function.
  ///
  /// To close the drawer, use [Navigator.pop].
  ///
  /// {@tool dartpad}
  /// To disable the drawer edge swipe, set the
  /// [Scaffold.drawerEnableOpenDragGesture] to false. Then, use
  /// [ScaffoldState.openDrawer] to open the drawer and [Navigator.pop] to close
  /// it.
  ///
  /// ** See code in examples/api/lib/material/scaffold/scaffold.drawer.0.dart **
  /// {@end-tool}
  final Widget? drawer;

  /// Optional callback that is called when the [Scaffold.drawer] is opened or closed.
  final DrawerCallback? onDrawerChanged;

  /// A panel displayed to the side of the [body], often hidden on mobile
  /// devices. Swipes in from right-to-left ([TextDirection.ltr]) or
  /// left-to-right ([TextDirection.rtl])
  ///
  /// Typically a [Drawer].
  ///
  /// To open the drawer, use the [ScaffoldState.openEndDrawer] function.
  ///
  /// To close the drawer, use [Navigator.pop].
  ///
  /// {@tool dartpad}
  /// To disable the drawer edge swipe, set the
  /// [Scaffold.endDrawerEnableOpenDragGesture] to false. Then, use
  /// [ScaffoldState.openEndDrawer] to open the drawer and [Navigator.pop] to
  /// close it.
  ///
  /// ** See code in examples/api/lib/material/scaffold/scaffold.end_drawer.0.dart **
  /// {@end-tool}
  final Widget? endDrawer;

  /// Optional callback that is called when the [Scaffold.endDrawer] is opened or closed.
  final DrawerCallback? onEndDrawerChanged;

  /// The color to use for the scrim that obscures primary content while a drawer is open.
  ///
  /// If this is null, then [DrawerThemeData.scrimColor] is used. If that
  /// is also null, then it defaults to [Colors.black54].
  final Color? drawerScrimColor;

  /// The color of the [Material] widget that underlies the entire Scaffold.
  ///
  /// The theme's [ThemeData.scaffoldBackgroundColor] by default.
  final Color? backgroundColor;

  /// A bottom navigation bar to display at the bottom of the scaffold.
  ///
  /// Snack bars slide from underneath the bottom navigation bar while bottom
  /// sheets are stacked on top.
  ///
  /// The [bottomNavigationBar] is rendered below the [persistentFooterButtons]
  /// and the [body].
  final Widget? bottomNavigationBar;

  /// The persistent bottom sheet to display.
  ///
  /// A persistent bottom sheet shows information that supplements the primary
  /// content of the app. A persistent bottom sheet remains visible even when
  /// the user interacts with other parts of the app.
  ///
  /// A closely related widget is a modal bottom sheet, which is an alternative
  /// to a menu or a dialog and prevents the user from interacting with the rest
  /// of the app. Modal bottom sheets can be created and displayed with the
  /// [showModalBottomSheet] function.
  ///
  /// Unlike the persistent bottom sheet displayed by [showBottomSheet]
  /// this bottom sheet is not a [LocalHistoryEntry] and cannot be dismissed
  /// with the scaffold appbar's back button.
  ///
  /// If a persistent bottom sheet created with [showBottomSheet] is already
  /// visible, it must be closed before building the Scaffold with a new
  /// [bottomSheet].
  ///
  /// The value of [bottomSheet] can be any widget at all. It's unlikely to
  /// actually be a [BottomSheet], which is used by the implementations of
  /// [showBottomSheet] and [showModalBottomSheet]. Typically it's a widget
  /// that includes [Material].
  ///
  /// See also:
  ///
  ///  * [showBottomSheet], which displays a bottom sheet as a route that can
  ///    be dismissed with the scaffold's back button.
  ///  * [showModalBottomSheet], which displays a modal bottom sheet.
  final Widget? bottomSheet;

  /// If true the [body] and the scaffold's floating widgets should size
  /// themselves to avoid the onscreen keyboard whose height is defined by the
  /// ambient [MediaQuery]'s [MediaQueryData.viewInsets] `bottom` property.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// scaffold, the body can be resized to avoid overlapping the keyboard, which
  /// prevents widgets inside the body from being obscured by the keyboard.
  ///
  /// Defaults to true.
  final bool? resizeToAvoidBottomInset;

  /// Whether this scaffold is being displayed at the top of the screen.
  ///
  /// If true then the height of the [appBar] will be extended by the height
  /// of the screen's status bar, i.e. the top padding for [MediaQuery].
  ///
  /// The default value of this property, like the default value of
  /// [AppBar.primary], is true.
  final bool primary;

  /// {@macro flutter.material.DrawerController.dragStartBehavior}
  final DragStartBehavior drawerDragStartBehavior;

  /// The width of the area within which a horizontal swipe will open the
  /// drawer.
  ///
  /// By default, the value used is 20.0 added to the padding edge of
  /// `MediaQuery.of(context).padding` that corresponds to the surrounding
  /// [TextDirection]. This ensures that the drag area for notched devices is
  /// not obscured. For example, if `TextDirection.of(context)` is set to
  /// [TextDirection.ltr], 20.0 will be added to
  /// `MediaQuery.of(context).padding.left`.
  final double? drawerEdgeDragWidth;

  /// Determines if the [Scaffold.drawer] can be opened with a drag
  /// gesture.
  ///
  /// By default, the drag gesture is enabled.
  final bool drawerEnableOpenDragGesture;

  /// Determines if the [Scaffold.endDrawer] can be opened with a
  /// drag gesture.
  ///
  /// By default, the drag gesture is enabled.
  final bool endDrawerEnableOpenDragGesture;

  /// Restoration ID to save and restore the state of the [Scaffold].
  ///
  /// If it is non-null, the scaffold will persist and restore whether the
  /// [drawer] and [endDrawer] was open or closed.
  ///
  /// The state of this widget is persisted in a [RestorationBucket] claimed
  /// from the surrounding [RestorationScope] using the provided restoration ID.
  ///
  /// See also:
  ///
  ///  * [RestorationManager], which explains how state restoration works in
  ///    Flutter.
  final String? restorationId;

  /// The [Builder] is used in this example to ensure that the `context` refers
  /// to that part of the subtree. That way this code snippet can be used even
  /// inside the very code that is creating the [Scaffold] (in which case,
  /// without the [Builder], the `context` wouldn't be able to see the
  /// [Scaffold], since it would refer to an ancestor of that widget).
  ///
  /// See also:
  ///
  ///  * [Scaffold.appBar], in which an [AppBar] is usually placed.
  ///  * [Scaffold.drawer], in which the [Drawer] is usually placed.
  final Widget? leading;

  /// {@template flutter.material.appbar.shape}
  /// The shape of the app bar's [Material] as well as its shadow.
  ///
  /// If this property is null, then [AppBarTheme.shape] of
  /// [ThemeData.appBarTheme] is used.  Both properties default to null.
  /// If both properties are null then the shape of the app bar's [Material]
  /// is just a simple rectangle.
  ///
  /// A shadow is only displayed if the [elevation] is greater than
  /// zero.
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [elevation], which defines the size of the shadow below the app bar.
  ///  * [shadowColor], which is the color of the shadow below the app bar.
  final ShapeBorder? appBarShape;

  /// {@template flutter.material.appbar.backgroundColor}
  /// The fill color to use for an app bar's [Material].
  ///
  /// If null, then the [AppBarTheme.backgroundColor] is used. If that value is also
  /// null, then [AppBar] uses the overall theme's [ColorScheme.primary] if the
  /// overall theme's brightness is [Brightness.light], and [ColorScheme.surface]
  /// if the overall theme's [brightness] is [Brightness.dark].
  ///
  /// If this color is a [MaterialStateColor] it will be resolved against
  /// [MaterialState.scrolledUnder] when the content of the app's
  /// primary scrollable overlaps the app bar.
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [foregroundColor], which specifies the color for icons and text within
  ///    the app bar.
  ///  * [Theme.of], which returns the current overall Material theme as
  ///    a [ThemeData].
  ///  * [ThemeData.colorScheme], the thirteen colors that most Material widget
  ///    default colors are based on.
  ///  * [ColorScheme.brightness], which indicates if the overall [Theme]
  ///    is light or dark.
  final Color? appBarBackgroundColor;

  /// {@template flutter.material.appbar.foregroundColor}
  /// The default color for [Text] and [Icon]s within the app bar.
  ///
  /// If null, then [AppBarTheme.foregroundColor] is used. If that
  /// value is also null, then [AppBar] uses the overall theme's
  /// [ColorScheme.onPrimary] if the overall theme's brightness is
  /// [Brightness.light], and [ColorScheme.onSurface] if the overall
  /// theme's [brightness] is [Brightness.dark].
  ///
  /// This color is used to configure [DefaultTextStyle] that contains
  /// the toolbar's children, and the default [IconTheme] widgets that
  /// are created if [iconTheme] and [actionsIconTheme] are null.
  /// {@endtemplate}
  ///
  /// See also:
  ///
  ///  * [backgroundColor], which specifies the app bar's background color.
  ///  * [Theme.of], which returns the current overall Material theme as
  ///    a [ThemeData].
  ///  * [ThemeData.colorScheme], the thirteen colors that most Material widget
  ///    default colors are based on.
  ///  * [ColorScheme.brightness], which indicates if the overall [Theme]
  ///    is light or dark.
  final Color? appBarForegroundColor;

  /// used to show indicator progress for server request
  final bool isLoading;

  @override
  _WPSearchBarState createState() => _WPSearchBarState();
}

class _WPSearchBarState extends State<WPSearchBar>
    with SingleTickerProviderStateMixin {
  bool isSearching = false;
  String? selectedFilter;
  bool firstTryBackSpaceKey = false;

  late Animation<Offset> offset;
  AnimationController? controller;
  final fieldText = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 100);

  @override
  void initState() {
    super.initState();
    // var width = MediaQuery.of(context).size.width;
    // controller = AnimationController(
    //     duration: const Duration(milliseconds: 1500), vsync: this);
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));

    offset =
        Tween<Offset>(begin: const Offset(1, 0.0), end: const Offset(0.0, 0.0))
            .animate(controller!);
  }

  void onPressedButton(filterName) {
    widget.onChangeFilter!(filterName, true, widget.listOfFilters[filterName]!);
    widget.onSearch!(filterName, null, null);
    setState(() {
      selectedFilter = filterName;
    });
  }

  onClearSearch(filterName) {
    log('----onClearSearch--${filterName}');
    if (filterName != null) {
      widget.onChangeFilter!(
          filterName, false, widget.listOfFilters[filterName]!);
    }
    widget.onSearch!(null, null, null);
    setState(() {
      fieldText.clear();
      firstTryBackSpaceKey = false;
      selectedFilter = null;
    });
  }

  ButtonFilter buildButton(Map<String, dynamic>? buttonData, buttonsColor,
      {selected = false}) {
    var name = buttonData != null ? buttonData['name'].toString() : '';
    var title = buttonData != null ? buttonData['title'].toString() : '';

    var icon = null;
    if (buttonData != null) {
      if (buttonData['icon'] is! Widget) {
        icon = Icon(buttonData['icon']);
      } else {
        icon = buttonData['icon'];
      }
    }

    return ButtonFilter(
      name: name,
      onPressed: () {
        onPressedButton(name);
      },
      selected: selected,
      title: title,
      icon: icon,
      buttonsColor: buttonsColor,
      mark: firstTryBackSpaceKey,
    );
  }

  @override
  Widget build(BuildContext context) {
    var listOfFilters = widget.listOfFilters;

    var materialDesign = {
      'title': {'text': 'WhatsApp'},
      'buttonsColor': {
        'selected': {
          'textColor': Colors.white,
          'backgroundColor': const Color(0xff00a982)
        },
        'unselected': {
          'textColor': Colors.white,
          'backgroundColor': Color.fromARGB(255, 47, 64, 75)
        }
      },
      'textField': {
        'cursorColor': Colors.white,
        'style': const TextStyle(color: Colors.white),
        'decoration': const InputDecoration(
            hintText: "Search...",
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            )),
      },
    };

    // log('${materialDesign}');

    materialDesign.removeWhere((key, value) {
      bool exist = false;
      widget.materialDesign?.forEach((keyP, valueP) {
        if (keyP.contains(key)) {
          exist = true;
        }
      });
      return exist;
    });

    materialDesign
        .addAll(widget.materialDesign as Map<String, Map<String, Object>>);

    final buttonsColor = materialDesign['buttonsColor'];

    List<Widget> listWidgetsOfFilters = [];
    listOfFilters.forEach((key, value) {
      listWidgetsOfFilters.add(buildButton(value, buttonsColor));
    });

    var height = kToolbarHeight;
    if (isSearching) {
      height = (selectedFilter != null) ? 80 : 115;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: widget.appBarBackgroundColor,
          foregroundColor: widget.appBarForegroundColor,
          shape: widget.appBarShape,
          automaticallyImplyLeading: !isSearching ? true : false,
          toolbarHeight: height,
          leading: !isSearching ? widget.leading : null,
          title: !isSearching
              ? Text(materialDesign['title']!['text'] as String)
              : SlideTransition(
                  position: offset,
                  child: Column(
                    children: [
                      Row(
                        textDirection: TextDirection.ltr,
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () {
                              controller?.reverse().whenComplete(() {
                                setState(() {
                                  fieldText.clear();
                                  isSearching = false;
                                  selectedFilter = null;
                                });
                                widget.onSearch!(
                                  selectedFilter,
                                  '',
                                  '=',
                                );
                              });
                            },
                          ),
                          if (selectedFilter != null)
                            buildButton(
                                listOfFilters[selectedFilter], buttonsColor,
                                selected: true),
                          Expanded(
                              child:
                                  //,
                                  RawKeyboardListener(
                                      focusNode: FocusNode(), // or FocusNode()
                                      onKey: (event) {
                                        if (event.logicalKey ==
                                            LogicalKeyboardKey.backspace) {
                                          if (selectedFilter != null &&
                                              fieldText.value.text == '') {
                                            if (!firstTryBackSpaceKey) {
                                              setState(() {
                                                firstTryBackSpaceKey = true;
                                              });
                                            } else {
                                              onClearSearch(selectedFilter);
                                            }
                                          }
                                        } else {
                                          firstTryBackSpaceKey = false;
                                        }
                                      },
                                      child: TextField(
                                        cursorColor: materialDesign[
                                                'textField']!['cursorColor']
                                            as Color,
                                        autofocus: true,
                                        controller: fieldText,
                                        onChanged: (value) {
                                          String operation = '';
                                          log('${value}, ${fieldText.text}');
                                          if (selectedFilter != null) {
                                            operation =
                                                listOfFilters[selectedFilter]![
                                                    'operation'] as String;
                                          }
                                          _debouncer.run(() {
                                            widget.onSearch!(selectedFilter,
                                                value, operation);
                                          });
                                        },
                                        style: materialDesign['textField']![
                                            'style'] as TextStyle,
                                        decoration: materialDesign[
                                                'textField']!['decoration']
                                            as InputDecoration,
                                      ))),
                          (widget.isLoading)
                              ? Transform.scale(
                                  scale: 0.5,
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 3,
                                  ),
                                )
                              : IconButton(
                                  icon: const Icon(Icons.cancel),
                                  onPressed: () {
                                    onClearSearch(selectedFilter);
                                    widget.onSearch!(
                                      selectedFilter,
                                      '',
                                      '=',
                                    );
                                  },
                                )
                        ],
                      ),
                      if (selectedFilter == null)
                        SingleChildScrollView(
                            //changing scroll direction into horizontal
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: listWidgetsOfFilters,
                            ))
                    ],
                  ),
                ),
          actions: <Widget>[
            if (!isSearching)
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    isSearching = true;
                    controller?.forward();
                  });
                },
              ),
            if (!isSearching) ...?(widget.actions)
          ],
        ),
        body: widget.body,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
        persistentFooterButtons: widget.persistentFooterButtons,
        drawer: widget.drawer,
        onDrawerChanged: widget.onDrawerChanged,
        endDrawer: widget.endDrawer,
        onEndDrawerChanged: widget.onEndDrawerChanged,
        bottomNavigationBar: widget.bottomNavigationBar,
        bottomSheet: widget.bottomSheet,
        backgroundColor: widget.backgroundColor,
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        primary: widget.primary,
        drawerDragStartBehavior: widget.drawerDragStartBehavior,
        extendBody: widget.extendBody,
        extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
        drawerScrimColor: widget.drawerScrimColor,
        drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
        endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
        restorationId: widget.restorationId);
  }
}

class Debouncer {
  final int milliseconds;
  late VoidCallback action;
  var _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    // log('----- ${_timer.isActive}');
    if (_timer != null && _timer.isActive) {
      _timer.cancel();
    }

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class ButtonFilter extends StatefulWidget {
  final VoidCallback onPressed;
  final String name;
  final String title;
  final Widget? icon;
  final bool selected;
  final buttonsColor;
  final bool mark;

  const ButtonFilter(
      {Key? key,
      required this.onPressed,
      required this.name,
      required this.title,
      required this.icon,
      required this.selected,
      this.buttonsColor,
      this.mark = false})
      : super(key: key);

  @override
  _ButtonFilterState createState() => _ButtonFilterState();
}

class _ButtonFilterState extends State<ButtonFilter> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          children: [
            TextButton(
              style: TextButton.styleFrom(
                primary: widget.selected
                    ? widget.buttonsColor['selected']!['textColor']
                    : widget.buttonsColor['unselected']!['textColor'],
                backgroundColor: widget.selected
                    ? (widget.mark)
                        ? widget.buttonsColor['selected']!['backgroundColor']
                            .withOpacity(0.5)
                        : widget.buttonsColor['selected']!['backgroundColor']
                    : widget.buttonsColor['unselected']!['backgroundColor'],
                // minimumSize: Size(88, 36),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                shape: RoundedRectangleBorder(
                  side: (widget.mark)
                      ? BorderSide(
                          width: 1,
                          color: widget
                              .buttonsColor['selected']!['backgroundColor'],
                          style: BorderStyle.solid,
                        )
                      : BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              onPressed: () {
                widget.onPressed();
                setState(() {
                  _selected = !_selected;
                });
              },
              child: Row(
                children: [
                  widget.icon!,
                  const SizedBox(
                    width: 1,
                  ),
                  Text(widget.title),
                ],
              ),
            ),
          ],
        ));
  }
}
