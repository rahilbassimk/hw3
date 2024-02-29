class EntriesController < ApplicationController
  
  def show
    @entry = Entry.find_by({"id"=> params["id"]})
    @place = Place.find_by("id" => @contact["place_id"]) 
  end 
   
    def new 
      @place = Place.find_by({"id" => params["place_id"]})
      @entry = Entry.new
    end  
    
    def create 
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["posted_on"] = params["posted_on"]
    #@place = Place.find_by("name" => params["name"])
    @entry["place_id"] = params["place_id"]

    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
    end 
end 