# Seed data for questions and answers
Option.destroy_all
Question.destroy_all
User.destroy_all

question1 = Question.create(question: "¿Qué significa esta señal?", image_url: 'https://raw.githubusercontent.com/lucgasb/ADYS-Proyecto-2023/main/public/images/preg1.jpg')
question1.save
Option.create(option: "Cementerio.", option2: "Incorporacion de caminos.", correct: "Cruce de caminos.", question: question1)

question2 = Question.create(question: "¿Qué significa esta señal?", image_url: 'https://raw.githubusercontent.com/lucgasb/ADYS-Proyecto-2023/main/images/cruce.jpg')
question2.save
Option.create(option: "Cruce de caminos",  option2: "Proximidad de cementerio.", correct: "Cruce ferroviario.", question: question2)

question3 = Question.create(question: "¿A qué se denomina incidente de tránsito o incidente vial?", image_url: nil)
question3.save
Option.create(option: "Hecho, evitable o no, que involucra daños a terceros.", option2: "Hecho impredecible e inevitable en ocasión de circulación en la vía pública.", correct: "Hecho que puede ser evitado, en el cual se produce daño a persona o cosa, en ocasión
de circulación en la vía pública.", question: question3)

question4 = Question.create(question: "En esta intersección, ¿quién tiene prioridad de paso?")
question4.image_url = nil
question4.save
Option.create(option: "Es indistinto.", option2: "El conductor.", correct: "El peatón.", question: question4)

question5 = Question.create(question: "Cuando no hay demarcación de la senda peatonal, ¿por dónde deben cruzar los peatones?")
question5.image_url = nil
question5.save
Option.create(option: "Es indistinto, siempre que miren a ambos lados antes de hacerlo.", option2: "En coincidencia con las paradas de transporte.", correct: "Por la esquina, por la prolongación longitudinal de la vereda sobre la calle.", question: question5)

question6 = Question.create(question: "¿Qué significa esta señal?")
question6.image_url = '/images/tren.jpg'
question6.save
Option.create(option: "Circulación exclusiva (ferrocarril).", option2: "Estación ferroviaria.", correct: "Cruce ferroviario.", question: question6)

question7 = Question.create(question: "¿A qué se denomina “tiempo de reacción”?")
question7.image_url = nil
question7.save
Option.create(option: " Al tiempo que pasa desde que se empieza una maniobra hasta que se termina.", option2: "Al tiempo que pasa desde que se enciende el vehículo hasta que se empieza a circular.", correct: "Al tiempo que pasa desde que se advierte una situación de riesgo hasta que se toma una decisión.", question: question7)

question8 = Question.create(question: "El factor ambiental es el principal factor de riesgo ya que las colisiones, en su mayoría, se deben a las condiciones meteorológicas o del camino ")
question8.image_url = nil
question8.save
Option.create(option: "Verdadero.", option2: nil, correct: "Falso.", question: question8)

question9 = Question.create(question: "¿Qué significa esta señal?")
question9.image_url = '/images/estrechamiento.jpg'
question9.save
Option.create(option: "Estrechamiento (en una mano).",  option2: "Calzada dividida.", correct: "Estrechamiento (en las dos manos).", question: question9)



puts "Datos de prueba creados correctamente."

