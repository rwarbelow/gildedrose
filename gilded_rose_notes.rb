def update_quality(items)
  items.each do |item| # for each of the items in the array
    if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert' # if the item is not aged brie or a backstage pass
      if item.quality > 0 # if the item's quality is greater than 0
        if item.name != 'Sulfuras, Hand of Ragnaros' # if the item is not Sulfuras
          item.quality -= 1 # then decrease the item's quality by 1
        end
      end
    else # for items that are brie or backstage passes
      if item.quality < 50 # if the quality is less than 50
        item.quality += 1 # then increase the quality by 1
        if item.name == 'Backstage passes to a TAFKAL80ETC concert' # if the item is a backstage pass
          if item.sell_in < 11 # and the item needs to be sold in less than 11 days
            if item.quality < 50 # and the quality is less than 50
              item.quality += 1 # then increase the quality by 1
            end
          end
          if item.sell_in < 6 # if the item needs to be sold in less than 6 days
            if item.quality < 50 # and the quality is less than 50
              item.quality += 1 # then increase the quality by 1
            end
          end
        end
      end
    end
    if item.name != 'Sulfuras, Hand of Ragnaros' # if the item is not Sulfuras
      item.sell_in -= 1 # then update the sell_in date 
    end

    if item.sell_in < 0 # if the item is expired
      if item.name != "Aged Brie" # and the item is not brie
        if item.name != 'Backstage passes to a TAFKAL80ETC concert' # and the item is not a backstage pass
          if item.quality > 0 # and the quality is greater than 0
            if item.name != 'Sulfuras, Hand of Ragnaros' # and the item is not Sulfuras
              item.quality -= 1 # then decrease the quality by 1
            end
          end
        else
          item.quality = item.quality - item.quality # otherwise, set item quality to 0 (this only applies to backstage passes)
        end
      else # otherwise (if the item is brie)
        if item.quality < 50 # and the quality is less than 50
          item.quality += 1 # then increase the quality by 1
        end
      end
    end
  end
end
