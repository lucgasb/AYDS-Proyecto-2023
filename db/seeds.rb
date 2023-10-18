# Seed data for questions and answers
Option.destroy_all
Question.destroy_all
User.destroy_all
Practice.destroy_all

theme_sign = 1
#theme_vel = 
theme_def = 2
theme_prior = 3

question1 = Question.create(question: "¿Qué significa esta señal?", theme: theme_sign)
question1.image_url = '/images/preg1.jpg'
question1.save
Option.create(option: "Cementerio.", option2: "Incorporacion de caminos.", correct: "Cruce de caminos.", question: question1)

question2 = Question.create(question: "¿Qué significa esta señal?", theme: theme_sign)
question2.image_url = '/images/cruce.jpg'
question2.save
Option.create(option: "Cruce de caminos.",  option2: "Proximidad de cementerio.", correct: "Cruce ferroviario.", question: question2)

question3 = Question.create(question: "¿A qué se denomina incidente de tránsito o incidente vial?", image_url: nil, theme: theme_def)
question3.save
Option.create(option: "Hecho, evitable o no, que involucra daños a terceros.", option2: "Hecho impredecible e inevitable en ocasión de circulación en la vía pública.", correct: "Hecho que puede ser evitado, en el cual se produce daño a persona o cosa, en ocasión de circulación en la vía pública.", question: question3)

question4 = Question.create(question: "En esta intersección, ¿quién tiene prioridad de paso?", theme: theme_prior)
question4.image_url = '/images/interseccion.png'
question4.save
Option.create(option: "Es indistinto.", option2: "El conductor.", correct: "El peatón.", question: question4)

question5 = Question.create(question: "Cuando no hay demarcación de la senda peatonal, ¿por dónde deben cruzar los peatones?", theme: theme_def)
question5.save
Option.create(option: "Es indistinto, siempre que miren a ambos lados antes de hacerlo.", option2: "En coincidencia con las paradas de transporte.", correct: "Por la esquina, por la prolongación longitudinal de la vereda sobre la calle.", question: question5)

question6 = Question.create(question: "¿Qué significa esta señal?", theme: theme_sign)
question6.image_url = '/images/tren.jpg'
question6.save
Option.create(option: "Circulación exclusiva (ferrocarril).", option2: "Estación ferroviaria.", correct: "Cruce ferroviario.", question: question6)

question7 = Question.create(question: "¿A qué se denomina “tiempo de reacción”?", theme: theme_def)
question7.save
Option.create(option: " Al tiempo que pasa desde que se empieza una maniobra hasta que se termina.", option2: "Al tiempo que pasa desde que se enciende el vehículo hasta que se empieza a circular.", correct: "Al tiempo que pasa desde que se advierte una situación de riesgo hasta que se toma una decisión.", question: question7)

question8 = Question.create(question: "Clasifique esta señal", theme: theme_sign)
question8.image_url = '/images/cedapaso-300x251.jpg'
question8.save
Option.create(option: "Informativa.", option2: "Preventiva.", correct: "Reglamentaria.", question: question8)

question9 = Question.create(question: "¿Qué significa esta señal?", theme: theme_sign)
question9.image_url = '/images/estrechamiento.jpg'
question9.save
Option.create(option: "Estrechamiento (en una mano).",  option2: "Calzada dividida.", correct: "Estrechamiento (en las dos manos).", question: question9)

question10 = Question.create(question: "En una rotonda tiene prioridad…", theme: theme_prior)
question10.save
Option.create(option: "El que accede por la derecha.", option2: "El que ingresa a la rotonda.", correct: "El que circula por la rotonda por sobre el que ingresa.", question: question10)

question11 = Question.create(question: "¿Qué significa esta Señal?", theme: theme_sign)
question11.image_url = '/images/contramano-300x251.jpg'
question11.save
Option.create(option: "Puesto de control.", option2: " Detener la circulación. Parar.", correct: "Contramano.", question: question11)

question12 = Question.create(question: "El cinturón de seguridad es obligatorio para:", theme: theme_def)
question12.save
Option.create(option: "El conductor.", option2: " Los que viajan en asientos delanteros.", correct: " Todos los ocupantes del vehículo.", question: question12)

question13 = Question.create(question: "¿Cuáles son los porcentajes máximos permitidos de alcoholemia para la conducción de un automóvil o camioneta?", theme: theme_def)
question13.save
Option.create(option: "0,2 grs. De alcohol por litro de sangre.", option2: "0,5 grs. De alcohol por litro de sangre.", correct: "0,0 grs. De alcohol por litro de sangre.", question: question13)

question14 = Question.create(question: "¿A qué factor se deben la mayoría de siniestros víales?", theme: theme_def)
question14.save
Option.create(option: "Al vehicular", option2: "Al ambiental", correct: "Al humano", question: question14)

question15 = Question.create(question: "A fin de aumentar la propia seguridad y la de los demás, ¿a qué se debería poner atención durante la circulación?", theme: theme_def)
question15.save
Option.create(option: "Al estado del pavimento y al clima, en especial.", option2: "Ninguna de las opciones.", correct: "A las condiciones en que se encuentran: el automóvil, la infraestructura vial, las condiciones climáticas y el conductor.", question: question15)

question16 = Question.create(question: "“Cada usuario de la vía pública es responsable de una parte del tránsito.” ¿Es correcta ésta premisa?", theme: theme_def)
question16.save
Option.create(option: "No, porque los que tienen responsabilidad son aquellos que conducen cualquier tipo de vehículo.", option2: "No, la responsabilidad la asumen aquellos que obtienen una licencia de conducir.", correct: "Sí, porque se está obligado a no causar peligro ni entorpecer la circulación.", question: question16)

question17 = Question.create(question: "Además de provocar víctimas fatales o lesionados graves, ¿Qué otras consecuencias puede generar un siniestro de tránsito?", theme: theme_def)
question17.save
Option.create(option: "Daños materiales y costos sanitarios.", option2: "Sólo daños materiales.", correct: "Daños materiales, costos sanitarios y administrativos.", question: question17)
