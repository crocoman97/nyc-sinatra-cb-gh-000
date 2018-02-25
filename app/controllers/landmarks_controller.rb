class LandmarksController < ApplicationController

  get '/landmarks' do 
    erb :'/landmarks/index'
  end
  
  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end 
  
  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    @landmark.figure = Figure.create(params[:figure_name_2]) unless params[:figure_name_2].empty?
    @landmark.titles << Title.create(params[:title][:name]) unless params[:title][:name].empty?
    @figure.save
    redirect :"/landmarks/#{@landmark.id}"
  end
  
  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/show"
  end
  
  get '/landmarks/:id/edit' do 
    @landmark = Landmark.find(params[:id])
    erb :"/landmarks/edit"
  end
  
  patch '/landmarks/:id' do 
    @landmark = Landmark.update(params[:landmark])
    @landmark.figure = 
    @landmark.figure = Figure.create(params[:figure_name_2]) unless params[:figure_name_2].empty?
    @landmark.titles << Title.create(params[:title][:name]) unless params[:title][:name].empty?
    @figure.save
    redirect :"/landmarks/#{@landmark.id}"
  end


end
