class FruitsController < ApplicationController
	


	def welcome
		@fruit=Fruit.new

	end

	def start

	end

	def fruit_save
		@fruit=Fruit.create(data_save)
		@fruits=Fruit.all
    end

    def fruit_edit
    	@fruit=Fruit.find(params[:format])
    end

    def fruit_update
    	@fruit=Fruit.find (params[:id])
          @fruit.update(data_save)
         @fruits=Fruit.all
    end

    def fruit_delete
    	@fruit=Fruit.find(params[:format])
    	@fruit.destroy
    	@fruits=Fruit.all


    end

 	private
 	def data_save
 		params.require(:fruit).permit!

 	end
end
