BRIE = 'Aged Brie'
BACKSTAGE_PASS = 'Backstage passes to a TAFKAL80ETC concert'
SULFURAS = 'Sulfuras, Hand of Ragnaros'

def update_quality(items)
  items.each do |item|

    if item.name != BRIE && item.name != BACKSTAGE_PASS
      if item.quality > 0
        if item.name != SULFURAS
          update_item_quality(item, -1)
        end
      end
    else
      if item.quality < 50
        update_item_quality(item, 1)
        if item.name == BACKSTAGE_PASS
          if item.sell_in < 11
            if item.quality < 50
              update_item_quality(item, 1)
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              update_item_quality(item, 1)
            end
          end
        end
      end
    end


    if item.name != SULFURAS
      decrease_item_sell_in_date(item)
    end

    if item.sell_in < 0
      if item.name == BRIE
        update_item_quality(item, 1)
      elsif item.name == BACKSTAGE_PASS
        update_item_quality(item, -item.quality)
      elsif item.name == SULFURAS

      else
        update_item_quality(item, -1)
      end
    end
  end
end

def update_item_quality(item, change_by)
  if item.quality > 0 && item.quality < 50
    item.quality += change_by
  end
end

def decrease_item_sell_in_date(item)
  item.sell_in -= 1
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
