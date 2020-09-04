

class CategoriesController <ApplicationController

  before_action:require_admin , except:[:index,:show]

  def show

    @category=Category.find(params[:id])
    @articles=@category.articles.paginate(page: params[:page], per_page: 5)

  end

  def edit
    @category=Category.find(params[:id])

  end

  def index

    @categories=Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category=Category.new
  end

  def create

    @category=Category.new(category_params)

    if @category.save

      flash[:notice]="Category created successfully !"
      redirect_to category_path(@category)
    else
      render 'new'
    end


end

def update

  @category=Category.find(params[:id]) #Ne e ruajm objektin category ne menyre qe mund ta kthejm tek forma per ta edituar.Fushat e formes do te mbushen me te dhenat perkatese qe ka @category dhe ne kete menyre ne mund edhe ti editojme ato.

  if @category.update(category_params)

    flash[:notice]="Category updated succesfully !"
    redirect_to @category

  else

    render 'edit'

  end

end

  private

  def category_params

    params.require(:category).permit(:name)

  end

  def require_admin
    if !(logged_in? && current_user.admin)

      flash[:alert]="You don't have permission for this action"
      redirect_to categories_path

    end
  end

end
