import 'package:flutter/material.dart';
class ModifyPasswordBox extends StatefulWidget{
  final String title;final String info;final String description;
  ModifyPasswordBox({Key key, this.title, this.info, this.description}) : super(key: key);
  @override
  ModifyPasswordBoxState createState() =>_state =  ModifyPasswordBoxState();
  ModifyPasswordBoxState _state;
  ///砂纸密码
  setPassword(num pass){
if(_state!=null){
  _state.setPassword( pass);
}
  }
  ///获取密码
 List<String> getPass(){
   if(_state!=null){
   return  _state.listPass;
   }
    return [];
  }
}

class ModifyPasswordBoxState extends State<ModifyPasswordBox>{
  List<String> listPass = ['','','','','','',];

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 40,right: 40,),child: Column(
      children: <Widget>[
        Text(widget.title,style: TextStyle(fontSize: 16,),),
        SizedBox(height: 14,),
        Text(widget.info,style: TextStyle(fontSize: 12,color: Color(0xff999999),),textAlign: TextAlign.center,),
        SizedBox(height: 14,),
        _passBorde(6, '＊'),
        SizedBox(height: 14,),
        Row(children: <Widget>[
          Text(widget.description,style: TextStyle(fontSize: 10,color: Color(0xff999999)),),
        ],)
      ],
    ),);
  }
  _passBorde(int size, String showPass) {
    List<Widget> passborde = [];
    for (int i = 0; i < size; i++) {
      passborde.add(_passItem(showPass, size, i));
    }
    return Row(
      children: passborde,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }
  Widget _passItem(String showPass, int size, int position) {
    var bord = BorderSide(color: Color(0xffe2e2e2), width: 1);
    var bordr = BorderSide(color: Color(0xffe2e2e2), width: 0);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                left: bord,
                top: bord,
                right: position == size - 1 ? bord : bordr,
                bottom: bord)),
        child: Center(
          child: Text(
            listPass[position] != '' ? showPass : '',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        height: 50,
      ),
      flex: 1,
    );
  }

  void setPassword(num pass) {
    if(pass==-1){
      for(int i=listPass.length-1;i>=0;i--){
        if(listPass[i]!=''){
          listPass[i] = '';
          setState(() {
          });
          return;
        }
      }
    }else{
      for(int i=0;i<listPass.length;i++){
        if(listPass[i]==''){
          listPass[i] = '$pass';
          setState(() {
          });
          return;
        }
      }
    }
  }
}