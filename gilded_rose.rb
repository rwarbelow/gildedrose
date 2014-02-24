BRIE = 'Aged Brie'
BACKSTAGE_PASS = 'Backstage passes to a TAFKAL80ETC concert'
SULFURAS = 'Sulfuras, Hand of Ragnaros'

def update_quality(items)
  items.each do |item|
    case item.name
    when BRIE
      update_item_quality(item, 1)
    when BACKSTAGE_PASS
      update_item_quality(item, 1)
      if item.sell_in < 11
        update_item_quality(item, 1)
      end
      if item.sell_in < 6
        update_item_quality(item, 1)
      end
    else
      update_item_quality(item, -1)
    end
    decrease_item_sell_in_date(item)
    update_quality_for_expired_item(item)
  end
end

def update_quality_for_expired_item(item)
  if expired?(item)
    if item.name == BRIE
      update_item_quality(item, 1)
    elsif item.name == BACKSTAGE_PASS
      update_item_quality(item, -item.quality)
    else
      update_item_quality(item, -1)
    end
  end
end

def update_item_quality(item, change_by)
  if item.quality > 0 && item.quality < 50
    item.quality += change_by
  end
end

def decrease_item_sell_in_date(item)
  if item.name != SULFURAS
    item.sell_in -= 1
  end
end

def expired?(item)
  item.sell_in < 0 
end


# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
