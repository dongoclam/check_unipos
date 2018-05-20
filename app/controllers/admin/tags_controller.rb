class Admin::TagsController < AdminController
  before_action :load_tag, only: %i(edit update destroy)

  def index
    @tags = Tag.page(params[:page]).per Settings.paginate.per_page
  end

  def new
    @tag = Tag.new
    render json: {content: render_to_string(partial: "form", locals: {tag: @tag})}
  end

  def create
    @tag = Tag.new tag_params

    if @tag.save
      render json: {
        status: "success",
        content: render_to_string(partial: "tag", locals: {tag: @tag})
      }
    else
      render json: {
        status: "error",
        message: render_to_string(partial: "shared/error_messages", locals: {object: @tag})
      }
    end
  end

  def edit
    render json: {
      status: "success",
      content: render_to_string(partial: "form", locals: {tag: @tag})
    }
  end

  def update
    if @tag.update_attributes tag_params
      render json: {
        status: "success",
        tag_id: @tag.id,
        content: render_to_string(partial: "tag", locals: {tag: @tag})
      }
    else
      render json: {
        status: "error",
        message: render_to_string(partial: "shared/error_messages", locals: {object: @tag})
      }
    end
  end

  def destroy
    if @tag.destroy
      render json: {status: "success"}
    else
      render json: {status: "error"}
    end
  end

  private

  def load_tag
    @tag = Tag.find_by id: params[:id]
  end

  def tag_params
    params.require(:tag).permit :name, :key_name
  end
end
