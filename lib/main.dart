import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(const DurtApp());

class DurtApp extends StatelessWidget {
  const DurtApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

/* ---------------------- 1) SPLASH ---------------------- */
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainMenuScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0E2741),
      body: Center(
        child: Image(
          image: AssetImage('assets/splash/splash_screen.png'),
          width: 220,
        ),
      ),
    );
  }
}

/* ---------------------- 2) ANA MENÜ ---------------------- */
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Arka plan SVG (tam ekran)
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/svg/bg_main.svg',
              fit: BoxFit.cover,
            ),
          ),

          // İçerik
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Üst bar (profil, puan, kamera/ayar)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Row(
                    children: [
                      // Profil placeholder (SVG)
                      SvgPicture.asset(
                        'assets/svg/profile_frame.svg',
                        width: 56,
                        height: 56,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Okan Demir.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(height: 4),
                            Text('Pt 14,11K',
                                style: TextStyle(
                                    color: Color(0xFFF7D14A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                      ),
                      // Kamera
                      _RoundIconButton(
                        svg: 'assets/svg/icon_camera.svg',
                        onTap: () {},
                      ),
                      const SizedBox(width: 10),
                      // Ayarlar
                      _RoundIconButton(
                        svg: 'assets/svg/icon_settings.svg',
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => const SettingsScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                // Logo (ortada)
                Center(
                  child: SvgPicture.asset(
                    'assets/svg/logo_main.svg',
                    width: 250,
                  ),
                ),

                const Spacer(),

                // Butonlar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      SvgButton(
                        svgPath: 'assets/svg/btn_yellow.svg',
                        label: 'Hemen Oyna',
                        onTap: () {},
                      ),
                      const SizedBox(height: 18),
                      SvgButton(
                        svgPath: 'assets/svg/btn_blue.svg',
                        label: 'Oda Aç',
                        onTap: () {},
                      ),
                      const SizedBox(height: 18),
                      SvgButton(
                        svgPath: 'assets/svg/btn_green.svg',
                        label: 'Oda Ara',
                        onTap: () {},
                      ),
                      const SizedBox(height: 28),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------------- 3) AYARLAR ---------------------- */
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Arka plan
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset('assets/svg/bg_main.svg', fit: BoxFit.cover),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Panel SVG
                    SvgPicture.asset(
                      'assets/svg/panel_settings.svg',
                      width: MediaQuery.of(context).size.width - 24,
                      // yükseklik panel SVG oranına göre otomatik
                    ),

                    // Panel içeriği (basit sürüm)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          const Text(
                            'HESABI BAĞLA',
                            style: TextStyle(
                              color: Color(0xFFF5D581),
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _SocialSquare(svg: 'assets/svg/brand_facebook.svg'),
                              _SocialSquare(svg: 'assets/svg/brand_google.svg'),
                              _SocialSquare(svg: 'assets/svg/brand_apple.svg'),
                            ],
                          ),
                          const SizedBox(height: 22),
                          _SettingRowSwitch(title: 'Ses Efekti'),
                          const SizedBox(height: 10),
                          _SettingRowValue(title: 'El Sonu Yaz Boz', value: 'Evet'),
                          const SizedBox(height: 10),
                          _SettingRowValue(title: 'Kart Gösterici', value: 'Evet'),
                          const SizedBox(height: 10),
                          _SettingRowValue(title: 'Arka Plan', value: 'Mavi'),
                          const SizedBox(height: 10),
                          _SettingRowValue(title: 'Kart Şekli', value: 'Mobil'),
                          const SizedBox(height: 18),

                          // Alt butonlar
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _WideSvgButton(
                                svg: 'assets/svg/btn_delete_account.svg',
                                label: 'Hesabımı Sil',
                                onTap: () {},
                              ),
                              _WideSvgButton(
                                svg: 'assets/svg/btn_logout.svg',
                                label: 'Oturumu Kapat',
                                onTap: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: SvgPicture.asset(
                                  'assets/svg/btn_confirm.svg',
                                  width: 88,
                                ),
                              ),
                              const SizedBox(width: 24),
                              GestureDetector(
                                onTap: () => Navigator.of(context).pop(),
                                child: SvgPicture.asset(
                                  'assets/svg/btn_cancel.svg',
                                  width: 88,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------------- WIDGETLAR ---------------------- */

class SvgButton extends StatelessWidget {
  final String svgPath;
  final String label;
  final VoidCallback onTap;
  const SvgButton({
    super.key,
    required this.svgPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(svgPath, width: double.infinity, height: 72, fit: BoxFit.fill),
          Text(
            label,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  final String svg;
  final VoidCallback onTap;
  const _RoundIconButton({required this.svg, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(svg, width: 44, height: 44),
    );
  }
}

class _SocialSquare extends StatelessWidget {
  final String svg;
  const _SocialSquare({required this.svg});
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(svg, width: 86, height: 86);
  }
}

class _WideSvgButton extends StatelessWidget {
  final String svg;
  final String label;
  final VoidCallback onTap;
  const _WideSvgButton({required this.svg, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(svg, width: 180, height: 60),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingRowSwitch extends StatefulWidget {
  final String title;
  const _SettingRowSwitch({required this.title});
  @override
  State<_SettingRowSwitch> createState() => _SettingRowSwitchState();
}

class _SettingRowSwitchState extends State<_SettingRowSwitch> {
  bool val = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(widget.title,
              style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
        ),
        Switch(
          value: val,
          onChanged: (v) => setState(() => val = v),
          activeColor: const Color(0xFFF1C04B),
        ),
      ],
    );
  }
}

class _SettingRowValue extends StatelessWidget {
  final String title;
  final String value;
  const _SettingRowValue({required this.title, required this.value});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(title,
              style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xFF173453).withOpacity(0.8),
            border: Border.all(color: const Color(0xFFF1C04B), width: 1),
          ),
          child: Row(
            children: [
              Text(value,
                  style: const TextStyle(
                      color: Color(0xFFF1EFD8),
                      fontSize: 18,
                      fontWeight: FontWeight.w800)),
              const SizedBox(width: 6),
              const Icon(Icons.chevron_right, color: Color(0xFFF1EFD8)),
            ],
          ),
        ),
      ],
    );
  }
}
