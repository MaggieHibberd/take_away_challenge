require 'sms'
class Menu

  def initialize(sms)
    @sms = sms
  end

  MENU = { "1" => ["Okra", "7.00"], "2" => ["Yam Porridge", "7.00"], "3" => ["Akara", "7.00"] }
   
   
  def view_menu
    MENU.each do |key, array|
      puts "#{key} #{array}"
    end
  end 

  def choose_order
    @order = []
    @price = []
      puts "Please enter the menu number for the item's you wish to order"
      puts "....................................."
      puts "Press: 'E' one you have finished"
      puts "....................................."
      loop do
      puts "enter menu number or 'e' for exit"
      input = gets.chomp.downcase
      case input
         when '1'
           @order << "Okra"
           @price << 7.00
         when '2'
           @order << "Yam-Porridge"
           @price << 7.00
         when '3'
           @order << "Akara"
           @price << 7.00
         when 'e'
           break puts "Thank you!"
      end
      puts "....................................."
      puts @order
      puts "#{@price.sum}" + "0"
      puts "....................................."
    end
  end

  def view_order
    puts " "
    puts "Here is what is in your basket"
    puts "....................................."
    puts @order
    puts "....................................."

    puts "Here is your order total"
    puts "#{@price.sum}" + "0"
    puts "....................................."
    loop do
      puts "Press 'Y' if you wish to go ahead with your order or 'N' if you wish to start again" 
      puts "....................................."
      order_confirm = gets.chomp.downcase
      case order_confirm
        when 'y'
        @sms.send 
        break puts "Thank you for your order," + "#{@price.sum}" + "0" + " will be charged to your account and a confirmation text shortly"
        when 'n'
        @order.clear
        view_menu
        break puts "Please start your order again"
        
      end
      end

  end


end
