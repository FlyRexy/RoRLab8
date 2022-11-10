require_relative 'rails_helper'
require_relative 'spec_helper'

RSpec.describe HomeController, type: :controller do
  context 'when we test our function' do
    it 'should return right values' do
      arr1 = ['1 4 9', '1']
      i = 0
      expect(HomeController.solve('1 4 9 3 1')).to eq [arr1, i]
    end
  end
  describe 'GET index' do
    context 'check index(main) page' do
      it 'has a 200 status code' do
        get :index
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET result' do
    context 'check result(table) page' do
      it 'has a 200 status code' do
        get :about
        expect(response.status).to eq(200)
      end
    end
  end
end

RSpec.describe HomeController, type: :request do
  context 'notice message test' do
    it 'return notice message' do
      get '/home/about?num=3&arr=1&commit=Result'
      expect(flash[:alert]).to eq('Неправильный ввод')
    end
  end
end