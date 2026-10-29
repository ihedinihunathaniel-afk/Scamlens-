import 'package:flutter/material.dart';
void main() => runApp(ScamLensApp());
class ScamLensApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  final TextEditingController _c = TextEditingController();
  String _r = ""; Color _col = Colors.grey; IconData _ic = Icons.security;
  void _scan(){
    String t = _c.text.toLowerCase();
    if(t.isEmpty){ setState((){_r="Paste message first!"; _col=Colors.orange; _ic=Icons.warning;}); return;}
    List<String> w = ["congratulations","won","prize","urgent","click here","claim","lottery","blocked","verify","bit.ly","giveaway","winner","send money"];
    int s=0; for(var x in w){ if(t.contains(x)) s++; }
    if(s>=2){ setState((){_r="⚠️ SCAM DETECTED!\nThis looks like scam. Don't click link, don't send money!"; _col=Colors.red; _ic=Icons.dangerous;});}
    else if(s==1){ setState((){_r="⚠️ SUSPICIOUS!\nBe careful, 1 scam sign found."; _col=Colors.orange; _ic=Icons.warning;});}
    else{ setState((){_r="✅ LOOKS SAFE\nNo obvious scam signs, but still be careful!"; _col=Colors.green; _ic=Icons.verified_user;});}
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("ScamLens"), backgroundColor: Colors.deepPurple, foregroundColor: Colors.white, centerTitle: true),
      body: SingleChildScrollView(padding: EdgeInsets.all(16), child: Column(children:[
        Icon(Icons.shield, size:80, color: Colors.deepPurple),
        Text("ScamLens", style: TextStyle(fontSize:32, fontWeight:FontWeight.bold, color: Colors.deepPurple)),
        SizedBox(height:20),
        TextField(controller:_c, maxLines:6, decoration: InputDecoration(hintText:"Paste suspicious message here...", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
        SizedBox(height:15),
        SizedBox(width:double.infinity, child: ElevatedButton(onPressed:_scan, style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, foregroundColor: Colors.white, padding: EdgeInsets.symmetric(vertical:16)), child: Text("SCAN NOW", style: TextStyle(fontSize:18, fontWeight:FontWeight.bold)))),
        SizedBox(height:25),
        if(_r.isNotEmpty) Container(width:double.infinity, padding:EdgeInsets.all(16), decoration: BoxDecoration(color:_col.withOpacity(0.1), border: Border.all(color:_col, width:2), borderRadius: BorderRadius.circular(12)), child: Column(children:[Icon(_ic, size:50, color:_col), SizedBox(height:10), Text(_r, style: TextStyle(fontSize:16, fontWeight:FontWeight.bold, color:_col), textAlign:TextAlign.center)]))
      ])),
    );
  }
}
