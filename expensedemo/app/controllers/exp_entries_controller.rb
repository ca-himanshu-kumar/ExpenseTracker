class ExpEntriesController < ApplicationController
  before_action :set_exp_entry, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!, except[]
  before_action :authenticate_user!

  # GET /exp_entries or /exp_entries.json
  def index
    if current_user != nil
      if current_user.email == "hkpin2@gmail.com"
        @exp_entries = ExpEntry.all
      else
        @exp_entries = current_user.exp_entries
      end
    end
  end

  # GET /exp_entries/1 or /exp_entries/1.json
  def show
  end

  # GET /exp_entries/new
  def new
    @exp_entry = ExpEntry.new
  end

  # GET /exp_entries/1/edit
  def edit
  end

  # POST /exp_entries or /exp_entries.json
  def create
    @exp_entry = ExpEntry.new(exp_entry_params)

    respond_to do |format|
      if @exp_entry.save
        # PostMailer.approved(current_user.email).deliver_later
        format.html { redirect_to exp_entry_url(@exp_entry), notice: "Exp entry was successfully created." }
        format.json { render :show, status: :created, location: @exp_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exp_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exp_entries/1 or /exp_entries/1.json
  def update
    respond_to do |format|
      if @exp_entry.update(exp_entry_params)
        PostMailer.approved(current_user.email).deliver
        format.html { redirect_to exp_entry_url(@exp_entry), notice: "Exp entry was successfully updated." }
        format.json { render :show, status: :ok, location: @exp_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exp_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exp_entries/1 or /exp_entries/1.json
  def destroy
    @exp_entry.destroy

    respond_to do |format|
      format.html { redirect_to exp_entries_url, notice: "Exp entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exp_entry
      @exp_entry = ExpEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exp_entry_params
      params.require(:exp_entry).permit(:title, :group, :billNo, :amount, :BillDate, :user_id)
    end
end
