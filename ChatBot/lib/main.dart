import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'package:syncfusion_flutter_pdf/pdf.dart';

//import 'package:googleapis/aiplatform/v1.dart';

const token =
    "ya29.c.b0Aaekm1Lemdbvb7zMWl48beKrVyK9SniXAf8xQ9mRl3Kg1TMecWwh4KFaBuU8WYbDAITrn5z09b-g9pu7j1Ylse6Ara6E-Cmp98HBz_sYAG3BgTDPgOx4dRp_TbZ4MS11evCd8S25d2IafZb8zzv8_Adg4vquXzg2PKythQ5TxCfkL50BYe4FeZXe1TYlkME3izDRBwW-ylpLJcCre_cz49tSmQq2dOkKgLohXDtTcgQbvk20QTJurYpmyQARl40T_TDXWjhIVIu6eFugPJMl8aSBjkjkXZY4D9yZgLfGlaT-iE1FlCCytYlEMRdkDCeJkYlT7f1jepMxJ13qPEa-kTa8NTtH2TeXIkt426wKTCTvHspP3ckkEl4Px6CV-P_fMOM7h57VLMpP8yar9iSlUzB-YNrX_1hFqscWiylRtPM0ige4lSz-KIzYpuma2Ron1LiU48xQwqiStv5lkHnass9Oc4P1L7k3GswbFc9cJ5TK37mFdAUZbe61-fRpDiJlZUoxf2iCf7_jq9C8MXcMlfbJnfOhjsxIfQvogAp2V63LQGWyWMDOymE88NsBnpdHgtd7BDbyNZYxieR-91EqawO0PhIlx_OCBEaedWjxH625AFe2h8WORFW8WZg9h2ts24Y2UrV_FQ-lz2yY6g2Xrf0Y91hJsk5gYY5oOWu5XmvbIrZcj9cF1JSwQkkOdIIv8aQ2336-Iv1drZgJ_RqxjwnWqzdM9xlw6tIgb-J0ui9Ox7I4fJwpj2tuiIzScp4__xznVdmcBRnMi8aW9iR8MtzqurQmri6fyF_ObW9xigQJ6s8w5_xFIxfUyZumQ579vSvxdlkdi2R7iJaVmvVaWWmQtROV3S17W5bScSu6WhrWFlnuB9bhzveyQJ5e_nbV93YzbuZxj55W1s52SYnZQe5SUzl3XUXX9ZzZ6mXahJ8Xq0QFzVo5lwzpttrr7ljsQdRcj55u_MqJO-wX39yiJMXecrfoIYqUzziv_b2mrgOJlMrQo5h3pvr";
