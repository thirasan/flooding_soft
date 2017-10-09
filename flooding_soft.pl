location(loc_1).
location(loc_2).
location(loc_3).
location(loc_4).
location(loc_5).
location(loc_6).
location(loc_7).
location(loc_8).
location(loc_9).
located(add_1,loc_4).
located(add_2,loc_3).
located(add_3,loc_2).
located(add_4,loc_1).
located(add_5,loc_9).
located(add_6,loc_8).
located(add_7,loc_7).
located(add_8,loc_6).
located(add_9,loc_5).
water_area(loc_2,1).
water_area(loc_4,1).
water_area(loc_1,2).
water_area(loc_3,3).
water_area(loc_5,3).
water_area(loc_6,2).
water_area(loc_7,0).
water_area(loc_8,0).
water_area(loc_9,0).
vehicle(1,car).
vehicle(2,boat).
vehicle(3,helicopter).
food(baby,food_baby).
food(general,food_general).
food(pregnant,food_pregnant).
food(elder,food_elder).
disease(acute_diarrhea).
disease(heart_disease).
disease(dengue_fever).
disease(leptospirosis).
disease(tuderculosis).
is_record_by(acute_diarrhea,doc_4).
is_record_by(tuderculosis,doc_3).
is_record_by(heart_disease,doc_5).
is_record_by(dergue_fever,doc_2).
is_record_by(none,doc_0).
doctor(doc_0).
doctor(doc_1).
doctor(doc_2).
doctor(doc_3).
doctor(doc_4).
doctor(doc_5).
name_of_doctor(doc_0, none).
name_of_doctor(doc_1, keetawat_srichompoo).
name_of_doctor(doc_2, miracle_dota).
name_of_doctor(doc_3, kuroky_liquid).
name_of_doctor(doc_4, midone_secret).
name_of_doctor(doc_5, ana_sport).
address_of_doctor(doc_1, khonkean).
address_of_doctor(doc_2, bangkok).
address_of_doctor(doc_3, bangkok).
address_of_doctor(doc_4, bangkok).
address_of_doctor(doc_5, bangkok).
contact_of_doctor(doc_1, +66986421545).
contact_of_doctor(doc_2, +66871121345).
contact_of_doctor(doc_3, +66953284695).
contact_of_doctor(doc_4, +66955412355).
contact_of_doctor(doc_5, +66935664852).
address(add_1).
address(add_2).
address(add_3).
address(add_4).
address(add_5).
address(add_6).
address(add_7).
address(add_8).
address(add_9).
victim(vic_1).
victim(vic_2).
victim(vic_3).
victim(vic_4).
victim(vic_5).
victim(vic_6).
victim(vic_7).
victim(vic_8).
victim(vic_9).
victim(vic_10).
victim(vic_11).
victim(vic_12).
victim(vic_13).
victim(vic_14).
victim(vic_15).
victim(vic_16).
victim(vic_17).
live_at(vic_2, add_3).
live_at(vic_1, add_2).
live_at(vic_3, add_1).
live_at(vic_4, add_2).
live_at(vic_5, add_2).
live_at(vic_6, add_3).
live_at(vic_7, add_1).
live_at(vic_8, add_2).
live_at(vic_9, add_4).
live_at(vic_10, add_5).
live_at(vic_19, add_5).
live_at(vic_20, add_5).
live_at(vic_11, add_6).
live_at(vic_18, add_6).
live_at(vic_12, add_7).
live_at(vic_13, add_8).
live_at(vic_14, add_9).
live_at(vic_15, add_8).
live_at(vic_16, add_8).
live_at(vic_17, add_8).
is_a(vic_1, baby).
is_a(vic_2, baby).
is_a(vic_3, general).
is_a(vic_4, general).
is_a(vic_5, elder).
is_a(vic_6, pregnant).
is_a(vic_7, general).
is_a(vic_8, general).
is_a(vic_9, general).
is_a(vic_10, general).
is_a(vic_11, general).
is_a(vic_12, general).
is_a(vic_13, general).
is_a(vic_14, general).
is_a(vic_14, general).
is_a(vic_15, general).
is_a(vic_16, elder).
is_a(vic_17, baby).
is_a(vic_18, elder).
is_a(vic_19, general).
is_a(vic_20, baby).
suffer_from(vic_1,none).
suffer_from(vic_2,none).
suffer_from(vic_5,heart_disease).
suffer_from(vic_6,none).
suffer_from(vic_8,none).
suffer_from(vic_3,heart_disease).
suffer_from(vic_4,tuderculosis).
suffer_from(vic_7,dergue_fever).
suffer_from(vic_9,none).
suffer_from(vic_10,none).
suffer_from(vic_11,none).
suffer_from(vic_12,none).
suffer_from(vic_13,none).
suffer_from(vic_14,none).
suffer_from(vic_15,none).
suffer_from(vic_16,none).
suffer_from(vic_17,none).
suffer_from(vic_18,heart_disease).
suffer_from(vic_19,none).
suffer_from(vic_20,none).
drug(heart_disease, drug_heart).
drug(tuderculosis, drug_tuderculosis).
drug(leptospirosis, drug_leptospirosis).
drug(dergue_fever, drug_dergue_fever).
drug(acute_diarrhea, drug_acute_diarrhea).

rescue(X,Y,F,D,P):- (third_priority_rescue(X,Y,F,D),P=third_priority)
                    ;(second_priority_rescue(X,Y,F,D),P=second_priority)
                    ;(first_priority_rescue(X,Y,F,D), P=first_priority).

first_priority_rescue(X,Y,F,D):- (located(X,Z), water_area(Z,A), (A=3))-> (live_at(B,X), is_a(B,C), (C=baby;C=pregnant;C=elder))-> (vehicle_rescue(X,Y);food_rescue(X,F);doctor_rescue(X,F)).

second_priority_rescue(X,Y,F,D):- not(first_priority_rescue(X,Y,F,D))->(((located(X,Z),water_area(Z,A),(A=3))-> (live_at(B,X),is_a(B,C), C=general)->(vehicle_rescue(X,Y); food_rescue(X,F);doctor_rescue(X,D)));((located(X,Z), water_area(Z,A),(A=2))->(live_at(B,X),is_a(B,C), (C=baby;C=pregnant;C=elder))->(vehicle_rescue(X,Y);food_rescue(X,F); doctor_rescue(X,D)))).

third_priority_rescue(X,Y,F,D):- not(second_priority_rescue(X,Y,F,D))
                                    ->(((located(X,Z), water_area(Z,A), (A=2))
                                    -> (live_at(B,X), is_a(B,C), C=general)
                                    ->(vehicle_rescue(X,Y);food_rescue(X,F); doctor_rescue(X,D)))
                                    ;((located(X,Z), water_area(Z,A), live_at(B,X), (A=1))
                                    ->(vehicle_rescue(X,Y);food_rescue(X,F); doctor_rescue(X,D)))).


press_food_button(X,Y) :- food_rescue(X,Y).
press_drug_button(X,Y) :- live_at(Z,X), suffer_from(Z,A), drug(A,Y).
press_emergency_button(X,Y,Z) :- vehicle_rescue(X,Y), doctor_rescue(X,Z).


vehicle_rescue(X,Y):- located(X,A),water_area(A,Z),vehicle(Z,Y).
food_rescue(X,Y):- live_at(Z,X),is_a(Z,A), food(A,Y).
doctor_rescue(X,Y):- live_at(Z,X),suffer_from(Z,I),is_record_by(I, Y).
