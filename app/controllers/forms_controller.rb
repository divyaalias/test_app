class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy, :preview, :create_answer]

  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
  end

  # GET /forms/new
  def new
    @form = Form.new
    @form.questionnaires.build
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(form_params)

    respond_to do |format|
      if @form.save
        format.html { redirect_to preview_forms_path(id: @form.id), notice: 'Form was successfully created.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Form was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def preview
    @form = Form.find(params[:id])
  end

  def create_answer
    if params["answers"]
      ans = @form.answers.push(params["answers"].to_unsafe_h)
      @form.update(answers: ans)
      redirect_to forms_path, notice: 'Form was successfully updated.' 
    else
      redirect_to preview_forms_path(id: params[:id])
    end
  end

  def send_form
    #UserNotificationMailer.user_order_received_with_phone(order, @term, params['x_recurring_billing_amount']).deliver_now
    @form = Form.find(params["format"])
    ApplicationMailer.share_form(params["format"], params["user"]["user_email"]).deliver!
    redirect_to preview_forms_path(id: params["format"])
  end

  def dashboard
    if current_user.admin?
      @forms = Form.all
    else
      @forms = Form.where(user_id: current_user.id)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params
      user= current_user.id
      params.require(:form).permit(:user_id, :form_title,:answers, :questionnaires_attributes => [:id, :questions, :field_type])
    end
end