Future<String> GetNonbinary(String binaryText) async {
  print("OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
  final headers = {
    'Authorization': 'Bearer ' + token,
    'Content-Type': 'application/json',
  };

  final data =
      '{\n    "instances": [\n        {\n            "content": "Please, transform the text into a non-binary version. Change gender-specific information, and pronouns to non-binary versions. Also, replace any private names with the placeholder \\"X\\". If there are more than 1 private person, make them \\"X1\\", \\"X2\\", etc. succesively. \nGive the answer in the JSON format, give the original text and non-binary text. Also, provide the private names that are replaced with \\"X\\" or \\"X*\\" in a separate list. That means that the \\"names\\" key contains a list of the names that were replaced in the transformation.\n\nText: Catharina wants to go to the gym. She wants to go there by bus. She met with John on the way.  Also, she talked with her son before going there and said that her son needed to go to visit his grandparents.\n\nText Answer: {\n  \\"original\\": \\"Catharina wants to go to the gym. She wants to go there by bus. She met with John on the way.  Also, she talked with her son before going there and said that her son needed to go to visit his grandparents. Then, Catharina finally arrived at the gym. \\",\n  \\"non-binary\\": \\"X wants to go to the gym. They want to go there by bus. They met with X1 on the way. Also, they talked with their child before going there and said that their child needed to go to visit their grandparents. \\",\n  \\"names\\": [\\"Catharina\\", \\"John\\"]\n}\n\nText: Ayse wants to be a doctor. She is the most successful student in her class.  Therefore, her parents want her to go to Stanford College. However, she wants to go to New York. Her brother is also one of the most successful high school students but wants to choose a career in the military. He wants to go to war and save his country from threads.\n\nText Answer: {\n  \\"original\\": \\"Ayse wants to be a doctor. She is the most successful student in her class.  Therefore, her parents want her to go to Stanford College. However, she wants to go to New York. Her brother is also one of the most successful high school students but wants to choose a career in the military. He wants to go to war and save his country from threads.\\",\n  \\"non-binary\\": \\"X wants to be a doctor. They are the most successful student in their class. Therefore, their parents want them to go to Stanford College. However, they want to go to New York. Their sibling is also one of the most successful high school students but wants to choose a career in the military. They want to go to war and save their country from threats.\\",\n  \\"names\\": [\\"Ayse\\"]\n}\n\nText: Maria enjoys painting during her free time. Her best friend, Tom, thinks she has a natural talent. Tom introduced her to his art teacher, Mr. Roberts, who believes Maria can become a professional artist.\nText Answer: {\n  \\"original\\": \\"Maria enjoys painting during her free time. Her best friend, Tom, thinks she has a natural talent. Tom introduced her to his art teacher, Mr. Roberts, who believes Maria can become a professional artist.\\",\n  \\"non-binary\\": \\"X enjoys painting during their free time. Their best friend, X1, thinks they have a natural talent. X1 introduced them to their art teacher, X2, who believes X can become a professional artist.\\",\n  \\"names\\": [\\"Maria\\", \\"Tom\\", \\"Mr. Roberts\\"]\n}\n\nText: Jack and Jill went up the hill to fetch a pail of water. Jack fell down and broke his crown, and Jill came tumbling after.\nText Answer: {\n  \\"original\\": \\"Jack and Jill went up the hill to fetch a pail of water. Jack fell down and broke his crown, and Jill came tumbling after.\\",\n  \\"non-binary\\": \\"X and X1 went up the hill to fetch a pail of water. X fell down and broke their crown, and X1 came tumbling after.\\",\n  \\"names\\": [\\"Jack\\", \\"Jill\\"]\n}\n\nText: Emma and Ethan are twins. Emma is passionate about astronomy, while Ethan loves marine biology. Emma often gazes at stars using her telescope, and Ethan dives deep into the ocean to study marine life.\nText Answer: {\n  \\"original\\": \\"Emma and Ethan are twins. Emma is passionate about astronomy, while Ethan loves marine biology. Emma often gazes at stars using her telescope, and Ethan dives deep into the ocean to study marine life.\\",\n  \\"non-binary\\": \\"X and X1 are twins. X is passionate about astronomy, while X1 loves marine biology. X often gazes at stars using their telescope, and X1 dives deep into the ocean to study marine life.\\",\n  \\"names\\": [\\"Emma\\", \\"Ethan\\"]\n}\n\nText: ' +
          binaryText +
          '\n\nText Answer:\n"\n        }\n    ],\n    "parameters": {\n        "candidateCount": 1,\n        "maxOutputTokens": 256,\n        "temperature": 0.2,\n        "topP": 0.8,\n        "topK": 40\n    }\n}';

  final url = Uri.parse(
      'https://us-central1-aiplatform.googleapis.com/v1/projects/greenhat23mun-8079/locations/us-central1/publishers/google/models/text-bison@001:predict');

  final res = await http.post(url, headers: headers, body: data);
  final status = res.statusCode;
  if (status != 200) throw Exception('http.post error: statusCode= $status');

  final parsedJson = json.decode(res.body);
  final content = parsedJson['predictions'][0]['content'];

  final contentJson = json.decode(content);
  final nonBinaryText = contentJson['non-binary'];

  print(nonBinaryText);
  return nonBinaryText;
}

Future<String> getResult(String nonbinaryText) async {
  final headers = {
    'Authorization': 'Bearer ' + token,
    'Content-Type': 'application/json',
  };

  final data = '{\n    "instances": [\n        {\n            "content": "' +
      nonbinaryText +
      '\n"\n        }\n    ],\n    "parameters": {\n        "candidateCount": 1,\n        "maxOutputTokens": 256,\n        "temperature": 0.2,\n        "topP": 0.8,\n        "topK": 40\n    }\n}';

  final url = Uri.parse(
      'https://us-central1-aiplatform.googleapis.com/v1/projects/greenhat23mun-8079/locations/us-central1/publishers/google/models/text-bison@001:predict');

  final res = await http.post(url, headers: headers, body: data);
  final status = res.statusCode;
  if (status != 200) throw Exception('http.post error: statusCode= $status');

  final parsedJson = json.decode(res.body);
  final content = parsedJson['predictions'][0]['content'];

  print(content);
  return (content);
}

void main() async {
  String nonbinary = await GetNonbinary("Elman had a ball");
  getResult(nonbinary);
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(), // Set the theme to dark mode
      home: ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];

  void _handleSubmitted(String text, isUserTemp) {
    ChatMessage message = ChatMessage(
      text: text,
      isUser: isUserTemp,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlindAI',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 54, 205),
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0, // Remove the app bar's shadow
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ChatInput(handleSubmitted: _handleSubmitted),
          ),
        ],
      ),
    );
  }
}

