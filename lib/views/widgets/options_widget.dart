import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:signlang/views/widgets/options_view.dart';

// ignore: must_be_immutable
class OptionWidget extends StatelessWidget {
  String title;
  String description;
  IconData icon;
  VoidCallback onTap;
  OptionWidget({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final _controller = ActionSliderController();
    return ActionSlider.custom(
      controller: _controller,
      sliderBehavior: SliderBehavior.stretch,
      toggleMargin: EdgeInsets.zero,
      toggleWidth: 30.0,
      height: 200,
      foregroundChild: const Icon(Icons.navigate_next_rounded, color: Colors.white, size: 30),
      foregroundBuilder: (context, state, child) {
        return Container(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Color.lerp(
                Colors.transparent.withOpacity(0.6),
                Colors.transparent.withOpacity(0.2),
                state.position,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: child,
          ),
        );
      },
      backgroundBorderRadius: BorderRadius.circular(5.0),
      backgroundChild: OptionView(
        title: title,
        description: description,
        icon: icon,
        onTap: onTap,
      ),
      backgroundColor: Colors.deepPurple.shade300,
      backgroundBuilder: (context, state, child) {
        return Card(
          color: Color.lerp(
            Colors.deepPurple.shade100,
            Colors.deepPurpleAccent.shade100,
            state.position,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          child: child,
        );
      },
      action: (controller) async {
        controller.loading();
        controller.success();
        controller.reset();
        onTap();
      },
    );
  }
}
