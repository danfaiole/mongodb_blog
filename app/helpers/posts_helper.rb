module PostsHelper
  def timestamps_posts_helper(post)
    html = content_tag(:span, '', class: "glyphicon glyphicon-time")
    html << "Originalmente postado em #{post.criado_em}"

    if post.created_at != post.updated_at
      html << content_tag(:br)
      html << content_tag(:span, '', class: "glyphicon glyphicon-edit")
      html << "Editado em #{post.editado_em}"
    end

    html
  end
end
