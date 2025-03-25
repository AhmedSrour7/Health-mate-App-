import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:health_mate/screens/core/auth_type_screen.dart';

class SplashPage extends StatefulWidget {
  Widget startScreen;

  SplashPage({required this.startScreen});

  @override
  State<SplashPage> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // Animation duration
    );

    // Define fade-in animation
    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    // Start the animation when the screen loads
    _animationController.forward();

    // Navigate to the next screen after a delay
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => widget.startScreen, // Navigate to the onboarding screen
      ));
    });
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the animation controller
    // Restore system UI mode
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Color(0XFF47BDAA),
        // statusBarColor: Color(0xffFCE36E).withOpacity(0.70),

        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarColor: Colors.black,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness:
            Brightness.light, // For iOS (dark icons)// For iOS (dark icons)
      ),
      child: Scaffold(
        backgroundColor: const Color(0XFF47BDAA),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Wrap the image with a FadeTransition
            FadeTransition(
              opacity: _fadeInAnimation, // Apply fade-in animation to opacity
              child: Center(
                child: Image.asset('assets/images/splash.jpg'),
              ),
            ),
            const SizedBox(height: 20), // Add some spacing
            // Wrap the text with a FadeTransition
            FadeTransition(
              opacity: _fadeInAnimation, // Apply fade-in animation to opacity
              child: const Text(
                'Health Mate',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
