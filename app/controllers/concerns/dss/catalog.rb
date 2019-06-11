module Dss
  module Catalog
    extend ActiveSupport::Concern

    def studylink
      redirect_to "/studynum/#{params[:studyno]}"
    end

    def validate_email_params
      if current_user.nil?
        flash[:error] = 'You must be logged in to send an email.'
      elsif params[:to].blank?
        flash[:error] = I18n.t('blacklight.email.errors.to.blank')
      elsif !params[:to].match(Blacklight::Engine.config.email_regexp)
        flash[:error] = I18n.t('blacklight.email.errors.to.invalid', to: params[:to])
      end
      flash[:error].blank?
    end


  end
end
