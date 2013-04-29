class LoansController < ApplicationController
  # GET /loans
  def index
    @loans = Loan.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /loans/1
  def show
    @loan = Loan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /loans/new
  def new
    @loan = Loan.new
    @valid_agents = Contact.referral_partners

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /loans/1/edit
  def edit
    @loan = Loan.find(params[:id])
    @valid_agents = Contact.referral_partners
  end

  # POST /loans
  def create
    @loan = Loan.new(params[:loan])

    respond_to do |format|
      if @loan.save
        format.html { redirect_to @loan, notice: 'Loan was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /loans/1
  def update
    @loan = Loan.find(params[:id])

    respond_to do |format|
      if @loan.update_attributes(params[:loan])
        format.html { redirect_to @loan, notice: 'Loan was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /loans/1
  def destroy
    @loan = Loan.find(params[:id])
    @loan.destroy

    respond_to do |format|
      format.html { redirect_to loans_url }
    end
  end
end
