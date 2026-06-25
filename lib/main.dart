import 'package:flutter/material.dart';
import 'package:frb_template/src/rust/api/simple.dart';
import 'package:frb_template/src/rust/frb_generated.dart';
import 'package:yaru/yaru.dart'; // 已经导入

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. 用 YaruTheme 包裹住 MaterialApp
    return YaruTheme(
      builder: (context, yaru, child) {
        // 2. 将 Yaru 的主题数据赋值给 MaterialApp
        return MaterialApp(
          theme: yaru.theme,          // 亮色主题
          darkTheme: yaru.darkTheme,  // 暗色主题
          themeMode: ThemeMode.system, // 跟随系统（可选，这样能自动切换明/暗）
          home: Scaffold(
            appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
            body: Center(
              children: [
                Text(
                  'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`',
                ),
                Text(
                  '尝试中文',
                ),
              ]
            ),
          ),
        );
      },
    );
  }
}
