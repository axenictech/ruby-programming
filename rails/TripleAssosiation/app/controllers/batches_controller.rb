class BatchesController < ApplicationController
  def index
  end
  def createbatch
  end
  def savebatch
  	Batch.create(getbatch)
  end

	def addnormalsubject
	@batches=Batch.all
	end
 	def savenormalsubject
 		@batch=Batch.find(getsubjectdetails["batch_id"])
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
