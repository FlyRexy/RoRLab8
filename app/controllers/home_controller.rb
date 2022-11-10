class HomeController < ApplicationController
  def index
  end

  def about
    a = params[:arr]
    n = params[:num].to_i
    if a.nil? || n.nil?
      a = '1 4 9 2 1'
      n = 5
    end
    if !(a.match(/^\s*(\d+\s*)*$/) and n == a.split.length)
      redirect_to root_path, alert: "Неправильный ввод"
    end
    @result_arr, @max_i = HomeController.solve(a)
    redirect_to root_path, notice: "Количество отрезков равно нулю" if @result_arr.compact.length.zero?
  end
  def self.solve(a)
    @result_arr = Array.new
    @max_i = 0
    a = a.split.map(&:to_i)
    temp_count = 0
    max_count = 0
    i = 0
    a.each do |el|
      if Math.sqrt(el).to_s.match(/^\d*.0$/)
        if temp_count == 0
          @result_arr[i] = el.to_s
        else
          @result_arr[i] = @result_arr[i].to_s + ' ' + el.to_s
        end
        temp_count += 1
      else
        temp_count = 0
        i += 1
      end
      if temp_count > max_count
        max_count = temp_count
        @max_i = i
      end
    end
    return @result_arr, @max_i
  end
end

