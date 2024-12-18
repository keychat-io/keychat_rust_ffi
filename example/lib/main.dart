import 'package:flutter/material.dart';
import 'package:keychat_rust_ffi/keychat_rust_ffi.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
            child: Column(
          children: [
            Text(
                'Action: Call Rust `greet("Tom")`\nResult: `${greet(name: "Tom")}`'),
            Text(
                'Action: Call Rust `getHexPubkeyByBech32()`\nResult: `${getHexPubkeyByBech32(bech32: 'npub1ej3mavd4ggajl7g3xyvst9xcfqqs564epdufk9tffvvtx7h8nlys5hcprv')}`'),
          ],
        )),
      ),
    );
  }
}
