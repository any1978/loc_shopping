module ShopsHelper
  def choose_new_or_edit
    if action_name == 'new'
      confirm_shops_path
    elsif action_name == 'edit'
      shop_path
    end
  end
end
