import 'package:wesave/ressource/export.dart';
class CustomTextfield {
  final String title;
  final String placeholder;
  final bool ispass;
  final bool obscure;
  final String err;
  final String content;
  var  onchanged;
  String _value = "";
  CustomTextfield({
    this.title = "",
    this.placeholder = "",
    this.ispass = false,
    this.obscure = false,
    this.content="",
    this.err = "",
    @required this.onchanged
  });
  TextFormField textFormField(
      placeholder, err, int max, int min, bool obscures, IconData icon, onchanged) {
    return TextFormField(
       textAlignVertical: TextAlignVertical.center,
      onChanged: onchanged,
      validator: (content) {
       /* if (content=gt=null || content.isEmpty) {
          return err;
        } else {
          return err;
        }*/
      },
      obscureText: obscures,
      maxLines: max,
      minLines: min,
      decoration: InputDecoration(
        
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintText: placeholder,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.black45, width: 1))),
    );
  }
}