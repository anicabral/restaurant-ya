require "open-uri"

# Borrando todas las tablas
puts "Borrando datos"
CategoryRestaurant.destroy_all
Category.destroy_all
Restaurant.destroy_all
User.destroy_all
puts "Datos borrados"

# Creando las categorías
puts "Creando categorías"
china = Category.create!(name: "China")
puts china.name
japonesa = Category.create!(name: "Japonesa")
puts japonesa.name
mexicana = Category.create!(name: "Mexicana")
puts mexicana.name
vegana = Category.create!(name: "Vegana")
puts vegana.name
vegetariana = Category.create!(name: "Vegetariana")
puts vegetariana.name
variada = Category.create!(name: "Variada")
puts variada.name
pescados = Category.create!(name: "Pescados")
puts pescados.name
mariscos = Category.create!(name: "Mariscos")
puts mariscos.name
puts "######### Fin creación de categorías ########"
puts ""

# Creando usuarios y sus restaurantes
puts "Creando usuarios y restaurantes"
puts "################################################"

# Creando usuario
user1 = User.new( email: "sofia@gmail.com", password: "123456" )

# agregando foto al usuario
file = URI.open("https://avatars.githubusercontent.com/u/148254339?v=4")
user1.photo.attach(io: file, filename: "ana.png", content_type: "image/png")

# Guardando en tabla users
user1.save!

# Mostrando en pantalla
puts "Usuario #{user1.email} creado. Agregando restaurante "

#Creando restaurante y category
restaurante1 = user1.restaurants.build(
  name: "Arch Daily",
  description: "La mejor comida vegana del caribe",
  address: "Av Providencia 1250, Providencia, Chile",
  avg_rating: 4,
  category_ids: [vegana.id]
)

# Agregando foto al restaurante#
file = URI.open("https://raw.githubusercontent.com/abdulaba/restaurants-images-seed/main/archdaily-vege.jpeg")
restaurante1.photo.attach(io: file, filename: "archdaily.png", content_type: "image/png")
restaurante1.save!

# Mostrando en pantalla
puts "Restaurant #{restaurante1.name} creado con la(s) categoria(s) #{restaurante1.categories.map(&:name).join(" ")}"

#Creando restaurante y category
restaurante2 = user1.restaurants.build(
  name: "Vegano",
  description: "Ven a disfrutar de todos nuestros productos veganos, frescos y de la mejor calidad",
  address: "Av Providencia 1700, Providencia, Chile",
  avg_rating: 5,
  category_ids: [vegana.id]
)

# Agregando foto
file = URI.open("https://raw.githubusercontent.com/abdulaba/restaurants-images-seed/main/vegan.jpeg")
restaurante2.photo.attach(io: file, filename: "vegan.png", content_type: "image/png")

# Guardando en tabla restaurants
restaurante2.save!

# Mostrando en pantalla
puts "Restaurant #{restaurante2.name} creado con la(s) categoria(s) #{restaurante1.categories.map(&:name).join(" ")}"
