
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController firstController=TextEditingController();
  TextEditingController secondController=TextEditingController();
  TextEditingController thirdController=TextEditingController();
  TextEditingController forthController=TextEditingController();



  String? firstRadio='';
  String? secondRadio='';
  String? secondRadio2='';
  String? thirdRadio='';
  String? thirdRadio2='';
  String? forthRadio='';
  String? forthRadio2='';

  String? fifthRadio='';
  String? sixthRadio='';
  String? seventhRadio='';
  String? eighthRadio='';
  String? ninthRadio='';
  String? tenthRadio='';
  String? elevenRadio='';
  String? twelveRadio='';




  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(50),
        child: Container(
          color: Colors.blue,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text('Done',style: TextStyle(color: Colors.white,fontSize: 18,
                  fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
      body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView(
                children: [
                  //first section
                  CustomQuestion('Kontakopplysning (navn, adresse, e-post, telefonnummer)',
                    isTextField: true,controller: firstController,),
                 //second section
                  CustomQuestion('Hva skal pusses opp?',list: ['Deler av huset','Hele huset'],groupVal: firstRadio,
                    onChanged: (v){
                    setState(() {
                      firstRadio=v;
                    });
                  },),
                  firstRadio=='Deler av huset'?
                  Column(
                    children: [
                      CustomQuestion('Hva trenger du hjelp til? (f.eks. nytt kjøkken, bygge platting, tilbygg... osv)',
                        isTextField: true,controller: secondController,),

                      CustomQuestion('Hvor gammelt er huset/deler av huset?',
                        list: ['5 år eller mindre','Mellom 5-10 år',
                          'Mellom 10-15 år','Mellom 15-25 år','Eldre enn 25 år'],
                        groupVal: secondRadio,
                          onChanged: (v){
                            setState(() {
                              secondRadio=v;
                            });
                          }
                      ),

                      CustomQuestion('Størrelsen på det som skal pusses opp (i areal) ?',
                        list: ['Mindre enn 15 m2','15-25 m2',
                          '25-50 m2','50-100 m2','100-250 m2','250 + m2'],
                        groupVal: thirdRadio,
                          onChanged: (v){
                            setState(() {
                              thirdRadio=v;
                            });
                          }
                      ),

                      CustomQuestion('Har huset stått tomt i lengre perioder? (relevant for takstmann) ?',
                        list: ['Ja','Nei', 'Vet ikke','other'],
                        groupVal: forthRadio, onChanged: (v){
                            setState(() {
                              forthRadio=v;
                            });
                          }),
                      CustomQuestion('Når ble huset/bygget sist oppgradert? ',
                        isTextField: true,controller: thirdController,desc:
                        '(feks. under siste oppussing ble det satt opp et tilbygg '
                            'i 2003 av faglærte)',isDescription:true),
                    ],
                  ):
                  firstRadio=='Hele huset'?
                  Column(children: [
                    CustomQuestion('Hvor gammelt er huset/deler av huset?',
                      list: ['5 år eller mindre','Mellom 5-10 år',
                        'Mellom 10-15 år','Mellom 15-25 år','Eldre enn 25 år'],
                      groupVal: secondRadio2,
                        onChanged: (v){
                          setState(() {
                            secondRadio2=v;
                          });
                        }
                    ),

                    CustomQuestion('Størrelsen på det som skal pusses opp (i areal) ?',
                      list: ['Mindre enn 15 m2','15-25 m2',
                        '25-50 m2','50-100 m2','100-250 m2','250 + m2'],
                      groupVal: thirdRadio2,
                        onChanged: (v){
                          setState(() {
                            thirdRadio2=v;
                          });
                        }
                    ),

                    CustomQuestion('Har huset stått tomt i lengre perioder? (relevant for takstmann) ?',
                      list: ['Ja','Nei', 'Vet ikke','other'],
                      groupVal: forthRadio2,
                        onChanged: (v){
                          setState(() {
                            forthRadio2=v;
                          });
                        }

                    ),
                    CustomQuestion('Når ble huset/bygget sist oppgradert? ',
                        isTextField: true,controller: thirdController,desc:
                        '(feks. under siste oppussing ble det satt opp et tilbygg '
                            'i 2003 av faglærte)',isDescription:true),
                  ],):SizedBox(),







                  //third section
                  CustomQuestion('Vet du allerede om noen feil i huset ditt? ',
                    list: ['Ja','Nei', 'Vet ikke'],
                    groupVal: sixthRadio,
                      onChanged: (v){
                        setState(() {
                          sixthRadio=v;
                        });
                      }
                  ),

                  sixthRadio==''?SizedBox()
                     : Column(children: [
                        sixthRadio=='Ja'?
                        CustomQuestion('Kan du beskrive enkle feil i huset? (vannlekasje, elektrisk feil, maling, fuktskade, osv....)',
                            isTextField: true,controller: forthController,desc:
                            '(f.eks. elektrisktfeil på badet)',isDescription:true):SizedBox(),

                        CustomQuestion('Kjenner du til om det er/har vært feil tilknyttet våtrommene?',
                          list: ['Ja','Nei', 'Vet ikke'],
                          groupVal: seventhRadio,desc:
                            '(f.eks. sprekker, lekkasje, råte, lukt eller soppskader)'
                            ,isDescription:true,
                            onChanged: (v){
                              setState(() {
                                seventhRadio=v;
                              });
                            }
                        ),

                        CustomQuestion('Har du opplevd å ha skadedyr i huset ditt?',
                          list: ['Ja','Nei', 'Vet ikke'],
                          groupVal: eighthRadio,
                            onChanged: (v){
                              setState(() {
                                eighthRadio=v;
                              });
                            }
                        ),

                        CustomQuestion('Har det blitt utført arbeid i form av'
                            ' egeninnsats/dugnad på deler av huset som du vet om?',
                          list: ['Ja','Nei', 'Vet ikke'],
                          groupVal: ninthRadio,
                            onChanged: (v){
                              setState(() {
                                ninthRadio=v;
                              });
                            }
                            ),
                    ninthRadio=='Ja'?
                    CustomQuestion('Hva ble utført?',
                      isTextField: true,controller: firstController,desc:
                        'beskriv hva som ble utført på huset. '
                        ,isDescription:true)
                        :SizedBox(),
                        CustomQuestion('Kjenner du til noen problemer med drenering, isolasjon/sprekker i mur?',
                          list: ['Ja','Nei', 'Vet ikke'],
                          groupVal: tenthRadio,
                            onChanged: (v){
                              setState(() {
                                tenthRadio=v;
                              });
                            }
                        ),
                      ],),
                  //forthSection
                  CustomQuestion('Trenger du rådgiver?',
                    list: ['Ja','Nei', 'Vet ikke'],
                    groupVal: elevenRadio,onChanged: (v){
                        setState(() {
                          elevenRadio=v;
                        });
                      }),
                  CustomQuestion('Trenger du takstmann?',
                    list: ['Ja','Nei', 'Vet ikke'],
                    groupVal: twelveRadio,onChanged: (v){
                        setState(() {
                          twelveRadio=v;
                        });
                      }),

                ],
              ),
            ),
          ),



    );
  }
}

