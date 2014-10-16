class ElectivgroupsController < ApplicationController
  def index
  end

  def new
  	@electivgroup = Electivgroup.new
    @batch = Batch.find(params[:batch_id])
    @electivgroups =@batch.electivgroups.all 
  end

end
