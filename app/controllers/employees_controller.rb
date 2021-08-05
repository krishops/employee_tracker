class EmployeesController < ApplicationController

  # def index
  #   @employees = Employee.all
  #   render :index
  # end

  def new
    @division = Division.find(params[:division_id])
    @employee = @division.employees.new
    render :new
  end

  def create
    @division = Division.find(params[:division_id])
    @employee = @division.employees.new(employee_params)
    if @employee.save
      flash[:notice] = "Employee successfully added!"
      redirect_to division_path(@division)
    else
    render :new
    end
  end

  def edit
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
    render :edit
  end

  def show
    @division = Division.find(params[:division_id])
    @employee = Employee.find(params[:id])
    render :show
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to division_path(@employee.division)
    else
      @division = Division.find(params[:division_id])
      render :edit
    end      
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to division_path(@employee.division)
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :role)
    end
end