class CustomQuestion extends StatefulWidget {
   CustomQuestion(this.question,{Key? key,this.isTextField=false,
    this.controller,this.desc,this.list,this.groupVal,this.isDescription=false,this.onChanged}) : super(key: key);
final String question;
   String? hintText;
    String? desc;

   final List<String>? list;
   String? groupVal;

   final bool isDescription;

  final bool isTextField;
final TextEditingController? controller;
var onChanged;

  @override
  State<CustomQuestion> createState() => _CustomQuestionState();
}

class _CustomQuestionState extends State<CustomQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Column(
          children: [
            Text(widget.question,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            SizedBox(height: 10,),
           widget.isDescription?Text(widget.desc!,style:TextStyle(color: Colors.grey) ,):SizedBox(),
           SizedBox(height: 10,),

          ],
        ),
        widget.isTextField?TextFormField(
          decoration: InputDecoration(
            hintText: 'Enter Answer',
            border: OutlineInputBorder(
              borderSide: BorderSide(color:Colors.grey, width: 2.0,),

            ) ,
          ),
          controller: widget.controller,


        ):
            Container(
              height: 50*double.parse(widget.list!.length.toString()),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount:widget.list!.length ,
                itemBuilder: (context,index)=>

                    RadioListTile(
                      title:Text(widget.list![index],),
                    value: widget.list![index],
                    groupValue: widget.groupVal,
                    onChanged: widget.onChanged
                    //     (v){
                    //  // setState(() {
                    //     widget.groupVal=v;
                    //     MainBloc.get(context).getChanged(v,
                    //         widget.groupVal);
                    //  // });
                    //   print('${widget.groupVal} is ');
                    // },
                    ),
                    ),
            ),

        SizedBox(height: 20,),

      ],
    );
  }
}
