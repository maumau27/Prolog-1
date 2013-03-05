% Medical Diagnosis Expert System

symptom(flu,fever).
symptom(flu,tiredness).
symptom(flu,headache).

symptom(stress,headache).
symptom(stress,appetite_loss).
symptom(stress,irritability).

symptom(depression,tiredness).
symptom(depression,crying).

symptom(food_poisoning,cramps).
symptom(food_poisoning,vomit).

symptom(indigestion,stomach_pain).
symptom(indigestion,acid_reflux).

symptom(dehydration,dizziness).
symptom(dehydration,drymouth).

suppresses(valium,crying).
suppresses(valium,irritability).
suppresses(water,drymouth).
suppresses(caffeine,tiredness).
suppresses(antispintromin,dizziness).
suppresses(aspirin,fever).
suppresses(ibuprophen,fever).
suppresses(rennies,stomach_pain). /*indigestion tablets*/
suppresses(tums,acid_reflux).
suppresses(lomotil, vomit).
suppresses(acetominephin,headache).
suppresses(acetominephin,fever).

alleviates(Drug,Disease):- symptom(Disease,Sign),suppresses(Drug,Sign).

should_take(Person,Drug):-has_disease(Person,Disease),alleviates(Drug,Disease).

has_disease(fred,flu).
has_disease(fred,alcoholism).
has_disease(freda,flu).
has_disease(jim,stress).

