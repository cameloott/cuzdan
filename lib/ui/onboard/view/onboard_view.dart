import '../../../core/base/state/base_state.dart';
import '../viewmodel/onboard_viewmodel.dart';
import '../widgets/slide_dots.dart';
import 'slider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../widgets/getstarted_button.dart';

//TODO son elemanda alttaki daireler eksik eklenmeli

class OnboardView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnboardView();
}

class _OnboardView extends BaseState<OnboardView> {
  var onboardViewModel = OnboardViewModel();
  @override
  void initState() {
    onboardViewModel.getOnboardData();
    super.initState();
  }

  bool inFinalPage() => (onboardViewModel.currentPage == onboardViewModel.onboardModelList!.length - 1);

  @override
  Widget build(BuildContext context) => Scaffold(body: sliderLayout());

  Widget sliderLayout() {
    return Observer(
      builder: (context) {
        return onboardViewModel.onboardModelList == null
            ? Container()
            : Stack(
                children: <Widget>[
                  slideBody(),
                  buildSlideDots(context),
                ],
              );
      },
    );
  }

  Padding slideBody() {
    return Padding(
      padding: EdgeInsets.only(top: appBarSize),
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        onPageChanged: onboardViewModel.onPageChanged,
        itemCount: onboardViewModel.onboardModelList!.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (ctx, i) => SlideItem(i, onboardViewModel),
      ),
    );
  }

  Container buildSlideDots(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.bottomCenter,
      margin: EdgeInsets.only(bottom: dynamicHeight(50.0)),
      child: inFinalPage()
          ? GetStartedButton()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i = 0; i < onboardViewModel.onboardModelList!.length; i++)
                  if (i == onboardViewModel.currentPage) SlideDots(true) else SlideDots(false)
              ],
            ),
    );
  }
}
