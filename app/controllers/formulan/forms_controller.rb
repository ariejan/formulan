module Formulan
  class FormsController < ::ApplicationController
    # GET /formulan/:identifier
    def new
      @form = Formulan.fetch(params[:identifier])
    end

    # POST /formulan/:identifier
    def create
      @form_def = Formulan.fetch(params[:identifier])

      @form = Formulan::Form.create(data: params[:formulan_form_definition])
      @form.identifier = @form_def.identifier

      if @form.save
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
