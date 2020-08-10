import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class AfterCreditsDialog {
  static void showMovieInfo({
    Widget child,
    Duration duration,
  }) {
    BackButtonBehavior backButtonBehavior = BackButtonBehavior.none;
    BotToast.showCustomLoading(
      clickClose: false,
      allowClick: false,
      crossPage: true,
      backButtonBehavior: backButtonBehavior,
      animationDuration: Duration(milliseconds: 300),
      duration: duration ?? Duration(days: 1),
      toastBuilder: (cancelFunc) => child,
      wrapToastAnimation: (controller, cancel, child) {
        return Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                cancel();
              },
              child: AnimatedBuilder(
                builder: (_, child) => Opacity(
                  opacity: controller.value,
                  child: child,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.transparent),
                  child: SizedBox.expand(),
                ),
                animation: controller,
              ),
            ),
            CustomOffsetAnimation(
              controller: controller,
              child: GestureDetector(onTap: cancel, child: Center(child: child)),
            )
          ],
        );
      },
    );
  }
}

class CustomOffsetAnimation extends StatefulWidget {
  final AnimationController controller;
  final Widget child;

  const CustomOffsetAnimation({Key key, this.controller, this.child}) : super(key: key);

  @override
  _CustomOffsetAnimationState createState() => _CustomOffsetAnimationState();
}

class _CustomOffsetAnimationState extends State<CustomOffsetAnimation> {
  Tween<Offset> tweenOffset;
  Tween<double> tweenScale;

  Animation<double> animation;

  @override
  void initState() {
    tweenOffset = Tween<Offset>(
      begin: const Offset(0.0, 0.8),
      end: Offset.zero,
    );
    tweenScale = Tween<double>(begin: 0.3, end: 1.0);
    animation = CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: widget.child,
      animation: widget.controller,
      builder: (context, child) {
        return FractionalTranslation(
            translation: tweenOffset.evaluate(animation),
            child: ClipRect(
              child: Transform.scale(
                scale: tweenScale.evaluate(animation),
                child: Opacity(
                  child: child,
                  opacity: animation.value,
                ),
              ),
            ));
      },
    );
  }
}
