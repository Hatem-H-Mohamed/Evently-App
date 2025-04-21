// import 'package:evently_app/core/app_assets/app_assets.dart';
// import 'package:evently_app/features/app_intro/view/widgets/intro_component.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {

//   List<IntroComponent> components = [
//     IntroComponent(),
//     IntroComponent(),
//     IntroComponent(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 15.h),
//             Center(
//               child: Image.asset(
//                 AppAssets.onboardingLogo,
//                 height: 50.h,
//                 width: 157.w,
//               ),
//             ),
//             PageView.builder(itemCount: 4, itemBuilder: (context, index) {
//               return IntroComponent();
//             }),
//           ],
//         ),
//       ),
//     );
//   }
// }
