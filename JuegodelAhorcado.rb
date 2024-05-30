puts "Hola, vamos a jugar!"

archivo = File.new("Palabras_juego_ahorcado.txt", "w")
archivo.puts(
"ELEFANTE
PLANETA
CUADERNO
PENSAMIENTO
PSICOMAGIA")
archivo.close

arr = File.readlines("Palabras_juego_ahorcado.txt")
indice_aleatorio = rand(arr.size - 1)
arr[indice_aleatorio]

palabra_oculta = arr[indice_aleatorio].chomp.split("")

palabra_oculta.each do
  print "_ "
end

def comparar_imprimir(palabra_oculta, respuesta, letra_errada, letras_acertadas)
  palabra_oculta.each do |letra_palabra|
    if respuesta == letra_palabra 
      letra_errada = false
      letras_acertadas << letra_palabra
    end
    if letras_acertadas.include? letra_palabra
      print letra_palabra
    else
      print caracter
    end
  end

  return letra_errada
end

contador_errores = 0
letras_acertadas = []
while (contador_errores <= 5) && (palabra_oculta.size != letras_acertadas.size)
  puts "Elige una letra para completar la palabra. Te quedan #{ 5 - contador_errores} oportunidades." 
  respuesta = gets.chomp
  letra_errada = true

  letra_errada = comparar_imprimir(palabra_oculta, respuesta, letra_errada, letras_acertadas) 

  puts
  contador_errores += 1 if letra_errada
end

if contador_errores == 6
  puts "Se te acabaron las oportunidades. Intenta de nuevo"
else
  puts "Acertaste, ¡felicitaciones!"
end