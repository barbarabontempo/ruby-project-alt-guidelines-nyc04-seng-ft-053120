require_relative '../config/environment'

interface = Interface.new()
user_instance = interface.choose_login_or_register
interface.user = user_instance
interface.main_menu

puts "hello world"