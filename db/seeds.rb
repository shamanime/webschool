# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Iniciando seed...'

puts 'LIMPANDO DATABASE!'
Mongoid.purge!

puts 'CONFIGURANDO USUARIOS:'
user = Coordenador.create!  :nome => 'Jefferson',
                            :email => 'jefferson@shamani.me',
                            :password => 'pa$$word',
                            :password_confirmation => 'pa$$word'
puts 'Novo usuário criado: ' << user.nome

puts 'SEED COMPLETO!'
