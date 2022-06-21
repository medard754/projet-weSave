

import 'package:wesave/ressource/export.dart';

class DropdownCodepays extends StatefulWidget {
  
  DropdownCodepays({Key? key}) : super(key: key);

  @override
  State<DropdownCodepays> createState() => _DropdownCodepaysState();
}

class _DropdownCodepaysState extends State<DropdownCodepays> {
  
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Numero de telephone',
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1,color:Colors.black45),
          ),
         ),
        onChanged: (phone) {
          print(phone.completeNumber);
        },
        onCountryChanged: (country) {
          print('Country changed to: ' + country.name);
        },
    );
    
  }
}