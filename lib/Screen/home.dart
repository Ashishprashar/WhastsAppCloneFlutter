import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/Screen/calls.dart';
import 'package:flutter_application_1/Screen/camera.dart';
import 'package:flutter_application_1/Screen/status.dart';
import 'package:flutter_application_1/Screen/Chats.dart';
import 'package:flutter_application_1/widgets/custom-appbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  double _appBarTop = 0.0;
  late TabController _tabController;

  final _tabs = <Widget>[
    Tab(
      icon: Icon(Icons.camera_alt),
    ),
    Tab(
      text: 'CHATS',
    ),
    Tab(
      text: 'STATUS',
    ),
    Tab(
      text: 'CALLS',
    ),
  ];
  final int _cameraTapIndex = 0;

  double _getappBarHeight(BuildContext context) {
    final double kTabHeight = 46.0;
    final double kTextAndIconTabHeight = 72.0;
    final double inicatorHeight = 2.0;

    return kToolbarHeight +
        kTabHeight +
        inicatorHeight +
        MediaQuery.of(context).padding.top;
  }

  _buildTabView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        WillPopScope(
          onWillPop: () async {
            // shift to the right-handed-side tap;
            _tabController.animateTo(_cameraTapIndex + 1);
            print(
                "errrrrrorororoorororororrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
            throw Exception();
          },
          child: Camera(),
        ),
        Chats(),
        Status(),
        Calls(),
      ],
    );
  }

  _handleAppBarAnimation() {
    // This animation calculation will only work if camera tab index == 0
    if (_tabController.animation!.value <= 1.0 && _cameraTapIndex == 0) {
      final value = _tabController.animation!.value;
      final appBarHeight = _getappBarHeight(context);

      setState(() {
        _appBarTop = -(1 - value) * appBarHeight;
      });
    }
  }

  _handleTabIndex() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: _tabs.length,
      initialIndex: 1,
    );
    _tabController.animation!.addListener(_handleAppBarAnimation);
    _tabController.animation!.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.animation!.removeListener(_handleAppBarAnimation);
    _tabController.animation!.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final marginTopRaw = _appBarTop +
        _getappBarHeight(context) -
        MediaQuery.of(context).padding.top;
    final marginTop = marginTopRaw > 0 ? marginTopRaw : 0.0;

    return Scaffold(
        body: Stack(
          children: <Widget>[
            // Positioned(
            //   bottom: 100,
            //   right: 100,
            //   child: IconButton(
            //     onPressed: () {
            //       setState(() {
            //         _tabController.animateTo(_tabController.index + 1);
            //       });
            //     },
            //     icon: Icon(
            //       Icons.cloud_circle,
            //       color: Colors.red,
            //       size: 100,
            //     ),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(
                top: marginTop,
              ),
              child: _buildTabView(),
            ),
            Positioned(
              left: 0.0,
              right: 0.0,
              top: _appBarTop,
              child: CustomAppBar(
                context,
                _tabs,
                _tabController,
                _getappBarHeight(context),
              ),
            ),
          ],
        ),
        floatingActionButton: Stack(children: [
          if (_tabController.index != 0)
            Positioned(
              bottom: 0,
              right: 0,
              child: Column(
                children: [
                  if (_tabController.index == 1)
                    FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.message),
                        backgroundColor: Theme.of(context).primaryColor)
                  else
                    Column(
                      children: [
                        FloatingActionButton(
                            onPressed: () {},
                            child: Icon(
                              _tabController.index == 2
                                  ? Icons.edit
                                  : Icons.video_call_rounded,
                            ),
                            backgroundColor: Colors.cyan),
                        SizedBox(
                          height: 10,
                        ),
                        FloatingActionButton(
                            onPressed: () {},
                            child: Icon(
                              _tabController.index == 2
                                  ? Icons.camera_alt
                                  : Icons.add_call,
                            ),
                            backgroundColor: Theme.of(context).primaryColor),
                      ],
                    ),
                ],
              ),
            ),
        ]));
  }
}

bool getIsTabCamera(TabController tabController) {
  return tabController.animation!.value < 0.7;
}

bool getIsChatList(TabController tabController) {
  return tabController.animation!.value > 0.7 &&
      tabController.animation!.value < 1.7;
}

bool getIsStatusList(TabController tabController) {
  return tabController.animation!.value > 1.7 &&
      tabController.animation!.value < 2.7;
}

bool getIsCallList(TabController tabController) {
  return tabController.animation!.value > 2.7;
}

const listLeadingAvatarRadius = 25.0;
