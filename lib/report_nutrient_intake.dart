import 'package:flutter/material.dart';

class ReportNutrientIntakePage extends StatefulWidget {
  const ReportNutrientIntakePage({super.key});

  @override
  State<ReportNutrientIntakePage> createState() =>
      _ReportNutrientIntakePageState();
}
class _ReportNutrientIntakePageState extends State<ReportNutrientIntakePage> {
  bool isSwitched =
      false; // Husk at deklarering af variable skal ske inden vores override og build
  bool? isBoxChecked = false; // bool? betyder nullable bool

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("P5 CGM app"),
        automaticallyImplyLeading:
            true, // Fjerner automatisk genereret tilbageknap
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pop(); // Tager os tilbage til den forrige side --> pop() betyder at vi fjerner den nuværende side
          },



          icon: const Icon(Icons.arrow_back_ios),
        ),
        
        
        actions: [
          IconButton(
              onPressed: () {
                debugPrint("Actions");
              },
              icon: const Icon(Icons.info_outline))
        ],
      ),

     
     
         
        body: SingleChildScrollView(

        child: Column(
          // Tilføjer sådan set bare en søjle af widgets
            children: [
              // children tillader os at tilføje mere end én widget
    const SizedBox(height:100),
   SizedBox(
  width: 310, // Set the desired width
  height: 110, // Set the desired height 
child:TextField(
  decoration: InputDecoration(
    filled: true,
    fillColor: const Color.fromARGB(255, 156, 180, 168),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25.0), // Adjust the radius as needed
    ),
    hintText: 'Type of food',
  ),
  maxLines: 5,
),
   ),
            
            
          
            const SizedBox(height: 250),
const Row(
  children: [
    Text(
      "          Choose your meal size",
      style: TextStyle(
        fontSize: 16, // Increase font size for better visibility
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 0.5, // Adjust letter spacing as needed
        fontFamily: 'Roboto', // Use a specific font family if desired
      ),
    ),
  ],
),

const SizedBox(height: 20),

            Row(
            //skaber en rækker af widgets
            mainAxisAlignment: MainAxisAlignment.center,
            //centerer vores knapper

            children: [



              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3), // Custom color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
            onPressed: () {
            debugPrint("Button 1 Clicked"); //viser at den bliver trukket i debug console
            },
            child: const Text("Small"),//tekst indenfor knappen
            ),
            const SizedBox(width: 30), // afstand mellem knapper
    

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3), // Custom color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
            onPressed: () {
           debugPrint("Button 2 Clicked"); //viser at den bliver trukket i debug console
            },
            child: const Text("Medium"),//tekst indenfor knappen
            ),
    
            const SizedBox(width: 30), // afstand mellem knapper 
            
            
             ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3), // Custom color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
            onPressed: () {
            debugPrint("Button 3 Clicked"); //viser at den bliver trukket i debug console
            },
            child: const Text("Large"),//tekst indenfor knappen
              ),
              ],
            ),
ConstrainedBox(
  constraints: const BoxConstraints.tightFor(width: 280, height: 42), // Adjust the width and height as needed
  child: ElevatedButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    ),
    onPressed: () {
      debugPrint("Save Button Clicked");
    },
    child: const Text("Save"),
  ),
)



     
      
          ],
          
        ),
        

      )
    );
  }
}
