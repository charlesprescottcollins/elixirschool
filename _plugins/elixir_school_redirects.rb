module ElixirSchoolRedirects
  class Generator < Jekyll::Generator
    def generate(site)
      site.data['redirects'].each do |from, to|
        site.data['contents'].each do |category, pages|
          pages.each do |page|
            if (page == 'home')
              category = ''
              page = 'index'
            end

            site.pages << redirect(site, category, "#{page}.md", from, to)
          end
        end
      end
    end

    def redirect(site, category, page, from, to)
      page = JekyllRedirectFrom::RedirectPage.new(site, site.source, category, page)
      page.set_paths(from, to)
      page
    end
  end
end
