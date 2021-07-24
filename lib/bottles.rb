class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).collect { |i| verse(i) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)
    "#{bottle_number} of beer on the wall, ".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action}, " +
    "#{bottle_number.successor} of beer on the wall.\n"
  end
end

class BottleNumber
  attr_accessor :number

  def self.for(number)
    return number if number.is_a? BottleNumber

    case number
    when 0
      BottleNumber0
    when 1
      BottleNumber1
    else
      BottleNumber
    end.new(number)
  end

  def to_s
    "#{quantity} #{container}"
  end

  def initialize(number)
    @number = number
  end

  def quantity()
    number
  end

  def container()
    "bottles"
  end

  def action()
    "Take #{pronoun} down and pass it around"
  end

  def pronoun()
    "one"
  end

  def successor()
    if number == 0
      BottleNumber.for(99)
    else
      BottleNumber.for(number - 1)
    end
  end
end

class BottleNumber0 < BottleNumber
  def quantity()
    "no more"
  end

  def action()
    "Go to the store and buy some more"
  end
end

class BottleNumber1 < BottleNumber
  def container()
    "bottle"
  end

  def pronoun()
    "it"
  end
end