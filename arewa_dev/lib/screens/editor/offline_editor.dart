import 'package:arewa_dev/constants/colors.dart';
import 'package:arewa_dev/screens/editor/html_preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:highlight/languages/xml.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HtmlEditorPage extends StatefulWidget {
  const HtmlEditorPage({super.key});

  @override
  State<HtmlEditorPage> createState() => _HtmlEditorPageState();
}

class _HtmlEditorPageState extends State<HtmlEditorPage> {
  late final CodeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CodeController(
      language: xml,
      patternMap: {r'\bHTML\b': const TextStyle(color: Colors.orange)},
    );

    _loadSavedCode(); // <-- Load saved code into editor
    _controller.addListener(_saveCode); // Auto-save on change
  }

  Future<void> _loadSavedCode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode =
        prefs.getString('user_html_code') ?? '<h1>Hello, Arewa Dev!</h1>';
    setState(() {
      _controller.text = savedCode;
    });
  }

  Future<void> _saveCode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_html_code', _controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.removeListener(_saveCode);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        foregroundColor: AppColors.textPrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Code editor'),
            IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                final userCode = _controller.text;
                if (userCode.isEmpty) {
                  ScaffoldMessenger.of(context).showMaterialBanner(
                    MaterialBanner(
                      backgroundColor: const Color.fromARGB(255, 210, 31, 28),
                      content: const Text('Code editor is empty!',
                          style: TextStyle(color: Colors.white)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(
                              context,
                            ).clearMaterialBanners();
                          },
                          child: const Text('DISMISS'),
                        ),
                      ],
                    ),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HtmlPreviewScreen(code: userCode),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: CodeTheme(
            data: CodeThemeData(
              styles: {
                'comment': const TextStyle(color: Colors.grey),
                'keyword': const TextStyle(color: Colors.blue),
                'root': TextStyle(
                  backgroundColor: const Color.fromARGB(255, 14, 28, 45),
                ),
                'tag': TextStyle(color: Colors.deepOrange),
                'attr': TextStyle(color: Colors.green),
              },
            ),
            child: CodeField(
              cursorColor: Colors.yellow,
              controller: _controller,
              textStyle: const TextStyle(fontFamily: 'SourceCode'),
            ),
          ),
        ),
      ),
    );
  }
}
