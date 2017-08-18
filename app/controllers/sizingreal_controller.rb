class SizingrealController < ApplicationController
  def main
  end

  def input
  end

  def result
    @hash_jean_size = Hash.new
    @hash_jean_size = {
    "length" => params[:result_length],
    "waist" => params[:result_waist],
    "thigh" => params[:result_thigh],
    "rise" => params[:result_rise],
    "tail" => params[:result_tail]}
        
    @hash_jean_size2 = Hash.new
    @hash_jean_size2 = {
    "length2" => params[:result_length2],
    "waist2" => params[:result_waist2],
    "thigh2" => params[:result_thigh2],
    "rise2" => params[:result_rise2],
    "tail2" => params[:result_tail2]}

    @hash_first_size = Hash.new
    @hash_first_size = {
      "first_size" => params[:first_size]
    }
    
    @hash_second_size = Hash.new
    @hash_second_size = {
      "second_size" => params[:second_size]
    }

    @hash_my_size = Hash.new
    @hash_my_size = {"m_length" => params[:m_length],
    "m_waist" => params[:m_waist],
    "m_thigh" => params[:m_thigh],
    "m_rise" => params[:m_rise],
    "m_tail" => params[:m_tail]}

    if (@hash_jean_size["length"]).to_f == 0
      @diff_length = 1.0
    else
      @diff_length = (@hash_jean_size["length"]).to_f / (@hash_my_size["m_length"]).to_f
    end
    
    if (@hash_jean_size["waist"]).to_f == 0
      @diff_waist = 1.0
    else
      @diff_waist = (@hash_jean_size["waist"]).to_f / (@hash_my_size["m_waist"]).to_f
    end
    
    if (@hash_jean_size["thigh"]).to_f == 0
      @diff_thigh = 1.0
    else
      @diff_thigh = (@hash_jean_size["thigh"]).to_f / (@hash_my_size["m_thigh"]).to_f
    end
    
    if (@hash_jean_size["rise"]).to_f == 0
      @diff_rise = 1.0
    else
      @diff_rise = (@hash_jean_size["rise"]).to_f / (@hash_my_size["m_rise"]).to_f
    end
    
    if (@hash_jean_size["tail"]).to_f == 0
      @diff_tail = 1.0
    else
      @diff_tail = (@hash_jean_size["tail"]).to_f / (@hash_my_size["m_tail"]).to_f
    end
  
  
    if (@hash_jean_size2["length2"]).to_f == 0
      @diff_length2 = 1.0
    else
      @diff_length2 = (@hash_jean_size2["length2"]).to_f / (@hash_my_size["m_length"]).to_f
    end
    
    if (@hash_jean_size2["waist2"]).to_f == 0
      @diff_waist2 = 1.0
    else
      @diff_waist2 = (@hash_jean_size2["waist2"]).to_f / (@hash_my_size["m_waist"]).to_f
    end
    
    if (@hash_jean_size2["thigh2"]).to_f == 0
      @diff_thigh2 = 1.0
    else
      @diff_thigh2 = (@hash_jean_size2["thigh2"]).to_f / (@hash_my_size["m_thigh"]).to_f
    end
    
    if (@hash_jean_size2["rise2"]).to_f == 0
      @diff_rise2 = 1.0
    else
      @diff_rise2 = (@hash_jean_size2["rise2"]).to_f / (@hash_my_size["m_rise"]).to_f
    end
    
    if (@hash_jean_size2["tail2"]).to_f == 0
      @diff_tail2 = 1.0
    else
      @diff_tail2 = (@hash_jean_size2["tail2"]).to_f / (@hash_my_size["m_tail"]).to_f
    end

    @minus_waist1 = ((@hash_jean_size["waist"]).to_f - (@hash_my_size["m_waist"]).to_f) * 3.0
    @minus_waist2 = ((@hash_jean_size2["waist2"]).to_f - (@hash_my_size["m_waist"]).to_f) * 3.0
  
    @minus_tail1 = ((@hash_jean_size["tail"]).to_f - (@hash_my_size["m_tail"]).to_f) * 5.5
    @minus_tail2 = ((@hash_jean_size2["tail2"]).to_f - (@hash_my_size["m_tail"]).to_f) * 5.5
    
    if (106 - @minus_waist1) < (106 - @minus_tail1)
      @jean_ML1 = 106 - @minus_waist1
    else
      @jean_ML1 = 106 - @minus_tail1
    end
    
    if (106 - @minus_waist2) < (106 - @minus_tail2)
      @jean_ML2 = 106 - @minus_waist2
    else
      @jean_ML2 = 106 - @minus_tail2
    end
      
    
    
  end

  def mypage
    @user = User.find(params[:user_id])
  end
  def update
    @user = User.find(params[:user_id])
    @user.length = params[:length]
    @user.waist = params[:waist]
    @user.thigh = params[:thigh]
    @user.rise = params[:rise]
    @user.tail = params[:tail]
    @user.password = params[:changepw]
    @user.save
    redirect_to "/"
  end
end
