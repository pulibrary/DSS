module Dss
  module Catalog
    extend ActiveSupport::Concern

    def studylink
      redirect_to "/studynum/#{params[:studyno]}"
    end

  end
end
