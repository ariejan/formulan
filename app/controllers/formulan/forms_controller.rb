module Formulan
  class FormsController < ::ApplicationController
    # GET /formulan/:identifier
    def new
      @form = Formulan.fetch(params[:identifier])
    end

    # POST /formulan/:identifier
    def create
      @form = Formulan.fetch(params[:identifier])

      if Formulan::Form.create(data: params[:form_definition])
        redirect_to formulan_engine.formulan_thanks_path(identifier: params[:identifier])
      else
        render 'new'
      end
    end

    # GET /formulan/:identifier/thanks
    def thanks
    end
  end
end
