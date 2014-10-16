class BatchesController < ApplicationController
  def index
  end
  def createbatch
  end
  def savebatch
  	Batch.create(getbatch)
  end

	def addnormalsubject
	 @batch=Batch.find(params["format"])
	end
 	def savenormalsubject
     @batch=Batch.find(params['format'])
 		@batch.subjects.create(getsubject)
 	end
    def addelectivesubject
    end
    def saveelectivesubject
  	end 

  	 def createelectivegroup
    end
    def saveelectivegroup
    	@batch=Batch.find(getgroupall["batch_id"])
    	@batch.electivegroups.create(getgroup)
  	end
  	def dashboard

  	end
  	def getsubjects
  		#code to aaccess subject for perticular batch
  		@batch=Batch.find(params['batch_id'])
  		p "----------------------------------------------------------------"
  		p params['batch_id']
  		p "----------------------------------------------------------------"
  	end
    def getelectedsubjects
      #code to aaccess subject for perticular batch
      @batch=Batch.find(params['batch_id'])
      p "----------------------------------------------------------------"
      p params['batch_id']
      p "----------------------------------------------------------------"
    end


  private
  def getbatch
  	params.require(:batch).permit!
  end

  def getsubject
  	params.require(:subject).permit(:name,:code)
  end
  def getsubjectdetails
  	params.require(:subject).permit!
  end

 def getgroup
  	params.require(:electivegorup).permit(:name,:code)
  end
  
  def getgroupall
  	params.require(:electivegorup).permit!
  end
end
