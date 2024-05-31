
import 'package:expenxe/models/esp.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
final fo=DateFormat.yMd();
class trt extends StatefulWidget {
  const trt({super.key, required this.oae});
final void Function (esp e) oae;
  @override
  State<trt> createState() => _trtState();
}

// ignore: camel_case_types
class _trtState extends State<trt> {
  final _tits = TextEditingController();
  final hj = TextEditingController();
    DateTime? sed;
    cat d=cat.leisure;

  void cd() async {
    final now = DateTime.now();
    final fd = DateTime(now.year-1, now.month, now.day);
    final r=await  showDatePicker(
      context: context,
      firstDate: fd,
      lastDate: now,
      initialDate: now,
    );
    setState(() {
      sed=r;
    });
  }

  var ent = '';

  void sti(String inputvalue) {
    ent = inputvalue;
  }

  @override
  void dispose() {
    _tits.dispose();
    hj.dispose();
    super.dispose();
  }
  void see(){
    final ea= double.tryParse(hj.text);
    final ai=ea==null || ea<=0;

    if(_tits.text.trim().isEmpty || ai || sed==null)
{

     showDialog(context: context, builder: (context)=> AlertDialog(
      title: const Text('invalid',style: TextStyle(color: Colors.black),),
      content: const Text('type legally',style: TextStyle(color: Colors.black),),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('okay'))
      ],
     )
 
     );
     return;
} 
  widget.oae(esp(
    title: _tits.text,
     amount: ea,
      category:d ,
       date: sed!));
       Navigator.pop(context);                                                    
 }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,48,16,16),
      child: Column(
        children: [
          TextField(
            controller: _tits,
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: hj,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$',
                    labelText: 'Price',
                   
                  ),
                ),
              ),
              const SizedBox(width: 12,),
              Expanded(
                child: Row(
            
                  children: [
                     Text(sed==null?'no date':fo.format(sed!),style: TextStyle(color: Colors.black),),
                    IconButton(
                      onPressed: cd,
                      icon: const Icon(Icons.calendar_month),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16,),
          Row(

            children: [
              DropdownButton(
                value: d,
                items: cat.values.map((cat)=>DropdownMenuItem(
                value: cat,
                child: Text(cat.name.toUpperCase(),style: TextStyle(color: Colors.black),
               ),

               ),

              ).toList(), onChanged:(value){
                if(value==null){
                  return ;
                }
               setState(() {
                 d=value;
               });
               Spacer();
              } ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                 see();
                },
                child: const Text('Submit'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
