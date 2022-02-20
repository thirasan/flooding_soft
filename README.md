# flooding_soft


## Member 
* Nuttapatprom  Chongamorkulprapa	5810546650
* Rakkan		    Jintasatien		    5810546722
* Thirasan		  Chatwongwan		    5810545017
* Supawit		    Supparat		      5810545483
* Thanawat		  Saelee			      5810545904
* Narongsak		  bbb		        5810545858
* Patipol			  Wangiop		    5810545432
* chick			  chick		    6423526

## Rules
```prolog
Scenario: Normal Case
		# X = address_id, Y = vehicle, F = food, D = doctor
		# User input X

rescue(X,Y,F,D,P):- (third_priority_rescue(X,Y,F,D),P=third_priority)
                  	 ;(second_priority_rescue(X,Y,F,D),P=second_priority)
                  	 ;(first_priority_rescue(X,Y,F,D), P=first_priority).

-first_priority_rescue(X,Y,F,D):- (located(X,Z), water_area(Z,A), (A=3))->  
                                (live_at(B,X), is_a(B,C), (C=baby;C=pregnant;C=elder))-> 
                                (vehicle_rescue(X,Y);food_rescue(X,F);doctor_rescue(X,F)).

-second_priority_rescue(X,Y,F,D):- not(first_priority_rescue(X,Y,F,D))->
                                  (((located(X,Z),water_area(Z,A),(A=3))-> 
                                  (live_at(B,X),is_a(B,C), C=general)->(vehicle_rescue(X,Y); 
                                  food_rescue(X,F);doctor_rescue(X,D)));((located(X,Z), 
                                  water_area(Z,A),(A=2))->(live_at(B,X),is_a(B,C), 
                                  (C=baby;C=pregnant;C=elder))->
                                  (vehicle_rescue(X,Y);food_rescue(X,F); 
                                  doctor_rescue(X,D)))).
                                  
-third_priority_rescue(X,Y,F,D):- not(second_priority_rescue(X,Y,F,D))
                                   ->(((located(X,Z), water_area(Z,A), (A=2))
                                   -> (live_at(B,X), is_a(B,C), C=general)
                                   ->(vehicle_rescue(X,Y);food_rescue(X,F); doctor_rescue(X,D)))
                                   ;((located(X,Z), water_area(Z,A), live_at(B,X), (A=1))
                                   ->(vehicle_rescue(X,Y);food_rescue(X,F); doctor_rescue(X,D)))).

Scenario: Special Case
		# X = address_id, 
      Y = Object that use for help that victim immediately, 
      Z = doctor
		# User input X
	
-press_food_button(X,Y) :- food_rescue(X,Y).
-press_drug_button(X,Y) :- live_at(Z,X), suffer_from(Z,A), drug(A,Y).
-press_emergency_button(X,Y,Z) :- vehicle_rescue(X,Y), doctor_rescue(X,Z).
		
	Common resource:

-vehicle_rescue(X,Y):- located(X,A),water_area(A,Z),vehicle(Z,Y).
-food_rescue(X,Y):- live_at(Z,X),is_a(Z,A), food(A,Y).
-doctor_rescue(X,Y):- live_at(Z,X),suffer_from(Z,I),is_record_by(I, Y).
```
## Example
```prolog
address 1
When we want to rescue address 1
?- rescue(add_1,Y,F,D,P).
Y = car,
P = third_priority
F = food_general,
P = third_priority
F = food_general,
D = doc_5,
P = third_priority
D = doc_2,
P = third_priority

Output: vehicle(car), priority(third_priority), food type(food_general), doc type{(doc_5), (doc_2)}

address 2
When we want to rescue address 2
?- rescue(add_2,Y,F,D,P).
Y = helicopter,
P = first_priority
F = food_baby,
P = first_priority
F = food_general,
P = first_priority
F = food_elder,
P = first_priority
F = food_general,
P = first_priority
F = doc_0,
P = first_priority
F = doc_3,
P = first_priority
F = doc_5,
P = first_priority
F = doc_0,
P = first_priority

Output: vehicle(helicopter, priority(first_priority), food type{(food_baby), (food_general), (food_elder)}, doc type
	{(doc_0), (doc_3), (doc_5)}
PS: doc_0 => not send any doctor

address 3
When we want to rescue address 3
?- rescue(add_3,Y,F,D,P).
Y = car,
P = third_priority
F = food_baby,
P = third_priority
F = food_pregnant,
P = third_priority
D = doc_0,
P = third_priority
D = doc_0,
P = third_priority

Output: vehicle(car), priority(third_priority), food type{(food_baby), (food_pregnant)}, doc type(doc_0)
PS: doc_0 => not send any doctor
```
