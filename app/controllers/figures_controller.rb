class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    figure = Figure.create(params[:figure])
    figure.titles.create(params[:title]) if !params[:title][:name].empty?
    figure.landmarks.create(params[:landmark]) if !params[:landmark][:name].empty?
    figure.save
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    figure.titles.create(params[:title]) if !params[:title][:name].empty?
    figure.landmarks.create(params[:landmark]) if !params[:landmark][:name].empty?
    figure.save
    redirect "/figures/#{figure.id}"
  end

end
