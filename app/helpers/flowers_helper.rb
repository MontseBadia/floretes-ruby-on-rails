module FlowersHelper


  def flower_id_correct?(id)
    Flower.find(id)   
  end


end