class ChatInput extends StatefulWidget {
  final Function(String, bool) handleSubmitted;

  ChatInput({required this.handleSubmitted});

  @override
  _ChatInputState createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted() async {
    String text = _textController.text.trim();
    if (text.isNotEmpty) {
      _textController.clear();
      checkX = false;
      colorSend = Color.fromARGB(255, 255, 54, 205);
      widget.handleSubmitted(text, true);
      String a = await GetNonbinary(text);
      String result_a = await getResult(a);
      widget.handleSubmitted(result_a, false);
      checkX = true;
      colorSend = Color.fromARGB(255, 255, 54, 205);
    }
  }

  bool checkX = true;
  Color colorSend = Color.fromARGB(255, 255, 54, 205);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0), // Add padding here
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TextField(
              enabled: checkX,
              controller: _textController,
              onSubmitted: (_) => _handleSubmitted(),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.upload_file, color: colorSend),
          onPressed: _handleSubmitted,
        ),
        PdfUploadButton(),
        IconButton(
          icon: Icon(Icons.send, color: Color.fromARGB(255, 255, 54, 205)),
          onPressed: _handleSubmitted,
        ),
      ],
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width *
                  0.7, // Adjust the maximum width as needed
            ),
            decoration: BoxDecoration(
              color: isUser
                  ? Color.fromARGB(255, 255, 54, 205)
                  : Color.fromARGB(255, 109, 109, 109),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(12.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16.0, color: Colors.white),
              maxLines: null, // Allow the text to wrap to multiple lines
            ),
          ),
        ],
      ),
    );
  }
}

//Pdf update

class PdfUploadButton extends StatefulWidget {
  @override
  _PdfUploadButtonState createState() => _PdfUploadButtonState();
}

class _PdfUploadButtonState extends State<PdfUploadButton> {
  Uint8List? _pdfBytes; // Use Uint8List to store PDF data

  void _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _pdfBytes = result.files.single.bytes; // Store PDF data
        print(result.files.single.name);

        //Load an existing PDF document.
        PdfDocument document = PdfDocument(inputBytes: _pdfBytes);

//Create a new instance of the PdfTextExtractor.
        PdfTextExtractor extractor = PdfTextExtractor(document);

//Extract all the text from the document.
        String text = extractor.extractText();

//Display the text.
        print(text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _openFilePicker,
          child: Text('Upload PDF'),
        ),
        if (_pdfBytes != null)
          Text(
            'Selected PDF: ${_pdfBytes!.length} bytes', // Display PDF size
            style: TextStyle(fontSize: 16),
          ),
      ],
    );
  }
}
