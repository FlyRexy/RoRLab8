# frozen_string_literal: true

# Home controller
class HomeController < ApplicationController
  before_action :check_input, only: :about
  before_action :init, only: :about
  def index; end

  def about
    orig_array = params[:arr]
    n = params[:num].to_i
    if orig_array.nil? || n.nil?
      orig_array = '1 4 9 2 1'
      n = 5
    end
    p n
    @result_arr, @max_i = solve(orig_array)
    redirect_to root_path, notice: 'Количество отрезков равно нулю' if @result_arr.compact.length.zero?
  end

  def solve(arr)
    arr = arr.split.map(&:to_i)
    i = 0
    arr.each do |el|
      @temp_count, i = sqrt(el, i)
      if @temp_count > @max_count
        @max_count = @temp_count
        @max_i = i
      end
    end
    [@result_arr, @max_i]
  end

  def sqrt(elem, ind)
    if Math.sqrt(elem).to_s.match(/^\d*.0$/)
      @result_arr[ind] = if @temp_count.zero?
                           elem.to_s
                         else
                           "#{@result_arr[ind]} #{elem}"
                         end
      [@temp_count + 1, ind]
    else
      [0, ind + 1]
    end
  end

  def init
    @result_arr = []
    @max_i = 0
    @temp_count = 0
    @max_count = 0
  end

  private

  def check_input
    a = params[:arr]
    n = params[:num].to_i
    if a.nil? || n.nil?
      a = '1 4 9 2 1'
      n = 5
    end
    redirect_to root_path, alert: 'Заданное количество элементов не совпадает с реальным' if n != a.split.length
    return if a.match(/^\s*(\d+\s*)*$/)

    redirect_to root_path, alert: 'Неправильный ввод'
  end
end
