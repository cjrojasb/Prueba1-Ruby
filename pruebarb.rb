def curso(archivo)
  file = File.open(archivo, "r")
  contenido = file.readlines
  file.close
  opcion = 0

  def alum_aprobado(nota)
    file = File.open("curso.csv", "r")
    contenido = file.readlines
    file.close
    puts "Listado de situación final de alumnos"
    puts "\n"
    contenido.each do |values|
      arr = values.split(", ")
      nombres = arr[0]
      prom = arr[1].to_f + arr[2].to_f + arr[3].to_f + arr[4].to_f + arr[5].to_f
      promfinal = prom / 5.0
      if promfinal < nota
        puts "#{nombres} reprobó con el promedio #{promfinal}"
      else
        puts "#{nombres} aprobó con el promedio #{promfinal}"
      end
    end
  end

  while opcion != 4
  puts "\n"
  puts "Menú"
  puts "\n"
  puts "Ingrese una de las siguientes opciones:
  1) Generar archivo con los alumnos y su respectivo promedio de notas
  2) Ver total de inasistencias
  3) Ver alumnos que aprobaron
  4) Salir"

  opcion = gets.chomp.to_i

    case opcion
      when 1
        contenido.each do |values|
         arr = values.split(", ")
         nombres = arr[0]
         prom = arr[1].to_f + arr[2].to_f + arr[3].to_f + arr[4].to_f + arr[5].to_f
         promfinal = prom / 5.0
         newfile = File.open("prom_alumnos.txt", "a") { |add|
          add.puts "El promedio de #{nombres} es #{promfinal}"
          file.close
        } 
      end

      puts "\n"
      puts "Archivo creado exitosamente (Ver en carpeta)"
      puts "\n"

      when 2
      ina = 0
      contenido.each do |values|
        arr = values.split(", ")
        arr.each do |i|
          if i.chomp == "A"
            ina += 1
          end
        end     
      end

      if ina != 0
        puts "\n"
        puts "Las inasistencias del curso en total son #{ina}"
      else
        puts "\n"
        puts "No existen inasistencias en el curso"
      end

      when 3
      puts "Ingrese nota minima de aprobación (Nota minima por defecto 5.0)"
      nota_min = gets.chomp.to_f  
        if nota_min == 0
          alum_aprobado(5)
        elsif nota_min != 0
          alum_aprobado(nota_min)
        end
      
      if opcion > 4
        puts "\n"
        puts "La opción ingresada no es valida, intente nuevamente"
        puts "\n"
      end
      
    end
  end
end

curso("curso.csv")


