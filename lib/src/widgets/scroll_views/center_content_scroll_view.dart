import 'package:flutter/material.dart';

/// CustomScrollView with centered [children] inside.
/// 
/// Centering will apply only if content size is less than 
/// ScrollView size.
class CenterContentScrollView extends StatelessWidget {
  /// Create CenterContentScrollView
  const CenterContentScrollView({
    super.key, 
    this.padding = EdgeInsets.zero,
    this.spacing = 0.0,
    this.controller,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.children,
  });

  /// Padding for [children].
  ///
  /// defaults to [EdgeInsets.zero]
  final EdgeInsetsGeometry padding;

  /// Spacing between [children].
  /// 
  /// defaults to 0.0
  final double spacing;

  /// Optional external controller
  final ScrollController? controller;

  /// How the children should be placed along the cross axis.
  /// 
  /// Applies to the nested [Column]
  /// Defaults to [CrossAxisAlignment.center]
  final CrossAxisAlignment crossAxisAlignment;

  /// Widgets inside CenterContentScrollView
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    
    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: padding,
            child: Center(
              child: Column(
                spacing: spacing,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: crossAxisAlignment,
                children: children,
              )
            ),
          ),
        ),
      ]
    );
  }
}

/// Conditionally center content inside [CustomScrollView].
/// 
/// Only center if content is small.
// class CenteringScrollView extends StatefulWidget {

//   /// Create CenteringScrollView.
//   const CenteringScrollView({
//     super.key,
//     // required this.keyboardHeight,
//     required this.children,
//     this.controller,
//   });

//   /// Keyboard height.
//   /// 
//   /// This is very crutial parameter
//   /// Get it with `MediaQuery.of(context).viewInsets.bottom`
//   /// from widget, which is aware of keyboadr state
//   /// for instance - get just before [Scaffold]
//   // final double keyboardHeight;

//   /// Optional external controller
//   final ScrollController? controller; 

//   /// Content of your scroll view.
//   final List<Widget> children;

//   @override
//   State<CenteringScrollView> createState() =>
//       _CenteringScrollViewState();
// }

// class _CenteringScrollViewState
//     extends State<CenteringScrollView> {
//   late ScrollController _internalScrollController;
//   bool _isContentSmallerThanViewport = false;


//   @override
//   void initState() {
//     super.initState();
//     _internalScrollController = widget.controller ?? ScrollController();

//     // Listen to scroll metrics changes to determine content vs viewport size
//     // _internalScrollController.addListener(_updateContentSizeComparison);

//     // Initial check after the first frame is rendered
//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     //   _updateContentSizeComparison();
//     // });
//   }

//   // void _updateContentSizeComparison() {
//   //   if (_internalScrollController.hasClients) {
//   //     final metrics = _internalScrollController.position;
//   //     // If maxScrollExtent is 0 or negative, it means content fits or is smaller
//   //     // than the viewport. A small positive maxScrollExtent might indicate
//   //     // floating precision issues, so we add a small tolerance.
//   //     final bool newIsContentSmaller = metrics.maxScrollExtent <= 0.01;

//   //     if (_isContentSmallerThanViewport != newIsContentSmaller) {
//   //       setState(() {
//   //         _isContentSmallerThanViewport = newIsContentSmaller;
//   //       });
//   //     }
//   //   }
//   // }

//   // @override
//   // void didUpdateWidget(covariant CenteringScrollView oldWidget) {
//   //   super.didUpdateWidget(oldWidget);

//   //   bool needUpdateContentSize = false;
//   //   if (widget.controller != oldWidget.controller) {
//   //     // If controller changes, update listeners
//   //     _internalScrollController.removeListener(_updateContentSizeComparison);
//   //     _internalScrollController = widget.controller ?? ScrollController();
//   //     _internalScrollController.addListener(_updateContentSizeComparison);
//   //     // Re-evaluate size comparison after controller change
//   //     needUpdateContentSize = true;
//   //   }

//   //   if (!listEquals(widget.children, oldWidget.children)) {
//   //     setState(() {});
//   //     needUpdateContentSize = true;
//   //   }

//   //   if (needUpdateContentSize) {
//   //     WidgetsBinding.instance.addPostFrameCallback((_) {
//   //       _updateContentSizeComparison();
//   //     });
//   //   }
//   // }

//   // @override
//   // void dispose() {
//   //   _internalScrollController.removeListener(_updateContentSizeComparison);
//   //   _internalScrollController.dispose();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {

//     return CustomScrollView(
//       controller: _internalScrollController,
//       // physics: _isContentSmallerThanViewport
//       //     ? const NeverScrollableScrollPhysics() // Disable scrolling if content fits
//       //     : const AlwaysScrollableScrollPhysics(), // Allow scrolling otherwise
      
      
//       // slivers: <Widget>[
//       //   // Always use a SliverList (or SliverToBoxAdapter),
//       //   // and handle centering/scrolling within its child.
//       //   SliverFillRemaining( // Using SliverFillRemaining to occupy full viewport
//       //     hasScrollBody: false, // Essential for this pattern
//       //     child: Column( // Use Column to manage vertical layout within the given space
//       //       mainAxisAlignment: _isContentSmallerThanViewport
//       //           ? MainAxisAlignment.center // Center content when it fits
//       //           : MainAxisAlignment.start, // Start from top when it scrolls
//       //       mainAxisSize: _isContentSmallerThanViewport
//       //           ? MainAxisSize.min // If content fits, Column takes min height
//       //           : MainAxisSize.max, // Otherwise, Column takes max height (fills SliverFillRemaining)
//       //       children: [
//       //         if (!_isContentSmallerThanViewport)
//       //           // If content is larger, add the children directly
//       //           ...widget.children
//       //         else
//       //           // If content is smaller, wrap it in a Column to center
//       //           // No need for Spacers if mainAxisAlignment.center is used.
//       //           // The Column itself will be centered by SliverFillRemaining.
//       //           // The key here is the Column being the direct child of SliverFillRemaining's child
//       //           // and managing alignment/sizing.
//       //           Column(
//       //             mainAxisSize: MainAxisSize.min, // Content-sized Column
//       //             children: widget.children,
//       //           ),
//       //       ],
//       //     ),
//       //   ),
//       // ],

//       slivers: <Widget>[
//         SliverFillRemaining(
//             // hasScrollBody: false is crucial here, as the content itself is not scrollable within this sliver
//             hasScrollBody: false,
//             child: Center(
//               child: Column( // Use Column to hold your children vertically
//                 mainAxisSize: MainAxisSize.min, // Make Column as small as its children
//                 children: widget.children,
//               ),
//             ),
//           ),
//         // if (_isContentSmallerThanViewport)
//         //   SliverFillRemaining(
//         //     // hasScrollBody: false is crucial here, as the content itself is not scrollable within this sliver
//         //     hasScrollBody: false,
//         //     child: Center(
//         //       child: Column( // Use Column to hold your children vertically
//         //         mainAxisSize: MainAxisSize.min, // Make Column as small as its children
//         //         children: widget.children,
//         //       ),
//         //     ),
//         //   )
//         // else
//         //   SliverList(
//         //     delegate: SliverChildListDelegate(
//         //       widget.children,
//         //     ),
//         //   ),
//       ],
//     );
//   }
// }

// CustomScrollView(
//   slivers: [
//     SliverFillRemaining(
//       hasScrollBody: false,
//         child: Center(
//           child: Column( 
//             mainAxisSize: MainAxisSize.min, 
//             children: [
//               TextField(),
//               ...
//             ],
//           ),
//         ),
//     ),
//   ],
// )