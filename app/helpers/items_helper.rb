module ItemsHelper
  def choose_new_or_edit2
    if action_name == 'new'
      confirm_shop_items_path(shop_id: @shop.id)
    elsif action_name == 'edit'
      shop_item_path
    end
  end  
end