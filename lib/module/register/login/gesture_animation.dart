import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:template_app/toolkit/utils/ui_util.dart';

void main() {
  runApp(const MaterialApp(home: PhysicsCardDragDemo()));
}

class PhysicsCardDragDemo extends StatelessWidget {
  const PhysicsCardDragDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const DraggableCard(
        child: FlutterLogo(
          size: 128,
        ),
      ),
    );
  }
}

/// A draggable card that moves back to [Alignment.center] when it's
/// released.
class DraggableCard extends StatefulWidget {
  const DraggableCard({required this.child, super.key});

  final Widget child;

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// The alignment of the card as it is dragged or being animated.
  ///
  /// While the card is being dragged, this value is set to the values computed
  /// in the GestureDetector onPanUpdate callback. If the animation is running,
  /// this value is set to the value of the [_animation].
  ///




  Size mySize = Size(500 , 500 );

  late Animation<Size?> _animation;

  double old = 0;

  /// Calculates and runs a [SpringSimulation].
     _runAnimation(Offset pixelsPerSecond, Size size)  {
    _animation =   SizeTween(
        begin: mySize,
        end:Size(500 , 500 )).animate(_controller);
    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);

    _controller.animateWith(simulation);


      _controller.reset();
      _controller.forward();


  }

  @override
  void initState() {


    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 500), );

    _controller.addListener(() {
      setState(() {
        // _dragAlignment = _animation.value;
        mySize = _animation.value!;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onPanDown: (details) {
        // _controller.stop();
      },
      onPanUpdate: (details) {
        setState(() {
          // _dragAlignment += Alignment(
          //   details.delta.dx / (size.width / 2),
          //   details.delta.dy / (size.height / 2),
          // );
        });
      },
      onVerticalDragStart: (details) {
        print('onVerticalDragStart');
      },
      onVerticalDragDown: (details) {
        // _controller.stop();
        print('onVerticalDragDown');
      },
      onVerticalDragUpdate: (details) {
        setState(() {

          double delta = details.delta.dy;

          mySize = Size(mySize.width - delta, mySize.height - delta);

        });
        print('onVerticalDragUpdate');
      },
      onVerticalDragEnd: (details) {
        print('onVerticalDragEnd');
        _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      onPanEnd: (details) {
        // _runAnimation(details.velocity.pixelsPerSecond, size);
      },
      child: SizedBox(
        width: mySize.width,
        height: mySize.height,
        child: Card(
          child: widget.child,
        ),
      ),
    );
  }
}
