module BlogsHelper
  class CodeRayify < Redcarpet::Render::HTML
    def block_code code, language
      CodeRay.scan(code, language).div
    end
  end

  def gravatar_helper user
    if user
      hash = Digest::MD5.hexdigest(user.email)
      image_tag "https://www.gravatar.com/avatar/#{hash}", width: 60
    end
  end

  def markdown text
    coderayfied = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
        fenced_code_blocks: true,
        no_intra_emphasis: true,
        autolink: true,
        lax_html_blocks: true
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayfied, options)
    markdown_to_html.render(text).html_safe
  end
end
