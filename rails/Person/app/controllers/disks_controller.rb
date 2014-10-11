class DisksController < ApplicationController
  def index
  	@person=Disk.new
  end
  def new
  	@person=Disk.new
  end

  def create
	@person=Disk.new(get_params)
	if @person.save
	redirect_to disks_showperson_path
	else
		render 'new'
	end
  end
 def showperson
	@person=Disk.all
 end

def edit
@disk=Disk.find(params[:format])
end
def update
@person=Disk.find(params[:id])
@person.update(get_params)
redirect_to disks_showperson_path
end


    def addaccount
	@disk=Disk.find(params[:id])
	@account=Account.new
	end
	def saveaccount
		# @accountinfo=Account.new(get_params_account)
		@disk=Disk.find(params[:disk_id])
		@account=@disk.create_account(get_params_account)
		redirect_to disks_showperson_path
	end

  private
  def get_params
  	params.require(:disk).permit(:firstName,:lastName,:address,:age,:email,:phone,:bloodgroup,:country,:nationality)
  end

  def get_params_account
  	params.require(:account).permit(:bankname,:accountno,:accounttype)
  end

end
